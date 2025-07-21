import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hikki_api_service/hikki_api_service.dart';
import 'package:hikki_enciclopedia/core/providers/api_providers.dart';
import 'package:hikki_enciclopedia/data/mapper/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

final tmdbServiceProvider = Provider<TmdbService>((ref) {
  final dio = ref.watch(commonDioProvider);
  return TmdbService(dio);
});

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final genreMapperProvider = Provider<GenreMapper>((ref) => GenreMapper());

final castMapperProvider = Provider<CastMapper>((ref) => CastMapper());

final seasonMapperProvider = Provider<SeasonMapper>((ref) => SeasonMapper());

final videoMapperProvider = Provider<VideoMapper>((ref) => VideoMapper());
