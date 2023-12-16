import 'package:flutter/material.dart';
import 'package:hikki_api_service/hikki_api_service.dart';
import 'package:hikki_enciclopedia/data/datasource/anime/anime_api_datasource_impl.dart';
import 'package:hikki_enciclopedia/data/datasource/news/news_api_datasource.dart';
import 'package:hikki_enciclopedia/data/datasource/news/news_api_datasource_impl.dart';
import 'package:hikki_enciclopedia/data/datasource/promo/promo_api_datasource.dart';
import 'package:hikki_enciclopedia/data/datasource/promo/promo_api_datasource_impl.dart';
import 'package:hikki_enciclopedia/data/mapper/index.dart';
import 'package:hikki_enciclopedia/data/repository/anime_repository_impl.dart';
import 'package:hikki_enciclopedia/domain/usecase/get_anime_details_use_case.dart';
import 'package:hikki_enciclopedia/domain/usecase/get_anime_list_use_case.dart';
import 'package:hikki_enciclopedia/presentation/anime_details/composer/anime_details_composer.dart';

import 'package:hikki_enciclopedia/presentation/app.dart';
import 'package:hikki_localization/hikki_localization.dart';
import 'package:hikki_ui_kit/hikki_ui_kit.dart';
import 'package:provider/provider.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // TODO: DI
  final animeService = AnimeService();
  final animeMapper = AnimeMapper();
  final dioErrorMapper = DioErrorMapper();
  final errorMapper = ErrorMapper(dioErrorMapper);
  final datasource =
      AnimeApiDataSourceImpl(animeService, animeMapper, errorMapper);
  final repository = AnimeRepositoryImpl(dataSource: datasource);
  final newsService = NewsService();
  final promoService = PromoService();
  final newsMapper = NewsMapper();
  final promoMapper = PromoMapper();

  runApp(HikkiLocalizationWrapper(
    child: MultiProvider(
      providers: [
        Provider<GetAnimeListUseCase>(
          create: (context) => GetAnimeListUseCase(animeRepository: repository),
        ),
        Provider<GetAnimeDetailsUseCase>(
          create: (context) =>
              GetAnimeDetailsUseCase(animeRepository: repository),
        ),
        Provider<NewsApiDataSource>(
          create: (context) =>
              NewsApiDatasourceImpl(newsService, newsMapper, errorMapper),
        ),
        Provider<PromoApiDataSource>(
          create: (context) =>
              PromoApiDatasourceImpl(promoService, promoMapper, errorMapper),
        ),
        Provider<AnimeDetailsComposer>(
          create: (context) => AnimeDetailsComposer(),
        )
      ],
      child: HikkiThemeProvider(
        builder: (BuildContext context) {
          return const App();
        },
      ),
    ),
  ));
}
