import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hikki_enciclopedia/core/providers/api_providers.dart';
import 'package:hikki_enciclopedia/data/datasource/movie_datasource.dart';
import 'package:hikki_enciclopedia/data/mapper/movie_mapper.dart';
import 'package:hikki_enciclopedia/data/providers/providers.dart';
import 'package:hikki_enciclopedia/data/repository/movie/movie_repository_impl.dart';
import 'package:hikki_enciclopedia/domain/repository/movie/movie_repository.dart';

final movieMapperProvider = Provider<MovieMapper>((ref) {
  return MovieMapper();
});

final movieDataSourceProvider = Provider<MovieDataSource>((ref) {
  return MovieDataSource(
    ref.watch(movieServiceProvider),
    ref.watch(dioErrorMapperProvider),
    ref.watch(movieMapperProvider),
  );
});

final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  final dataSource = ref.watch(movieDataSourceProvider);
  return MovieRepositoryImpl(dataSource);
});
