import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:instagram_clone_mobile/domain/controllers/screen_controllers/profile_screen_controller.dart';
import 'package:instagram_clone_mobile/presentation/global_components/avatar_widget.dart';
import 'package:instagram_clone_mobile/presentation/global_components/profile_number_information_widget.dart';
import 'package:instagram_clone_mobile/presentation/global_components/text/custom_text.dart';
import 'package:instagram_clone_mobile/presentation/layouts/main_layout.dart';
import 'package:instagram_clone_mobile/resources/styles/colors.dart';
import 'package:instagram_clone_mobile/resources/styles/text_styles.dart';

import '../../global_components/post/small_post_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileScreenController _profileScreenController =
        Get.put(ProfileScreenController());
    return MainLayout(
      content: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AvatarWidget(
                        imagePath:
                            _profileScreenController.authUser?.profilePhoto ??
                                '',
                        height: Get.width * 0.2,
                        width: Get.width * 0.2,
                      ),
                      Row(
                        children: [
                          ProfileNumberInformation(
                              number: _profileScreenController
                                      .authUser?.posts.length ??
                                  0,
                              title: 'Posts'),
                          GestureDetector(
                            onTap: _profileScreenController.showFollowersPopup,
                            child: ProfileNumberInformation(
                                number: _profileScreenController
                                        .authUser?.followers.length ??
                                    0,
                                title: 'Followers'),
                          ),
                          GestureDetector(
                            onTap: _profileScreenController.showFollowingsPopup,
                            child: ProfileNumberInformation(
                                number: _profileScreenController
                                        .authUser?.followings.length ??
                                    0,
                                title: 'Followings'),
                          ),
                        ],
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomText(
                        _profileScreenController.authUser?.name ?? '',
                        style: AppTextStyle.bodyMedium(color: AppColors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (_profileScreenController.authUser!.posts.isNotEmpty)
              GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  shrinkWrap: true,
                  itemCount: _profileScreenController.authUser?.posts.length,
                  itemBuilder: (context, index) {
                    return SmallPostWidget(
                        postObject:
                            _profileScreenController.authUser!.posts[index]);
                  })
            else
              Container()
          ],
        ),
      ),
    );
  }
}
