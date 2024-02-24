import 'package:flutter/material.dart';
import 'package:instagram_clone_mobile/presentation/screens/profile_screen/profile_screen.dart';

import '../../../../data/enums/bottom_bar_item.dart';

class TabNavigatorRoutes {
  static const String root = '/';
}

class TabNavigatorProfile extends StatelessWidget {
  const TabNavigatorProfile(
      {super.key, required this.navigatorKey, required this.tabItem});
  final GlobalKey<NavigatorState>? navigatorKey;
  final BottomBarItem tabItem;

  Map<String, WidgetBuilder> _routeBuilders(
    BuildContext context,
  ) {
    return <String, Widget Function(BuildContext)>{
      TabNavigatorRoutes.root: (BuildContext context) => const ProfileScreen(),
    };
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, WidgetBuilder> routeBuilders = _routeBuilders(context);
    return Navigator(
      key: navigatorKey,
      initialRoute: TabNavigatorRoutes.root,
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) =>
              routeBuilders[routeSettings.name!]!(context),
        );
      },
    );
  }
}
