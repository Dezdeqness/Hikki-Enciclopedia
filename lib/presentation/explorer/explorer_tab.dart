import 'package:flutter/material.dart';

import 'explorer_page.dart';

class ExplorerTabRoutes {
  static const String root = '/';
}

class ExplorerTab extends StatelessWidget {
  final GlobalKey<NavigatorState>? navigatorKey;

  const ExplorerTab({super.key, required this.navigatorKey});

  @override
  Widget build(BuildContext context) => Navigator(
    key: navigatorKey,
    initialRoute: ExplorerTabRoutes.root,
    onGenerateRoute: (RouteSettings routeSettings) {
      Widget screen;
      switch (routeSettings.name) {
        case ExplorerTabRoutes.root:
          screen = const ExplorerPage();
          break;
        default:
          screen = const Center(
            child: Text('Error'),
          );
          break;
      }
      return MaterialPageRoute(
          builder: (BuildContext context) => screen,
          settings: routeSettings);
    },
  );
}
