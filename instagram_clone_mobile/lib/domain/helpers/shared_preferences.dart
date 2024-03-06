//* Seen, LoggedIn, UserID, Token Manager
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  Future<bool> setSeen(bool status) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool('seen', status);
  }

  Future<bool> getSeen() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('seen') ?? false;
  }

  Future<bool> setUserId(String? userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (userId == null) {
      return prefs.remove('user_id');
    }
    return prefs.setString('user_id', userId);
  }

  Future<String?> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_id');
  }

  Future<bool> setToken(String? token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (token == null) {
      return deleteToken();
    }
    return prefs.setString('token', token);
  }

  Future<bool> deleteToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('token');
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<bool> getOnboard() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('show_onboard') ?? true;
  }

  Future<bool> setOnboard(bool onboard) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool('show_onboard', onboard);
  }

  Future<String> getAppLanguage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('app_language') ?? 'en';
  }

  Future<bool> setAppLanguage(String appLanguage) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('app_language', appLanguage);
  }
}
