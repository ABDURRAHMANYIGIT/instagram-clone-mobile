import 'package:instagram_clone_mobile/data/models/user_object.dart';

abstract class BaseServices {
  Future<int> getExample();
  Future<UserObject?> getUser();
  Future<bool> register(
      {required String email,
      required String password,
      required String passwordConfirmation});
  Future<bool> login({
    required String email,
    required String password,
  });
}
