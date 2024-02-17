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
          Uri.parse('$domain/user/get-user'),
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
}
