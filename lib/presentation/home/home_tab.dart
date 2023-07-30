import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../../navigation/app_navigation_routes.dart';
import '../anime_details/anime_details.dart';
import 'home_page.dart';

class HomeTab extends StatelessWidget {
  final GlobalKey<NavigatorState>? navigatorKey;

  const HomeTab({super.key, required this.navigatorKey});

  @override
  Widget build(BuildContext context) => Navigator(
        key: navigatorKey,
        initialRoute: AppNavigationRoutes.root,
        onGenerateRoute: (RouteSettings routeSettings) {
          Widget screen;
          switch (routeSettings.name) {
            case AppNavigationRoutes.root:
              screen = HomePage(
                title: AppLocalizations.of(context).browseAnime,
                onAnimeDetailsClicked: (id) {
                  navigatorKey?.currentState?.pushNamed(
                    AppNavigationRoutes.animeDetail,
                    arguments: AnimeDetailsArguments(id: id),
                  );
                },
              );
              break;
            case AppNavigationRoutes.animeDetail:
              screen = const AnimeDetails();
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
