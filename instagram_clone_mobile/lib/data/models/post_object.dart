import 'dart:developer';

class PostObject {
  PostObject({
    required int id,
    required String description,
    required String image,
  });
  PostObject.fromJson(Map<String, dynamic> json) {
    try {
      id = json['id'] as int;
      userId = json['user_id'] as int?;
      description = json['description'] as String?;
      image = json['image'] as String?;
    } catch (e) {
      log(e.toString());
    }
  }
  int? id;
  int? userId;
  String? description;
  String? image;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'user_id': userId,
      'description': description,
      'image': image,
      'fields': <String, dynamic>{},
      'file_fields': <String, dynamic>{},
    };
  }
}
