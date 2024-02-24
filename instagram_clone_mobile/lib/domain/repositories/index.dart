import 'dart:io';

import 'package:instagram_clone_mobile/data/models/post_object.dart';
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

  @override
  Future<List<PostObject?>> getPosts({required int currentPage}) {
    return api.getPosts(currentPage: currentPage);
  }

  @override
  Future<bool> likePost({required int id}) {
    return api.likePost(id: id);
  }

  @override
  Future<List<int?>> getLikedPostIds() {
    return api.getLikedPostIds();
  }

  @override
  Future<List<PostObject?>> getLikedPosts({required int currentPage}) {
    return api.getLikedPosts(currentPage: currentPage);
  }

  @override
  Future<bool> createPost({String? description, required File file}) {
    return api.createPost(file: file, description: description);
  }
}
