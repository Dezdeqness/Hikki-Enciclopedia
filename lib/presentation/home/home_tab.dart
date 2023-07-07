import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../detail_anime/anime_details.dart';
import 'home_page.dart';

class HomeTabRoutes {
  static const String root = '/';
  static const String animeDetail = '/animedetails';
}

class HomeTab extends StatelessWidget {
  final GlobalKey<NavigatorState>? navigatorKey;

  const HomeTab({super.key, required this.navigatorKey});

  @override
  Widget build(BuildContext context) => Navigator(
        key: navigatorKey,
        initialRoute: HomeTabRoutes.root,
        onGenerateRoute: (RouteSettings routeSettings) {
          Widget screen;
          switch (routeSettings.name) {
            case HomeTabRoutes.root:
              screen = HomePage(
                title: AppLocalizations.of(context).browseAnime,
                onAnimeDetailsClicked: (id) {
                  navigatorKey?.currentState?.pushNamed(
                    HomeTabRoutes.animeDetail,
                    arguments: AnimeDetailsArguments(id: id),
                  );
                },
              );
              break;
            case HomeTabRoutes.animeDetail:
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
