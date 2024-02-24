import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:instagram_clone_mobile/presentation/screens/create_post_screen/create_post_screen.dart';
import 'package:instagram_clone_mobile/presentation/screens/design_route.dart';
import 'package:instagram_clone_mobile/presentation/screens/explore_screen/explore_screen.dart';
import 'package:instagram_clone_mobile/presentation/screens/home_screen.dart';
import 'package:instagram_clone_mobile/presentation/screens/login_screen.dart';
import 'package:instagram_clone_mobile/presentation/screens/main_screen/main_screen.dart';
import 'package:instagram_clone_mobile/presentation/screens/profile_screen/profile_screen.dart';
import 'package:instagram_clone_mobile/presentation/screens/reels_screen/reels_screen.dart';
import 'package:instagram_clone_mobile/presentation/screens/register_screen.dart';
import 'package:instagram_clone_mobile/presentation/screens/splash.dart';

class AppRouter {
  static const String splashRoute = '/splash';
  static GetPage<dynamic> notFound =
      GetPage<dynamic>(name: notFoundRoute, page: () => Container());

  static const String notFoundRoute = '/not-found';
  static const String designRoute = '/design-route';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String homeRoute = '/home';
  static const String createPostRoute = '/create-post';
  static const String exploreRoute = '/explore';
  static const String reelsRoute = '/reels';
  static const String profileRoute = '/profile';
  static const String mainRoute = '/main';

  static List<GetPage<dynamic>> pages = <GetPage<dynamic>>[
    GetPage(name: splashRoute, page: () => const Splash()),
    GetPage(name: designRoute, page: () => const DesignRoute()),
    GetPage(name: loginRoute, page: () => const LoginScreen()),
    GetPage(name: registerRoute, page: () => const RegisterScreen()),
    GetPage(
      name: homeRoute,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: createPostRoute,
      page: () => const CreatePostScreen(),
    ),
    GetPage(
      name: exploreRoute,
      page: () => const ExploreScreen(),
    ),
    GetPage(
      name: reelsRoute,
      page: () => const ReelsScreen(),
    ),
    GetPage(
      name: profileRoute,
      page: () => const ProfileScreen(),
    ),
    GetPage(
      name: mainRoute,
      page: () => const MainScreen(),
    ),
  ];
}
