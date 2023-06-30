import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hikki_enciclopedia/presentation/explorer/bloc/explorer_bloc.dart';

import '../../domain/usecase/get_anime_list_use_case.dart';
import '../anime/anime_details.dart';
import 'explorer_page.dart';

class ExplorerTabRoutes {
  static const String root = '/';
  static const String animeDetail = '/animedetails';
}

class ExplorerTab extends StatelessWidget {
  final GlobalKey<NavigatorState>? navigatorKey;

  const ExplorerTab({super.key, required this.navigatorKey});

  @override
  Widget build(BuildContext context) => Navigator(
        key: navigatorKey,
        initialRoute: ExplorerTabRoutes.root,
        onGenerateRoute: (RouteSettings routeSettings) {
          Widget screen;
          switch (routeSettings.name) {
            case ExplorerTabRoutes.root:
              screen = BlocProvider(
                create: (context) => ExplorerBloc(
                  getAnimeListUseCase:
                      RepositoryProvider.of<GetAnimeListUseCase>(context),
                ),
                child: ExplorerPage(
                  onAnimeDetailsClicked: (id) {
                    navigatorKey?.currentState?.pushNamed(
                      ExplorerTabRoutes.animeDetail,
                      arguments: AnimeDetailsArguments(id: id),
                    );
                  },
                ),
              );
              break;
            case ExplorerTabRoutes.animeDetail:
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
