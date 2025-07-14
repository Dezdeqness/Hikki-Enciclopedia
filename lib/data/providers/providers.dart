import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hikki_api_service/hikki_api_service.dart';
import 'package:hikki_enciclopedia/core/providers/api_providers.dart';
import 'package:shared_preferences/shared_preferences.dart';

final movieServiceProvider = Provider<MovieService>((ref) {
  final dio = ref.watch(commonDioProvider);
  return MovieService(dio);
});

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});
