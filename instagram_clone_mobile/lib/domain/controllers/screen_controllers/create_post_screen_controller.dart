import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone_mobile/data/enums/bottom_bar_item.dart';
import 'package:instagram_clone_mobile/domain/controllers/data_controllers/post_controller.dart';
import 'package:instagram_clone_mobile/domain/controllers/screen_controllers/main_screen_controller.dart';

class CreatePostScreenController extends GetxController {
  final PostController _postController = Get.find();
  final MainScreenController _mainScreenController = Get.find();
  final TextEditingController descriptionTextEditingController =
      TextEditingController();
  final Rxn<File> _selectedImage = Rxn<File>();
  File? get selectedImage => _selectedImage.value;

  Future<void> selectImageFromGalery() async {
    final result = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (result == null) return;
    _selectedImage.value = File(result.path);
    update();
  }

  Future<void> createPost() async {
    if (_selectedImage.value == null) return;
    final bool result = await _postController.createPost(
        file: _selectedImage.value!,
        description: descriptionTextEditingController.text);
    if (result) {
      _mainScreenController.selectTab(BottomBarItem.home);
    }
  }
}
