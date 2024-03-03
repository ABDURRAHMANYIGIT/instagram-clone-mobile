import 'dart:developer';

import 'package:instagram_clone_mobile/data/models/post_object.dart';

class UserObject {
  UserObject();
  UserObject.fromJson(Map<String, dynamic> json) {
    try {
      id = json['id'] as int?;
      name = json['name'] as String?;
      profilePhoto = json['profile_photo'] as String?;
      email = json['email'] as String?;
      followings = (json['followings'] as List<dynamic>)
          .map((dynamic item) =>
              UserObject.fromJson(item as Map<String, dynamic>))
          .toList();
      followers = (json['followers'] as List<dynamic>)
          .map((dynamic item) =>
              UserObject.fromJson(item as Map<String, dynamic>))
          .toList();
      posts = (json['posts'] as List<dynamic>)
          .map((dynamic item) =>
              PostObject.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      log(e.toString());
    }
  }
  int? id;
  String? name;
  String? email;
  String? profilePhoto;
  List<UserObject> followings = [];
  List<UserObject> followers = [];
  List<PostObject> posts = [];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'profile_photo': profilePhoto,
      'email': email,
      'followings': followings,
      'followers': followers,
      'posts': posts,
      'fields': <String, dynamic>{},
      'file_fields': <String, dynamic>{},
    };
  }

  UserObject copyWith({
    final int? id,
    final String? name,
  }) {
    return UserObject()
      ..id = id ?? this.id
      ..name = name ?? this.name;
  }

  @override
  String toString() => 'UserObject { UserObject: $id }';
}
