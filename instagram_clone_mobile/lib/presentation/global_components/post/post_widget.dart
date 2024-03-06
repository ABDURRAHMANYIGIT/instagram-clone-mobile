import 'package:float_column/float_column.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone_mobile/data/models/post_object.dart';
import 'package:instagram_clone_mobile/domain/controllers/screen_controllers/home_screen_controller.dart';
import 'package:instagram_clone_mobile/presentation/global_components/avatar_widget.dart';
import 'package:instagram_clone_mobile/presentation/global_components/image/image_asset.dart';
import 'package:instagram_clone_mobile/presentation/global_components/text/custom_text.dart';
import 'package:instagram_clone_mobile/resources/file_paths/icons.dart';
import 'package:instagram_clone_mobile/resources/styles/colors.dart';
import 'package:instagram_clone_mobile/resources/styles/text_styles.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key, required this.postObject});
  final PostObject postObject;
  @override
  Widget build(BuildContext context) {
    final HomeScreenController homeScreenController = Get.find();
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              AvatarWidget(imagePath: postObject.user?.profilePhoto ?? ''),
              const SizedBox(
                width: 12,
              ),
              CustomText(
                postObject.user?.name ?? '',
                style: AppTextStyle.bodyMedium(color: AppColors.black),
              ),
              const Spacer(),
              if (postObject.user?.id != homeScreenController.authUser?.id)
                Obx(() {
                  return GestureDetector(
                    onTap: () => homeScreenController.followUser(
                        userId: postObject.user?.id),
                    child: CustomText(
                      homeScreenController.authUser != null &&
                              homeScreenController.authUser!.followings.any(
                                  (element) =>
                                      element.id == postObject.user?.id)
                          ? 'Unfollow'
                          : 'Follow',
                      style: AppTextStyle.bodyMedium(color: AppColors.blue),
                    ),
                  );
                }),
            ],
          ),
        ),
        postObject.image != null
            ? GestureDetector(
                onDoubleTap: () =>
                    homeScreenController.likePost(id: postObject.id),
                child: ImageAsset(
                  postObject.image!,
                  width: Get.width,
                  height: Get.width,
                  fit: BoxFit.cover,
                ),
              )
            : SizedBox(
                width: Get.width,
                height: Get.width,
                child: CustomText(
                  'Post couldnt loaded',
                  style: AppTextStyle.h6(),
                ),
              ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: (() =>
                          homeScreenController.likePost(id: postObject.id)),
                      child: ImageAsset(
                        homeScreenController.likedPostIds
                                .contains(postObject.id)
                            ? AppIcons.likeFilled
                            : AppIcons.like,
                        width: 20,
                        height: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const ImageAsset(
                      AppIcons.comment,
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const ImageAsset(
                      AppIcons.share,
                      width: 20,
                      height: 20,
                    )
                  ],
                ),
                const ImageAsset(
                  AppIcons.save,
                  width: 20,
                  height: 20,
                )
              ],
            );
          }),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: FloatColumn(
            children: [
              Floatable(
                float: FCFloat.left,
                padding: const EdgeInsets.only(right: 8),
                child: CustomText(
                  postObject.user?.name ?? '',
                  style: AppTextStyle.bodyMedium(
                      weight: AppTextStyle.fontBold, color: AppColors.black),
                ),
              ),
              WrappableText(
                text: TextSpan(text: postObject.description ?? ''),
              )
            ],
          ),
        ),
      ],
    );
  }
}
