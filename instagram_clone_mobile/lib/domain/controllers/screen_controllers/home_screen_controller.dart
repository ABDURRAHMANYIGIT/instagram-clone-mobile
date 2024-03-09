import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:instagram_clone_mobile/data/models/post_object.dart';
import 'package:instagram_clone_mobile/data/models/user_object.dart';
import 'package:instagram_clone_mobile/domain/controllers/data_controllers/post_controller.dart';
import 'package:instagram_clone_mobile/domain/controllers/data_controllers/user_controller.dart';

class HomeScreenController extends GetxController {
  final PostController postController = Get.find();
  final UserController _userController = Get.find();
  final ScrollController scrollController = ScrollController();
  final RxInt _currentPage = RxInt(1);
  int get currentPage => _currentPage.value;
  List<PostObject?> get postObjectList => postController.postObjectList;
  List<int?> get likedPostIds => postController.likedPostIds;
  UserObject? get authUser => _userController.user;
  final RxBool _inProgress = RxBool(false);
  bool get inProgress => _inProgress.value;
  @override
  Future<void> onInit() async {
    postController.clearList();
    await loadPosts();
    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        await loadPosts();
      }
    });
    super.onInit();
  }

  Future<void> loadPosts() async {
    _inProgress.value = true;
    await postController.loadPosts(currentPage: currentPage);
    _currentPage.value++;
    _inProgress.value = false;
    update();
  }

  Future<void> likePost({required int id}) async {
    await postController.likePost(id: id);
  }

  Future<void> followUser({int? userId}) async {
    if (userId == null) return;
    await _userController.followUser(userId: userId);
  }
}
