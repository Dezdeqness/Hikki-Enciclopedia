import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
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

GetIt getIt = GetIt.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // Services
  getIt.registerLazySingleton(() => AnimeService());
  getIt.registerLazySingleton(() => NewsService());
  getIt.registerLazySingleton(() => PromoService());

  // Mappers
  getIt.registerLazySingleton(() => AnimeMapper());
  getIt.registerLazySingleton(() => NewsMapper());
  getIt.registerLazySingleton(() => PromoMapper());
  getIt.registerLazySingleton(() => DioErrorMapper());
  getIt.registerLazySingleton(() => ErrorMapper(getIt<DioErrorMapper>()));

  // Data sources
  getIt.registerLazySingleton<AnimeApiDataSourceImpl>(() =>
      AnimeApiDataSourceImpl(
          getIt<AnimeService>(), getIt<AnimeMapper>(), getIt<ErrorMapper>()));

  getIt.registerLazySingleton<NewsApiDataSource>(() => NewsApiDatasourceImpl(
      getIt<NewsService>(), getIt<NewsMapper>(), getIt<ErrorMapper>()));

  getIt.registerLazySingleton<PromoApiDataSource>(() => PromoApiDatasourceImpl(
      getIt<PromoService>(), getIt<PromoMapper>(), getIt<ErrorMapper>()));

  // Repository
  getIt.registerLazySingleton(
      () => AnimeRepositoryImpl(dataSource: getIt<AnimeApiDataSourceImpl>()));

  // UseCases
  getIt.registerFactory(
      () => GetAnimeListUseCase(animeRepository: getIt<AnimeRepositoryImpl>()));
  getIt.registerFactory(() =>
      GetAnimeDetailsUseCase(animeRepository: getIt<AnimeRepositoryImpl>()));

  // Composers
  getIt.registerFactory(() => AnimeDetailsComposer());

  runApp(HikkiLocalizationWrapper(child: HikkiThemeProvider(
    builder: (BuildContext context) {
      return const App();
    },
  )));
}
