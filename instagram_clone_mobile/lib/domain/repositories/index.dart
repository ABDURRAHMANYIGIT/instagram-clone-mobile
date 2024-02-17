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
}
