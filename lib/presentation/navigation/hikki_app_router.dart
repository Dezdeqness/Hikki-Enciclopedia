import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import 'package:hikki_enciclopedia/presentation/anime_details/anime_details_page.dart';
import 'package:hikki_enciclopedia/presentation/explorer/explorer_page.dart';
import 'package:hikki_enciclopedia/presentation/home/home_page.dart';
import 'package:hikki_enciclopedia/presentation/main/main_page.dart';
import 'package:hikki_enciclopedia/presentation/personal_list/personal_list_page.dart';
import 'package:hikki_enciclopedia/presentation/profile/profile_page.dart';

part 'hikki_app_router.gr.dart';

@AutoRouterConfig()
class HikkiAppRouter extends _$HikkiAppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: MainRoute.page,
          initial: true,
          children: [
            AutoRoute(page: PersonalListRoute.page),
            AutoRoute(
              page: HomeRoute.page,
              initial: true,
            ),
            AutoRoute(page: ExplorerRoute.page),
            AutoRoute(page: ProfileRoute.page),
          ],
        ),
        AutoRoute(page: AnimeDetailsRoute.page),
      ];
}
