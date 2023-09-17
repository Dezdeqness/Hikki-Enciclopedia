import 'package:flutter/material.dart';
import 'package:hikki_localization/hikki_localization.dart';

import 'package:hikki_enciclopedia/presentation/navigation/index.dart';

class PersonalListTab extends StatelessWidget {
  final GlobalKey<NavigatorState>? navigatorKey;

  const PersonalListTab({
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
              screen = Center(
                child: Text(LocaleKeys.tabItemPersonalList.tr()),
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
