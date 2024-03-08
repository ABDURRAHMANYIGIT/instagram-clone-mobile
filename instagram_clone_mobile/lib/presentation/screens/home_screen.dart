import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone_mobile/domain/controllers/screen_controllers/home_screen_controller.dart';
import 'package:instagram_clone_mobile/presentation/global_components/post/post_widget.dart';
import 'package:instagram_clone_mobile/presentation/global_components/text/custom_text.dart';
import 'package:instagram_clone_mobile/presentation/layouts/main_layout.dart';

import '../global_components/in_progress_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeScreenController homeScreenController =
        Get.put(HomeScreenController());
    return MainLayout(content: Obx(() {
      return homeScreenController.postObjectList.isNotEmpty
          ? SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              controller: homeScreenController.scrollController,
              child: Column(
                children: [
                  RefreshIndicator(
                    onRefresh: homeScreenController.loadPosts,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: homeScreenController.postObjectList.length,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: PostWidget(
                            postObject:
                                homeScreenController.postObjectList[index]!,
                          ),
                        );
                      }),
                    ),
                  ),
                  Obx(() {
                    if (homeScreenController.inProgress) {
                      return const InProgressWidget();
                    } else {
                      return const SizedBox.shrink();
                    }
                  }),
                ],
              ),
            )
          : const CustomText('No Post found');
    }));
  }
}
