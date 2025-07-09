import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hikki_api_service/hikki_api_service.dart';

import 'api_providers.dart';
import 'locale_provider.dart';

final localeInterceptorProvider = Provider<LocaleInterceptor>(
      (ref) => LocaleInterceptor(ref, localeProvider),
);

final apiKeyInterceptorProvider = Provider<ApiKeyInterceptor>((ref) {
  final apiKey = ref.watch(tmdbApiKeyProvider);
  return ApiKeyInterceptor(apiKey);
});
