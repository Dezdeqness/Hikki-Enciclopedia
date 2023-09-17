import 'package:flutter/material.dart';
import 'package:hikki_localization/hikki_localization.dart';

import 'package:hikki_enciclopedia/presentation/navigation/index.dart';

import 'package:hikki_enciclopedia/presentation/anime_details/anime_details.dart';
import 'home_page.dart';

class HomeTab extends StatelessWidget {
  final GlobalKey<NavigatorState>? navigatorKey;

  const HomeTab({
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
              screen = HomePage(
                title: LocaleKeys.browseAnime.tr(),
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
