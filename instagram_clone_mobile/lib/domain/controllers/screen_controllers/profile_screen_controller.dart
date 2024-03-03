import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:instagram_clone_mobile/data/models/user_object.dart';
import 'package:instagram_clone_mobile/domain/controllers/data_controllers/auth_controller.dart';
import 'package:instagram_clone_mobile/presentation/global_components/common_dialog.dart';
import 'package:instagram_clone_mobile/presentation/global_components/small_user_information.dart';
import 'package:instagram_clone_mobile/presentation/global_components/text/custom_text.dart';
import 'package:instagram_clone_mobile/resources/styles/colors.dart';
import 'package:instagram_clone_mobile/resources/styles/text_styles.dart';

class ProfileScreenController extends GetxController {
  final AuthController _authController = Get.find();

  UserObject? get authUser => _authController.getAuthUser;

  void showFollowingsPopup() {
    if (authUser == null || authUser!.followings.isEmpty) return;
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
              itemCount: authUser!.followings.length,
              itemBuilder: ((context, index) {
                return SmallUserInformation(
                    userObject: authUser!.followings[index]);
              })),
        ),
        onConfirm: () {
          Get.back();
        },
        dialogName: 'Followings Popup');
  }

  void showFollowersPopup() {
    if (authUser == null || authUser!.followers.isEmpty) return;
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
              itemCount: authUser!.followers.length,
              itemBuilder: ((context, index) {
                return SmallUserInformation(
                    userObject: authUser!.followers[index]);
              })),
        ),
        onConfirm: () {
          Get.back();
        },
        dialogName: 'Followers Popup');
  }
}
