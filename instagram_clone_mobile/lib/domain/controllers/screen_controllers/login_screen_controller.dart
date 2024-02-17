import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:instagram_clone_mobile/domain/controllers/data_controllers/auth_controller.dart';

class LoginScreenController extends GetxController {
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  final AuthController _authController = Get.find();

  Future<bool> login() async {
    return _authController.login(
        email: emailTextEditingController.text,
        password: passwordTextEditingController.text);
  }
}
