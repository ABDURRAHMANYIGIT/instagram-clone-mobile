import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:instagram_clone_mobile/data/enums/bottom_bar_item.dart';
import 'package:instagram_clone_mobile/domain/controllers/screen_controllers/main_screen_controller.dart';
import 'package:instagram_clone_mobile/presentation/layouts/main_layout.dart';
import 'package:instagram_clone_mobile/presentation/screens/main_screen/widgets/bottom_navigation.dart';
import 'package:instagram_clone_mobile/presentation/screens/main_screen/widgets/tab_navigator_create_post.dart';
import 'package:instagram_clone_mobile/presentation/screens/main_screen/widgets/tab_navigator_explore.dart';
import 'package:instagram_clone_mobile/presentation/screens/main_screen/widgets/tab_navigator_home.dart';
import 'package:instagram_clone_mobile/presentation/screens/main_screen/widgets/tab_navigator_profile.dart';
import 'package:instagram_clone_mobile/presentation/screens/main_screen/widgets/tab_navigator_reels.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MainScreenController mainScreenController =
        Get.put(MainScreenController());
    return Obx(() {
      return MainLayout(
        content: Stack(
          children: <Widget>[
            BuildOffstageNavigator(
              currentTab: mainScreenController.currentTab.value,
              navigatorKeys: mainScreenController.navigatorKeys,
              tabItem: BottomBarItem.home,
              navigator: TabNavigatorHome(
                navigatorKey:
                    mainScreenController.navigatorKeys[BottomBarItem.home],
                tabItem: BottomBarItem.home,
              ),
            ),
            BuildOffstageNavigator(
              currentTab: mainScreenController.currentTab.value,
              navigatorKeys: mainScreenController.navigatorKeys,
              tabItem: BottomBarItem.explore,
              navigator: TabNavigatorExplore(
                navigatorKey:
                    mainScreenController.navigatorKeys[BottomBarItem.explore],
                tabItem: BottomBarItem.explore,
              ),
            ),
            BuildOffstageNavigator(
              currentTab: mainScreenController.currentTab.value,
              navigatorKeys: mainScreenController.navigatorKeys,
              tabItem: BottomBarItem.createPost,
              navigator: TabNavigatorCreatePost(
                navigatorKey: mainScreenController
                    .navigatorKeys[BottomBarItem.createPost],
                tabItem: BottomBarItem.createPost,
              ),
            ),
            BuildOffstageNavigator(
              currentTab: mainScreenController.currentTab.value,
              navigatorKeys: mainScreenController.navigatorKeys,
              tabItem: BottomBarItem.reels,
              navigator: TabNavigatorReels(
                navigatorKey:
                    mainScreenController.navigatorKeys[BottomBarItem.reels],
                tabItem: BottomBarItem.reels,
              ),
            ),
            BuildOffstageNavigator(
              currentTab: mainScreenController.currentTab.value,
              navigatorKeys: mainScreenController.navigatorKeys,
              tabItem: BottomBarItem.profile,
              navigator: TabNavigatorProfile(
                navigatorKey:
                    mainScreenController.navigatorKeys[BottomBarItem.profile],
                tabItem: BottomBarItem.profile,
              ),
            ),
          ],
        ),
        bottomNavigationBar: const BottomNavigation(),
      );
    });
  }
}

class BuildOffstageNavigator extends StatelessWidget {
  const BuildOffstageNavigator({
    super.key,
    required this.currentTab,
    required this.navigatorKeys,
    required this.tabItem,
    required this.navigator,
  });
  final BottomBarItem currentTab;
  final Map<BottomBarItem, GlobalKey<NavigatorState>> navigatorKeys;
  final BottomBarItem tabItem;
  final Widget navigator;
  @override
  Widget build(BuildContext context) {
    return Offstage(
      offstage: currentTab != tabItem,
      child: navigator,
    );
  }
}
