import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone_mobile/data/enums/bottom_bar_item.dart';
import 'package:instagram_clone_mobile/domain/controllers/screen_controllers/main_screen_controller.dart';
import 'package:instagram_clone_mobile/presentation/global_components/image/image_asset.dart';
import 'package:instagram_clone_mobile/resources/styles/colors.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final MainScreenController mainScreenController = Get.find();

    return Obx(() {
      return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          backgroundColor: AppColors.lightGrey,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          currentIndex:
              BottomBarItem.values.indexOf(mainScreenController.selectedTab),
          onTap: (int index) {
            mainScreenController.selectTab(BottomBarItem.values[index]);
          },
          items: <BottomNavigationBarItem>[
            ...BottomBarItem.values.map((e) {
              return BottomNavigationBarItem(
                  label: e.name,
                  icon: ImageAsset(
                    mainScreenController.selectedTab == e
                        ? e.activeIcon
                        : e.icon,
                    height: 20,
                  ));
            })
          ]);
    });
  }
}
