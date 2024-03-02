import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:instagram_clone_mobile/domain/controllers/screen_controllers/register_screen_controller.dart';
import 'package:instagram_clone_mobile/domain/router/router.dart';
import 'package:instagram_clone_mobile/presentation/global_components/button/custom_button.dart';
import 'package:instagram_clone_mobile/presentation/global_components/custom_text_form_field.dart';
import 'package:instagram_clone_mobile/presentation/global_components/image/image_asset.dart';
import 'package:instagram_clone_mobile/presentation/global_components/text/custom_text.dart';
import 'package:instagram_clone_mobile/presentation/layouts/main_layout.dart';
import 'package:instagram_clone_mobile/resources/file_paths/icons.dart';
import 'package:instagram_clone_mobile/resources/styles/colors.dart';
import 'package:instagram_clone_mobile/resources/styles/text_styles.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterScreenController registerScreenController =
        Get.put(RegisterScreenController());
    return MainLayout(
        content: GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Center(
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
                    controller:
                        registerScreenController.emailTextEditingController,
                    label: 'Email'),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  controller:
                      registerScreenController.passwordTextEditingController,
                  label: 'Password',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  controller: registerScreenController
                      .passwordConfirmationTextEditingController,
                  label: 'Password Confirmation',
                ),
                const SizedBox(
                  height: 20,
                ),
                Obx(() {
                  return CustomButton(
                    width: Get.width,
                    onTap: registerScreenController.register,
                    inProgress: registerScreenController.registerInProgress,
                    child: const CustomText('Register'),
                  );
                }),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CustomText(
                      'Already have account?',
                      style:
                          AppTextStyle.bodyMedium(color: AppColors.background),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRouter.loginRoute);
                      },
                      child: CustomText(
                        'Login',
                        style: AppTextStyle.bodyMedium(color: AppColors.blue),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
