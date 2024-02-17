import 'dart:convert' as convert;
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:instagram_clone_mobile/data/models/user_object.dart';
import 'package:instagram_clone_mobile/domain/helpers/shared_preferences.dart';
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
        }
      } catch (e) {
        log(e.toString());
      }
    }
    return null;
  }

  @override
  Future<bool> login({email = String, password = String}) async {
    var result = false;
    try {
      final http.Response response = await http.post(Uri.parse('$domain/login'),
          headers: _Headers().getHeaderUnauth(),
          body: {
            'email': email,
            'password': password,
          });
      final dynamic body = convert.jsonDecode(response.body);
      if (response.statusCode == 200) {
        result = true;
        return SharedPreference().setToken('Bearer ${body['token']}');
      } else {
        await SharedPreference().setToken(null);
        await SharedPreference().setUserId(null);
      }
    } catch (e) {
      log(e.toString());
    }
    return result;
  }

  @override
  Future<bool> register(
      {email = String,
      password = String,
      passwordConfirmation = String}) async {
    var result = false;
    try {
      final http.Response response = await http.post(Uri.parse('$domain/login'),
          headers: _Headers().getHeaderUnauth(),
          body: {
            'email': email,
            'password': password,
            'password_confirmation': passwordConfirmation
          });
      final dynamic body = convert.jsonDecode(response.body);
      if (response.statusCode == 200) {
        result = true;
        return SharedPreference().setToken('Bearer ${body['token']}');
      } else {
        await SharedPreference().setToken(null);
        await SharedPreference().setUserId(null);
      }
    } catch (e) {
      log(e.toString());
    }
    return result;
  }
}
