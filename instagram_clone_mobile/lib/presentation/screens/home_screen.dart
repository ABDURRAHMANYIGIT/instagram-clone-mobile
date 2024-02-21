import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:instagram_clone_mobile/domain/controllers/screen_controllers/home_screen_controller.dart';
import 'package:instagram_clone_mobile/presentation/global_components/post_widget.dart';
import 'package:instagram_clone_mobile/presentation/layouts/main_layout.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeScreenController homeScreenController =
        Get.put(HomeScreenController());
    return MainLayout(content: Obx(() {
      return homeScreenController.postObjectList.isNotEmpty
          ? LazyLoadScrollView(
              onEndOfPage: () => homeScreenController.loadPosts(),
              child: ListView.builder(
                itemCount: homeScreenController.postObjectList.length,
                itemBuilder: ((context, index) {
                  return PostWidget(
                    postObject: homeScreenController.postObjectList[index]!,
                  );
                }),
              ),
            )
          : Container();
    }));
  }
}
