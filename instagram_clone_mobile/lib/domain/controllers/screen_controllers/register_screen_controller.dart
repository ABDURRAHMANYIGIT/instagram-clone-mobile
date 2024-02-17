import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:instagram_clone_mobile/domain/controllers/data_controllers/auth_controller.dart';
import 'package:instagram_clone_mobile/domain/router/router.dart';

class RegisterScreenController extends GetxController {
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  final TextEditingController passwordConfirmationTextEditingController =
      TextEditingController();
  final AuthController _authController = Get.find();
  final RxBool _registerInProgress = RxBool(false);
  bool get registerInProgress => _registerInProgress.value;

  Future<void> register() async {
    _registerInProgress.value = true;
    update();
    final bool result = await _authController.register(
        email: emailTextEditingController.text,
        password: passwordTextEditingController.text,
        passwordConfirmation: passwordConfirmationTextEditingController.text);
    _registerInProgress.value = false;
    if (result) {
      Get.toNamed(AppRouter.designRoute);
    }
  }
}
