import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:instagram_clone_mobile/domain/controllers/data_controllers/auth_controller.dart';
import 'package:instagram_clone_mobile/domain/router/router.dart';

class LoginScreenController extends GetxController {
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  final RxBool _loginInProgress = RxBool(false);
  bool get loginInProgress => _loginInProgress.value;
  final AuthController _authController = Get.find();

  Future<void> login() async {
    _loginInProgress.value = true;
    update();
    final bool result = await _authController.login(
        email: emailTextEditingController.text,
        password: passwordTextEditingController.text);
    Future.delayed(Duration(seconds: 3));
    _loginInProgress.value = false;
    update();
    if (result) {
      Get.toNamed(AppRouter.designRoute);
    }
  }
}
