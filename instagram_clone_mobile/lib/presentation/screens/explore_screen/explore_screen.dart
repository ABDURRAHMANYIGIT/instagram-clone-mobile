import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone_mobile/domain/controllers/screen_controllers/explore_screen_controller.dart';
import 'package:instagram_clone_mobile/domain/router/router.dart';
import 'package:instagram_clone_mobile/presentation/global_components/in_progress_widget.dart';
import 'package:instagram_clone_mobile/presentation/global_components/post/small_post_widget.dart';
import 'package:instagram_clone_mobile/presentation/layouts/main_layout.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ExploreScreenController exploreScreenController =
        Get.put(ExploreScreenController());
    return MainLayout(
      content: Obx(() {
        return SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          controller: exploreScreenController.scrollController,
          child: Column(
            children: [
              RefreshIndicator(
                  onRefresh: exploreScreenController.loadPosts,
                  child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      shrinkWrap: true,
                      itemCount: exploreScreenController.postList.length,
                      itemBuilder: (context, index) {
                        final post = exploreScreenController.postList[index];
                        return GestureDetector(
                          onTap: () => Get.toNamed(AppRouter.postListingRoute,
                              arguments: exploreScreenController.postList),
                          child: Hero(
                            tag: 'post-${post!.id}',
                            child: SmallPostWidget(postObject: post),
                          ),
                        );
                      })),
              Obx(() {
                if (exploreScreenController.inProgress) {
                  return const Center(child: InProgressWidget());
                } else {
                  return const SizedBox.shrink();
                }
              }),
              const SizedBox(
                height: kBottomNavigationBarHeight * 2,
              )
            ],
          ),
        );
      }),
    );
  }
}
