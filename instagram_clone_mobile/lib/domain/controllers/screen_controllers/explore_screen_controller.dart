import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone_mobile/data/models/post_object.dart';
import 'package:instagram_clone_mobile/domain/controllers/data_controllers/post_controller.dart';

class ExploreScreenController extends GetxController {
  final PostController postController = Get.find();
  final ScrollController scrollController = ScrollController();
  final RxInt _currentPage = RxInt(1);
  int get currentPage => _currentPage.value;
  List<PostObject?> get postList => postController.postObjectList;
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
}
