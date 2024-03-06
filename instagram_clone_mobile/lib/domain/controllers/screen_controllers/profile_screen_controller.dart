import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:instagram_clone_mobile/data/models/post_object.dart';
import 'package:instagram_clone_mobile/data/models/user_object.dart';
import 'package:instagram_clone_mobile/domain/controllers/data_controllers/user_controller.dart';
import 'package:instagram_clone_mobile/presentation/global_components/common_dialog.dart';
import 'package:instagram_clone_mobile/presentation/global_components/small_user_information.dart';
import 'package:instagram_clone_mobile/presentation/global_components/text/custom_text.dart';
import 'package:instagram_clone_mobile/resources/styles/colors.dart';
import 'package:instagram_clone_mobile/resources/styles/text_styles.dart';

class ProfileScreenController extends GetxController {
  final UserController _userController = Get.find();

  UserObject? get user => _userController.user;
  final RxList<PostObject> _postList = RxList.empty();
  List<PostObject> get postList => _postList;

  @override
  Future<void> onInit() async {
    _postList.value = await _userController.getMyPosts();
    super.onInit();
  }

  void showFollowingsPopup() {
    if (user == null || user!.followings.isEmpty) return;
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
              itemCount: user!.followings.length,
              itemBuilder: ((context, index) {
                return SmallUserInformation(
                    userObject: user!.followings[index]);
              })),
        ),
        onConfirm: () {
          Get.back();
        },
        dialogName: 'Followings Popup');
  }

  void showFollowersPopup() {
    if (user == null || user!.followers.isEmpty) return;
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
              itemCount: user!.followers.length,
              itemBuilder: ((context, index) {
                return SmallUserInformation(userObject: user!.followers[index]);
              })),
        ),
        onConfirm: () {
          Get.back();
        },
        dialogName: 'Followers Popup');
  }
}
