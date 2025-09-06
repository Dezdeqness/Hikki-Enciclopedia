import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hikki_enciclopedia/core/providers/api_providers.dart';
import 'package:hikki_enciclopedia/data/datasource/movie_datasource.dart';
import 'package:hikki_enciclopedia/data/mapper/movie_mapper.dart';
import 'package:hikki_enciclopedia/data/providers/providers.dart';
import 'package:hikki_enciclopedia/data/repository/movie/movie_repository_impl.dart';
import 'package:hikki_enciclopedia/domain/repository/movie/movie_repository.dart';
import 'package:hikki_enciclopedia/presentation/explorer/explorer_notifier.dart';
import 'package:hikki_enciclopedia/presentation/explorer/explorer_state.dart';
import 'package:hikki_enciclopedia/presentation/explorer/mapper/movie_ui_mapper.dart';

final movieMapperProvider = Provider<MovieMapper>((ref) {
  return MovieMapper(
    ref.watch(genreMapperProvider),
    ref.watch(castMapperProvider),
    ref.watch(videoMapperProvider),
  );
});

final movieDataSourceProvider = Provider<MovieDataSource>((ref) {
  return MovieDataSource(
    ref.watch(tmdbServiceProvider),
    ref.watch(dioErrorMapperProvider),
    ref.watch(movieMapperProvider),
  );
});

final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  final dataSource = ref.watch(movieDataSourceProvider);
  return MovieRepositoryImpl(dataSource);
});

final movieUiMapperProvider = Provider<MovieUiMapper>((ref) => MovieUiMapper());

final explorerNotifierProvider =
    NotifierProvider<ExplorerNotifier, ExplorerState>(ExplorerNotifier.new);
