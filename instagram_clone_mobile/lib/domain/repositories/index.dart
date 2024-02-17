import 'package:instagram_clone_mobile/data/models/user_object.dart';
import 'package:instagram_clone_mobile/data/repositories/api.dart';
import 'package:instagram_clone_mobile/domain/repositories/base_services.dart';

class DatabaseServices implements BaseServices {
  factory DatabaseServices() => _instance;
  DatabaseServices._internal();
  static final DatabaseServices _instance = DatabaseServices._internal();
  BaseServices api = Api();

  @override
  Future<int> getExample() {
    return api.getExample();
  }

  @override
  Future<UserObject?> getUser() {
    return api.getUser();
  }

  @override
  Future<bool> login({
    required String email,
    required String password,
  }) {
    return api.login(email: email, password: password);
  }

  @override
  Future<bool> register(
      {required String email,
      required String password,
      required String passwordConfirmation}) {
    return api.register(
        email: email,
        password: password,
        passwordConfirmation: passwordConfirmation);
  }
}
