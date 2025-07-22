import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:hikki_enciclopedia/presentation/authorize_page/authorize_page.dart';
import 'package:hikki_enciclopedia/presentation/entry_page/entry_page.dart';
import 'package:hikki_enciclopedia/presentation/explorer/explorer_page.dart';
import 'package:hikki_enciclopedia/presentation/home/home_page.dart';
import 'package:hikki_enciclopedia/presentation/main/main_page.dart';
import 'package:hikki_enciclopedia/presentation/personal_list/personal_list_page.dart';
import 'package:hikki_enciclopedia/presentation/tv_details/tv_details_page.dart';

part 'hikki_app_router.gr.dart';

@AutoRouterConfig()
class HikkiAppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: MainRoute.page,
          children: [
            AutoRoute(page: PersonalListRoute.page),
            AutoRoute(
              page: HomeRoute.page,
              initial: true,
            ),
            AutoRoute(page: ExplorerRoute.page),
            // AutoRoute(page: ProfileRoute.page),
          ],
        ),
        AutoRoute(
          page: EntryRoute.page,
          initial: true,
        ),
        AutoRoute(page: AuthorizeRoute.page),
        AutoRoute(page: TvDetailsRoute.page),
      ];
}
