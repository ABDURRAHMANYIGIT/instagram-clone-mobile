import 'package:instagram_clone_mobile/domain/router/router.dart';
import 'package:instagram_clone_mobile/resources/file_paths/icons.dart';

enum BottomBarItem { home, explore, createPost, reels, profile }

Map<BottomBarItem, String> tabName = <BottomBarItem, String>{
  BottomBarItem.home: 'connections',
  BottomBarItem.explore: 'explore',
  BottomBarItem.createPost: 'createPost',
  BottomBarItem.reels: 'reels',
  BottomBarItem.profile: 'profile',
};
Map<BottomBarItem, String> tabRoute = <BottomBarItem, String>{
  BottomBarItem.home: AppRouter.homeRoute,
  BottomBarItem.explore: AppRouter.exploreRoute,
  BottomBarItem.createPost: AppRouter.createPostRoute,
  BottomBarItem.reels: AppRouter.reelsRoute,
  BottomBarItem.profile: AppRouter.profileRoute,
};

extension BottomBarItemExtension on BottomBarItem {
  String get icon {
    switch (this) {
      case BottomBarItem.explore:
        return AppIcons.search;
      case BottomBarItem.profile:
        return AppIcons.user;
      case BottomBarItem.home:
        return AppIcons.home;
      case BottomBarItem.createPost:
        return AppIcons.createPost;
      case BottomBarItem.reels:
        return AppIcons.reels;
    }
  }

  String get activeIcon {
    switch (this) {
      case BottomBarItem.explore:
        return AppIcons.searchBold;
      case BottomBarItem.profile:
        return AppIcons.userFilled;
      case BottomBarItem.home:
        return AppIcons.homeFilled;
      case BottomBarItem.createPost:
        return AppIcons.createPost;
      case BottomBarItem.reels:
        return AppIcons.reelsFilled;
    }
  }

  // String get tabName {
  //   switch (this) {
  //     case BottomBarItem.explore:
  //       return AppSentences().explore;
  //     case BottomBarItem.profile:
  //       return AppSentences().profile;
  //     case BottomBarItem.home:
  //       break;
  //     case BottomBarItem.createPost:
  //       break;
  //     case BottomBarItem.reels:
  //       break;
  //   }
  // }

  int get index {
    switch (this) {
      case BottomBarItem.home:
        return 0;
      case BottomBarItem.explore:
        return 1;
      case BottomBarItem.createPost:
        return 2;
      case BottomBarItem.reels:
        return 3;
      case BottomBarItem.profile:
        return 4;
    }
  }
}
