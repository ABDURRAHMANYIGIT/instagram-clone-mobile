import 'dart:developer';

import 'package:instagram_clone_mobile/data/models/user_object.dart';

class PostObject {
  PostObject({
    required int id,
    required String description,
    required String image,
  });
  PostObject.fromJson(Map<String, dynamic> json) {
    try {
      id = json['id'] as int?;
      user = json['user'] != null ? UserObject.fromJson(json['user']) : null;
      description = json['description'] as String?;
      image = json['image'] as String?;
    } catch (e) {
      log(e.toString());
    }
  }
  int? id;
  UserObject? user;
  String? description;
  String? image;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'user': user,
      'description': description,
      'image': image,
      'fields': <String, dynamic>{},
      'file_fields': <String, dynamic>{},
    };
  }
}
