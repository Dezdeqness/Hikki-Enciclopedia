import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

class PersonalListTabRoutes {
  static const String root = '/';
}

class PersonalListTab extends StatelessWidget {
  final GlobalKey<NavigatorState>? navigatorKey;

  const PersonalListTab({super.key, required this.navigatorKey});

  @override
  Widget build(BuildContext context) => Navigator(
        key: navigatorKey,
        initialRoute: PersonalListTabRoutes.root,
        onGenerateRoute: (RouteSettings routeSettings) {
          Widget screen;
          switch (routeSettings.name) {
            case PersonalListTabRoutes.root:
              screen = Center(
                child: Text(AppLocalizations.of(context).tabItemPersonalList),
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
