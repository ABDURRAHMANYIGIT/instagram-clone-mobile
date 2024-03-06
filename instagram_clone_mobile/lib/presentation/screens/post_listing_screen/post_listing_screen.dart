import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone_mobile/domain/controllers/screen_controllers/post_listing_screen_controller.dart';
import 'package:instagram_clone_mobile/presentation/global_components/post/post_widget.dart';

class PostListingScreen extends StatelessWidget {
  const PostListingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final PostListingScreenController postListingScreenController =
        Get.put(PostListingScreenController());
    return postListingScreenController.postList.isNotEmpty
        ? RefreshIndicator(
            onRefresh: postListingScreenController.loadPosts,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: postListingScreenController.postList.length,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: PostWidget(
                    postObject: postListingScreenController.postList[index],
                  ),
                );
              }),
            ),
          )
        : Container();
  }
}
