import 'package:flutter/material.dart';
import 'package:hikki_enciclopedia/presentation/profile/profile_page.dart';

import 'package:hikki_enciclopedia/presentation/navigation/index.dart';

class ProfileTab extends StatelessWidget {
  final GlobalKey<NavigatorState>? navigatorKey;

  const ProfileTab({
    required this.navigatorKey,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Navigator(
        key: navigatorKey,
        initialRoute: AppNavigationRoutes.root,
        onGenerateRoute: (RouteSettings routeSettings) {
          Widget screen;
          switch (routeSettings.name) {
            case AppNavigationRoutes.root:
              screen = const Center(
                child: ProfilePage(),
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
