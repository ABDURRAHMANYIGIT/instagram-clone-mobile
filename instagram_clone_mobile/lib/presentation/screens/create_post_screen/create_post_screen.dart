import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:instagram_clone_mobile/domain/controllers/screen_controllers/create_post_screen_controller.dart';
import 'package:instagram_clone_mobile/presentation/global_components/button/custom_button.dart';
import 'package:instagram_clone_mobile/presentation/global_components/custom_text_form_field.dart';
import 'package:instagram_clone_mobile/presentation/global_components/text/custom_text.dart';
import 'package:instagram_clone_mobile/presentation/layouts/main_layout.dart';
import 'package:instagram_clone_mobile/resources/styles/colors.dart';
import 'package:instagram_clone_mobile/resources/styles/text_styles.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CreatePostScreenController createPostScreenController =
        Get.put(CreatePostScreenController());
    return MainLayout(
      content: GestureDetector(
        onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
        child: SingleChildScrollView(
          child: SizedBox(
            height: Get.height * 0.9,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Obx(() {
                    return GestureDetector(
                      onTap: () =>
                          createPostScreenController.selectImageFromGalery(),
                      child: Container(
                        width: Get.width,
                        height: Get.width,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.background,
                            ),
                            borderRadius: BorderRadius.circular(12)),
                        child: createPostScreenController.selectedImage != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: Image.file(
                                  createPostScreenController.selectedImage!,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Center(
                                child: CustomText(
                                  'Select image from galery',
                                  style: AppTextStyle.bodyMedium(
                                      color: AppColors.background),
                                ),
                              ),
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomTextFormField(
                      label: 'Description',
                      hintText: 'Write a description about your post',
                      controller: createPostScreenController
                          .descriptionTextEditingController),
                  const Spacer(),
                  Obx(() {
                    return CustomButton(
                      onTap: createPostScreenController.createPost,
                      width: Get.width,
                      child: const CustomText('Share'),
                    );
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
