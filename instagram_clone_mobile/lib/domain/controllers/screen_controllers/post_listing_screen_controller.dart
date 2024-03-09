import 'package:get/get.dart';
import 'package:instagram_clone_mobile/data/models/user_object.dart';
import 'package:instagram_clone_mobile/domain/controllers/data_controllers/post_controller.dart';
import 'package:instagram_clone_mobile/domain/controllers/data_controllers/user_controller.dart';

class PostListingScreenController extends GetxController {
  final PostController postController = Get.find();
  final UserController _userController = Get.find();

  List<int?> get likedPostIds => postController.likedPostIds;
  UserObject? get authUser => _userController.user;

  Future<void> likePost({required int id}) async {
    await postController.likePost(id: id);
  }

  Future<void> followUser({int? userId}) async {
    if (userId == null) return;
    await _userController.followUser(userId: userId);
  }
}
