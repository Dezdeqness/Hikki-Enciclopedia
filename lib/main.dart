import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hikki_enciclopedia/data/datasource/anime_api_datasource_impl.dart';
import 'package:hikki_enciclopedia/data/mapper/anime_mapper.dart';
import 'package:hikki_enciclopedia/data/mapper/error_mapper.dart';
import 'package:hikki_enciclopedia/data/repository/anime_repository_impl.dart';
import 'package:hikki_enciclopedia/domain/usecase/get_anime_details_use_case.dart';
import 'package:hikki_enciclopedia/domain/usecase/get_anime_list_use_case.dart';

import 'package:hikki_enciclopedia/generated/l10n.dart';
import 'package:hikki_enciclopedia/presentation/app.dart';
import 'package:provider/provider.dart';

import 'data/mapper/dio_error_mapper.dart';
import 'data/service/anime_service.dart';
import 'presentation/home/home_provier.dart';

void main() {
  // TODO: DI
  final animeService = AnimeService();
  final animeMapper = AnimeMapper();
  final dioErrorMapper = DioErrorMapper();
  final errorMapper = ErrorMapper(dioErrorMapper);
  final datasource =
      AnimeApiDataSourceImpl(animeService, animeMapper, errorMapper);
  final repository = AnimeRepositoryImpl(dataSource: datasource);

  runApp(
    MultiProvider(
      providers: [
        Provider<GetAnimeListUseCase>(
          create: (context) => GetAnimeListUseCase(animeRepository: repository),
        ),
        Provider<GetAnimeDetailsUseCase>(
          create: (context) =>
              GetAnimeDetailsUseCase(animeRepository: repository),
        ),
        ChangeNotifierProvider<HomeProvider>(create: (context) {
          final useCase = Provider.of<GetAnimeListUseCase>(context, listen: false);
          return HomeProvider(useCase: useCase);
        }),
      ],
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
              statusBarBrightness: Brightness.dark,
            ),
          ),
        ),
        home: const App(),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.delegate.supportedLocales,
      ),
    ),
  );
}
