import 'dart:convert' as convert;
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:instagram_clone_mobile/data/models/post_object.dart';

import 'package:instagram_clone_mobile/data/models/user_object.dart';
import 'package:instagram_clone_mobile/domain/helpers/shared_preferences.dart';
import 'package:instagram_clone_mobile/domain/helpers/tools_helper.dart';
import 'package:instagram_clone_mobile/domain/repositories/base_services.dart';
import 'package:instagram_clone_mobile/resources/config/app_logic.dart';
part 'headers.dart';

class Api implements BaseServices {
  String domain = AppLogic().getLocalPath();

  @override
  Future<int> getExample() {
    // TODO: implement getExample
    throw UnimplementedError();
  }

  @override
  Future<UserObject?> getUser() async {
    String? token;
    token = await SharedPreference().getToken();

    if (token != null) {
      try {
        final http.Response response = await http.get(
          Uri.parse('$domain/user'),
          headers: _Headers().getHeaderWithAuthToken(token),
        );
        final dynamic body = convert.jsonDecode(response.body);
        if (response.statusCode == 200) {
          return UserObject.fromJson(
            body['data'] as Map<String, dynamic>,
          );
        } else {
          await SharedPreference().setToken(null);
          await SharedPreference().setUserId(null);
          Tools().handleError(body: body as Map<String, dynamic>);
        }
      } catch (e) {
        log(e.toString());
      }
    }
    return null;
  }

  @override
  Future<bool> login({
    required String email,
    required String password,
  }) async {
    var result = false;
    try {
      final http.Response response = await http.post(
        Uri.parse('$domain/login'),
        body: convert.jsonEncode(
          <String, dynamic>{
            'email': email,
            'password': password,
          },
        ),
        headers: _Headers().getHeaderUnauth(),
      );
      final dynamic body = convert.jsonDecode(response.body);
      if (response.statusCode == 200) {
        result = true;
        return SharedPreference().setToken('Bearer ${body['token']}');
      } else {
        await SharedPreference().setToken(null);
        await SharedPreference().setUserId(null);
        Tools().handleError(body: body as Map<String, dynamic>);
      }
    } catch (e) {
      log(e.toString());
    }
    return result;
  }

  @override
  Future<bool> register(
      {required String email,
      required String password,
      required String passwordConfirmation}) async {
    var result = false;
    try {
      final http.Response response = await http.post(
        Uri.parse('$domain/register'),
        body: convert.jsonEncode(
          <String, dynamic>{
            'email': email,
            'password': password,
            'password_confirmation': passwordConfirmation
          },
        ),
        headers: _Headers().getHeaderUnauth(),
      );
      final dynamic body = convert.jsonDecode(response.body);
      if (response.statusCode == 200) {
        result = true;
        return SharedPreference().setToken('Bearer ${body['token']}');
      } else {
        await SharedPreference().setToken(null);
        await SharedPreference().setUserId(null);
        Tools().handleError(body: body as Map<String, dynamic>);
      }
    } catch (e) {
      log(e.toString());
    }
    return result;
  }

  @override
  Future<List<PostObject?>> getPosts({required int currentPage}) async {
    String? token;
    token = await SharedPreference().getToken();
    final List<PostObject?> result = [];
    if (token != null) {
      try {
        final http.Response response = await http.get(
          Uri.parse('$domain/posts?$currentPage'),
          headers: _Headers().getHeaderWithAuthToken(token),
        );
        final dynamic body = convert.jsonDecode(response.body);
        if (response.statusCode == 200) {
          for (var object in body['data']) {
            result.add(PostObject.fromJson(object));
          }
        } else {
          Tools().handleError(body: body as Map<String, dynamic>);
        }
      } catch (e) {
        log(e.toString());
      }
    }
    return result;
  }

  @override
  Future<bool> likePost({required int id}) async {
    String? token;
    token = await SharedPreference().getToken();
    bool result = false;
    if (token != null) {
      try {
        final http.Response response = await http.post(
          Uri.parse('$domain/post/like/$id'),
          headers: _Headers().getHeaderWithAuthToken(token),
        );
        final dynamic body = convert.jsonDecode(response.body);
        if (response.statusCode == 200) {
          result = true;
        } else {
          Tools().handleError(body: body as Map<String, dynamic>);
        }
      } catch (e) {
        log(e.toString());
      }
    }
    return result;
  }

  @override
  Future<List<int?>> getLikedPostIds() async {
    String? token;
    token = await SharedPreference().getToken();
    List<int?> result = [];
    if (token != null) {
      try {
        final http.Response response = await http.get(
          Uri.parse('$domain/user/get-liked-post-ids'),
          headers: _Headers().getHeaderWithAuthToken(token),
        );
        final dynamic body = convert.jsonDecode(response.body);
        if (response.statusCode == 200) {
          result = (body['data'] as List<dynamic>).cast<int?>();
        } else {
          Tools().handleError(body: body as Map<String, dynamic>);
        }
      } catch (e) {
        log(e.toString());
      }
    }
    return result;
  }

  @override
  Future<List<PostObject?>> getLikedPosts({required int currentPage}) async {
    String? token;
    token = await SharedPreference().getToken();
    final List<PostObject?> result = [];
    if (token != null) {
      try {
        final http.Response response = await http.get(
          Uri.parse('$domain/user/get-liked-posts?$currentPage'),
          headers: _Headers().getHeaderWithAuthToken(token),
        );
        final dynamic body = convert.jsonDecode(response.body);
        if (response.statusCode == 200) {
          for (var object in body['data']) {
            result.add(PostObject.fromJson(object));
          }
        } else {
          Tools().handleError(body: body as Map<String, dynamic>);
        }
      } catch (e) {
        log(e.toString());
      }
    }
    return result;
  }

  @override
  Future<bool> createPost({String? description, required File file}) async {
    final Uri apiUrl = Uri.parse('$domain/post/create');
    bool result = false;
    // Create a multipart request
    var request = http.MultipartRequest('POST', apiUrl);

    // Add the file to the request
    var fileStream = http.ByteStream(file.openRead());
    var length = await file.length();
    var multipartFile = http.MultipartFile('file', fileStream, length,
        filename: file.path.split('/').last);

    request.files.add(multipartFile);

    // Add other form fields
    if (description != null) {
      request.fields['description'] = description;
    }

    // Send the request
    try {
      var response = await request.send();

      if (response.statusCode == 200) {
        result = true;
      }
    } catch (e) {
      log(e.toString());
    }
    return result;
  }
}
