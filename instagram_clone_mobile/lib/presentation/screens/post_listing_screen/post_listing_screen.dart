import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone_mobile/data/models/post_object.dart';
import 'package:instagram_clone_mobile/domain/controllers/screen_controllers/post_listing_screen_controller.dart';
import 'package:instagram_clone_mobile/presentation/global_components/post/post_widget.dart';
import 'package:instagram_clone_mobile/presentation/layouts/main_layout.dart';

class PostListingScreen extends StatelessWidget {
  const PostListingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final PostListingScreenController postListingScreenController =
        Get.put(PostListingScreenController());
    final postList = Get.arguments as List<PostObject?>;
    return MainLayout(
      content: postList.isNotEmpty
          ? ListView.builder(
              shrinkWrap: true,
              itemCount: postList.length,
              itemBuilder: ((context, index) {
                final post = postList[index];
                return post != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Hero(
                          tag: 'post-${post.id}',
                          child: Obx(() {
                            return PostWidget(
                              followUser: () => postListingScreenController
                                  .followUser(userId: post.user?.id),
                              likePost: () => postListingScreenController
                                  .likePost(id: post.id),
                              likedPostIds:
                                  postListingScreenController.likedPostIds,
                              authUser: postListingScreenController.authUser,
                              postObject: post,
                            );
                          }),
                        ),
                      )
                    : const SizedBox();
              }),
            )
          : Container(),
    );
  }
}
