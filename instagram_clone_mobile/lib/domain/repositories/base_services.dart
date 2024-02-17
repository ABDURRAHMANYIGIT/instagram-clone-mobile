import 'package:instagram_clone_mobile/data/models/user_object.dart';

abstract class BaseServices {
  Future<int> getExample();
  Future<UserObject?> getUser();
}
