import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:instagram_clone_mobile/data/models/user_object.dart';
import 'package:instagram_clone_mobile/presentation/global_components/common_dialog.dart';
import 'package:instagram_clone_mobile/presentation/global_components/small_user_information.dart';
import 'package:instagram_clone_mobile/presentation/global_components/text/custom_text.dart';
import 'package:instagram_clone_mobile/resources/styles/colors.dart';
import 'package:instagram_clone_mobile/resources/styles/text_styles.dart';

class ShowPopups {
  void showFollowingsPopup(UserObject user) {
    if (user.followings.isEmpty) return;
    showCommonDialog(
        isLarge: true,
        title: CustomText(
          'Followings',
          style: AppTextStyle.h6(color: AppColors.black),
        ),
        body: Container(
          constraints: BoxConstraints(maxHeight: Get.height * 0.5),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: user.followings.length,
              itemBuilder: ((context, index) {
                return SmallUserInformation(userObject: user.followings[index]);
              })),
        ),
        onConfirm: () {
          Get.back();
        },
        dialogName: 'Followings Popup');
  }

  void showFollowersPopup(UserObject user) {
    if (user.followers.isEmpty) return;
    showCommonDialog(
        isLarge: true,
        title: CustomText(
          'Followers',
          style: AppTextStyle.h6(color: AppColors.black),
        ),
        body: Container(
          constraints: BoxConstraints(maxHeight: Get.height * 0.5),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: user.followers.length,
              itemBuilder: ((context, index) {
                return SmallUserInformation(userObject: user.followers[index]);
              })),
        ),
        onConfirm: () {
          Get.back();
        },
        dialogName: 'Followers Popup');
  }
}
