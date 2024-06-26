import 'dart:io';

import 'package:instagram_clone_mobile/data/models/post_object.dart';
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
  Future<List<PostObject?>> getPosts({required int currentPage});
  Future<bool> likePost({required int id});
  Future<List<PostObject?>> getLikedPosts({required int currentPage});
  Future<List<int?>> getLikedPostIds();
  Future<bool> createPost({String? description, required File file});
  Future<bool> followUser({required int userId});
  Future<UserObject?> getUserById({required int userId});
  Future<List<PostObject>> getMyPosts();
  Future<List<PostObject?>> getUsersPosts(
      {required int id, required int currentPage});
}
