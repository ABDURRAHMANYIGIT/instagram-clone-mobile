import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:instagram_clone_mobile/domain/controllers/screen_controllers/login_screen_controller.dart';
import 'package:instagram_clone_mobile/presentation/global_components/button/custom_button.dart';
import 'package:instagram_clone_mobile/presentation/global_components/custom_text_form_field.dart';
import 'package:instagram_clone_mobile/presentation/global_components/image/image_asset.dart';
import 'package:instagram_clone_mobile/presentation/global_components/text/custom_text.dart';
import 'package:instagram_clone_mobile/presentation/layouts/main_layout.dart';
import 'package:instagram_clone_mobile/resources/file_paths/icons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginScreenController loginScreenController =
        Get.put(LoginScreenController());
    return MainLayout(
        content: Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              ImageAsset(
                AppIcons.instagramIcon,
                width: Get.width * 0.2,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                  controller: loginScreenController.emailTextEditingController,
                  label: 'Email'),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                controller: loginScreenController.passwordTextEditingController,
                label: 'Password',
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(() {
                return CustomButton(
                  child: CustomText('Login'),
                  width: Get.width,
                  onTap: loginScreenController.login,
                  inProgress: loginScreenController.loginInProgress,
                );
              })
            ],
          ),
        ),
      ),
    ));
  }
}
