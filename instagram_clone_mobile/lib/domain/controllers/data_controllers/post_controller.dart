import 'dart:io';

import 'package:get/get.dart';
import 'package:instagram_clone_mobile/data/models/post_object.dart';
import 'package:instagram_clone_mobile/domain/controllers/data_controllers/auth_controller.dart';
import 'package:instagram_clone_mobile/domain/repositories/index.dart';

class PostController extends GetxController {
  final RxList<PostObject?> _postObjectList = RxList<PostObject?>([]);
  List<PostObject?> get postObjectList => _postObjectList;
  final RxList<PostObject?> _likedPostObjectList = RxList<PostObject?>([]);
  List<PostObject?> get likedPostObjectList => _likedPostObjectList;
  final RxList<int?> _likedPostIds = RxList<int?>([]);
  List<int?> get likedPostIds => _likedPostIds;

  final DatabaseServices _databaseServices = DatabaseServices();
  final AuthController _authController = Get.find();

  Future<void> loadPosts({required int currentPage, int? userId}) async {
    List<PostObject?> newPosts = [];
    if (userId != null) {
      newPosts = await _databaseServices.getUsersPosts(
          currentPage: currentPage, id: userId);
    } else {
      newPosts = await _databaseServices.getPosts(currentPage: currentPage);
    }
    for (var post in newPosts) {
      if (!_postObjectList.any((element) => element!.id == post!.id)) {
        _postObjectList.add(post);
      }
    }
    _postObjectList.refresh();
    update();
  }

  Future<void> likePost({required int id}) async {
    await _databaseServices.likePost(id: id);
    _likedPostIds.value = await _databaseServices.getLikedPostIds();
  }

  Future<bool> createPost({required File file, String? description}) async {
    final result = await _databaseServices.createPost(
        file: file, description: description);
    if (result) {
      await _authController.getUser();
      update();
    }
    return result;
  }

  void clearList() {
    _postObjectList.value = [];
  }
}
