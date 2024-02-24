import 'dart:io';

import 'package:get/get.dart';
import 'package:instagram_clone_mobile/data/models/post_object.dart';
import 'package:instagram_clone_mobile/domain/repositories/index.dart';

class PostController extends GetxController {
  final RxList<PostObject?> _postObjectList = RxList<PostObject?>([]);
  List<PostObject?> get postObjectList => _postObjectList;
  final RxList<PostObject?> _likedPostObjectList = RxList<PostObject?>([]);
  List<PostObject?> get likedPostObjectList => _likedPostObjectList;
  final RxList<int?> _likedPostIds = RxList<int?>([]);
  List<int?> get likedPostIds => _likedPostIds;

  final DatabaseServices _databaseServices = DatabaseServices();

  @override
  Future<void> onInit() async {
    await loadPosts(currentPage: 1);
    super.onInit();
  }

  Future<void> loadPosts({required int currentPage}) async {
    _postObjectList.value =
        await _databaseServices.getPosts(currentPage: currentPage);
    _postObjectList.refresh();
    update();
  }

  Future<void> likePost({required int id}) async {
    await _databaseServices.likePost(id: id);
    _likedPostIds.value = await _databaseServices.getLikedPostIds();
  }

  Future<bool> createPost({required File file, String? description}) async {
    return await _databaseServices.createPost(
        file: file, description: description);
  }
}
