import 'package:flutter/material.dart';

class ProfileTabRoutes {
  static const String root = '/';
}

class ProfileTab extends StatelessWidget {
  final GlobalKey<NavigatorState>? navigatorKey;

  const ProfileTab({super.key, required this.navigatorKey});

  @override
  Widget build(BuildContext context) => Navigator(
        key: navigatorKey,
        initialRoute: ProfileTabRoutes.root,
        onGenerateRoute: (RouteSettings routeSettings) {
          Widget screen;
          switch (routeSettings.name) {
            case ProfileTabRoutes.root:
              screen = Container(
                child: const Center(
                  child: Text('Profile'),
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
