import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hikki_api_service/hikki_api_service.dart';

import 'interceptors_provider.dart';

final tmdbApiKeyProvider = Provider<String>((ref) {
  const apiKey = String.fromEnvironment('TMDB_API_KEY');
  if (apiKey.isEmpty) {
    throw Exception('TMDB_API_KEY not provided. Pass it via --dart-define.');
  }
  return apiKey;
});

final dioErrorMapperProvider = Provider((ref) => DioErrorMapper());

final commonDioProvider = Provider<Dio>((ref) {
  final dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 15),
  ))
    ..interceptors.addAll([
      ref.watch(apiKeyInterceptorProvider),
      ref.watch(localeInterceptorProvider),
    ]);

  return dio;
});
