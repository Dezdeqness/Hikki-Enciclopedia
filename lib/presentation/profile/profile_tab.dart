import 'package:flutter/material.dart';
import 'package:hikki_enciclopedia/generated/l10n.dart';

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
              screen = Center(
                child: Text( AppLocalizations.of(context).tabItemProfile),
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
