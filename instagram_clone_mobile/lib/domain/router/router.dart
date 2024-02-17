import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:instagram_clone_mobile/presentation/screens/design_route.dart';
import 'package:instagram_clone_mobile/presentation/screens/login_screen.dart';
import 'package:instagram_clone_mobile/presentation/screens/splash.dart';

class AppRouter {
  static const String splashRoute = '/splash';
  static GetPage<dynamic> notFound =
      GetPage<dynamic>(name: notFoundRoute, page: () => Container());

  static const String notFoundRoute = '/not-found';
  static const String designRoute = '/design-route';
  static const String loginRoute = '/login';

  static List<GetPage<dynamic>> pages = <GetPage<dynamic>>[
    GetPage(name: splashRoute, page: () => const Splash()),
    GetPage(name: designRoute, page: () => const DesignRoute()),
    GetPage(name: loginRoute, page: () => const LoginScreen()),
  ];
}
