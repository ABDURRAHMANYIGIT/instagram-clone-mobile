import 'dart:developer';

class UserObject {
  UserObject();
  UserObject.fromJson(Map<String, dynamic> json) {
    try {
      id = json['id'] as int?;
      name = json['name'] as String?;
      profilePhoto = json['profile_photo'] as String?;
      email = json['email'] as String?;
    } catch (e) {
      log(e.toString());
    }
  }
  int? id;
  String? name;
  String? email;
  String? profilePhoto;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'profile_photo': profilePhoto,
      'email': email,
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
