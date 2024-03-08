import 'package:get/get.dart';
import 'package:instagram_clone_mobile/data/models/post_object.dart';
import 'package:instagram_clone_mobile/data/models/user_object.dart';
import 'package:instagram_clone_mobile/domain/controllers/data_controllers/auth_controller.dart';
import 'package:instagram_clone_mobile/domain/repositories/index.dart';

class UserController extends GetxController {
  final DatabaseServices _databaseServices = DatabaseServices();
  final AuthController _authController = Get.find();

  UserObject? get user => _authController.getAuthUser;

  Future<bool> followUser({required int userId}) async {
    final result = _databaseServices.followUser(userId: userId);
    _authController.getUser();
    update();
    return result;
  }

  Future<List<PostObject>> getMyPosts() async {
    return await _databaseServices.getMyPosts();
  }

  Future<UserObject?> getUserById({required int userId}) async {
    return await _databaseServices.getUserById(userId: userId);
  }
}
