import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hikki_enciclopedia/core/providers/api_providers.dart';
import 'package:hikki_enciclopedia/data/datasource/tv_datasource.dart';
import 'package:hikki_enciclopedia/data/mapper/tv_mapper.dart';
import 'package:hikki_enciclopedia/data/providers/providers.dart';
import 'package:hikki_enciclopedia/data/repository/tv/tv_repository_impl.dart';
import 'package:hikki_enciclopedia/domain/repository/tv/tv_repository.dart';
import 'package:hikki_enciclopedia/presentation/home/home_notifier.dart';
import 'package:hikki_enciclopedia/presentation/home/home_section_state.dart';
import 'package:hikki_enciclopedia/presentation/home/mapper/tv_ui_mapper.dart';
import 'package:hikki_enciclopedia/presentation/home/models/tv_section_type.dart';

final tvMapperProvider = Provider<TvMapper>((ref) {
  return TvMapper(
    ref.watch(genreMapperProvider),
    ref.watch(seasonMapperProvider),
    ref.watch(castMapperProvider),
    ref.watch(videoMapperProvider),
  );
});

final tvDataSourceProvider = Provider<TvDataSource>((ref) {
  return TvDataSource(
    ref.watch(tmdbServiceProvider),
    ref.watch(dioErrorMapperProvider),
    ref.watch(tvMapperProvider),
  );
});

final tvRepositoryProvider = Provider<TvRepository>((ref) {
  final dataSource = ref.watch(tvDataSourceProvider);
  return TvRepositoryImpl(dataSource);
});

final tvUiMapperProvider = Provider<TvUiMapper>((ref) => TvUiMapper());

final airingSectionNotifierProvider =
    NotifierProvider<HomeNotifier, HomeSectionState>(() {
  return HomeNotifier(TvSectionType.airingToday);
});

final popularSectionNotifierProvider =
    NotifierProvider<HomeNotifier, HomeSectionState>(() {
  return HomeNotifier(TvSectionType.popular);
});

final topRatedSectionNotifierProvider =
    NotifierProvider<HomeNotifier, HomeSectionState>(() {
  return HomeNotifier(TvSectionType.topRated);
});

final trendingSectionNotifierProvider =
    NotifierProvider<HomeNotifier, HomeSectionState>(() {
  return HomeNotifier(TvSectionType.trending);
});
