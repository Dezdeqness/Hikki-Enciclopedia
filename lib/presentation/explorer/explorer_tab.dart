import 'package:flutter/material.dart';

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
          screen = Container(
            child: const Center(
              child: Text('Explorer'),
            ),
          );
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
