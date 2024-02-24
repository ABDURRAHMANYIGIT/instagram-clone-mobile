import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:instagram_clone_mobile/data/enums/bottom_bar_item.dart';

class MainScreenController extends GetxController {
  final Rx<BottomBarItem> currentTab = Rx(BottomBarItem.home);

  final Rx<BottomBarItem> _selectedTab = Rx(BottomBarItem.home);
  BottomBarItem get selectedTab => _selectedTab.value;

  final RxInt _currentIndex = RxInt(0);
  int get currentIndex => _currentIndex.value;

  bool get isHomeSelected => currentTab.value == BottomBarItem.home;
  bool get isExploreSelected => currentTab.value == BottomBarItem.explore;
  bool get isCreatePostSelected => currentTab.value == BottomBarItem.createPost;
  bool get isReelsSelected => currentTab.value == BottomBarItem.reels;
  bool get isProfileSelected => currentTab.value == BottomBarItem.profile;

  final Map<BottomBarItem, GlobalKey<NavigatorState>> navigatorKeys =
      <BottomBarItem, GlobalKey<NavigatorState>>{
    BottomBarItem.home: GlobalKey<NavigatorState>(debugLabel: 'HOME'),
    BottomBarItem.explore: GlobalKey<NavigatorState>(debugLabel: 'EXPLORE'),
    BottomBarItem.createPost:
        GlobalKey<NavigatorState>(debugLabel: 'CREATEPOST'),
    BottomBarItem.reels: GlobalKey<NavigatorState>(debugLabel: 'REELS'),
    BottomBarItem.profile: GlobalKey<NavigatorState>(debugLabel: 'PROFILE'),
  };

  void selectTab(BottomBarItem tabItem) {
    _selectedTab.value = tabItem;
    if (tabItem == currentTab.value) {
      // pop to first route
      if (navigatorKeys[tabItem]!.currentState != null) {
        navigatorKeys[tabItem]!
            .currentState!
            .popUntil((Route<dynamic> route) => route.isFirst);
      }
    } else {
      currentTab.value = tabItem;
    }
    update();
  }
}
