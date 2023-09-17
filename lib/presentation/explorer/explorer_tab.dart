import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hikki_enciclopedia/domain/usecase/get_anime_list_use_case.dart';
import 'package:hikki_enciclopedia/presentation/anime_details/anime_details.dart';
import 'package:hikki_enciclopedia/presentation/explorer/bloc/explorer_bloc.dart';
import 'package:hikki_enciclopedia/presentation/navigation/index.dart';

import 'explorer_page.dart';

class ExplorerTab extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const ExplorerTab({
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
              screen = BlocProvider(
                create: (context) => ExplorerBloc(
                  getAnimeListUseCase:
                      RepositoryProvider.of<GetAnimeListUseCase>(context),
                ),
                child: ExplorerPage(
                  onAnimeDetailsClicked: (id) {
                    navigatorKey.currentState?.pushNamed(
                      AppNavigationRoutes.animeDetail,
                      arguments: AnimeDetailsArguments(id: id),
                    );
                  },
                ),
              );
              break;
            case AppNavigationRoutes.animeDetail:
              screen = const AnimeDetails();
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
