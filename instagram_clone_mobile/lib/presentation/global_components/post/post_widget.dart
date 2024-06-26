import 'package:float_column/float_column.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone_mobile/data/models/post_object.dart';
import 'package:instagram_clone_mobile/data/models/user_object.dart';
import 'package:instagram_clone_mobile/domain/router/router.dart';
import 'package:instagram_clone_mobile/presentation/global_components/avatar_widget.dart';
import 'package:instagram_clone_mobile/presentation/global_components/image/image_asset.dart';
import 'package:instagram_clone_mobile/presentation/global_components/text/custom_text.dart';
import 'package:instagram_clone_mobile/resources/file_paths/icons.dart';
import 'package:instagram_clone_mobile/resources/styles/colors.dart';
import 'package:instagram_clone_mobile/resources/styles/text_styles.dart';

class PostWidget extends StatelessWidget {
  const PostWidget(
      {super.key,
      required this.postObject,
      required this.authUser,
      required this.followUser,
      required this.likePost,
      required this.likedPostIds});
  final PostObject postObject;
  final UserObject? authUser;
  final List<int?> likedPostIds;
  final void Function() followUser;
  final void Function() likePost;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: (() => {
                      if (postObject.user?.id != authUser?.id &&
                          postObject.user?.id != null)
                        {
                          Get.toNamed(AppRouter.otherUserProfileRoute,
                              parameters: {
                                'id': postObject.user!.id.toString()
                              })
                        }
                    }),
                child: Row(
                  children: [
                    AvatarWidget(
                        imagePath: postObject.user?.profilePhoto ?? ''),
                    const SizedBox(
                      width: 12,
                    ),
                    CustomText(
                      postObject.user?.name ?? '',
                      style: AppTextStyle.bodyMedium(color: AppColors.black),
                    ),
                  ],
                ),
              ),
              if (postObject.user?.id != authUser?.id)
                GestureDetector(
                  onTap: followUser,
                  child: CustomText(
                    authUser != null &&
                            authUser!.followings.any(
                                (element) => element.id == postObject.user?.id)
                        ? 'Unfollow'
                        : 'Follow',
                    style: AppTextStyle.bodyMedium(color: AppColors.blue),
                  ),
                ),
            ],
          ),
        ),
        postObject.image != null
            ? GestureDetector(
                onDoubleTap: () => likePost(),
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
                      onTap: likePost,
                      child: ImageAsset(
                        likedPostIds.contains(postObject.id)
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
