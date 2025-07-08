import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hikki_api_service/src/constants/index.dart';

class LocaleInterceptor extends Interceptor {
  final Ref ref;
  final StateProvider<String> localeProvider;

  LocaleInterceptor(this.ref, this.localeProvider);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final locale = ref.read(localeProvider);
    options.queryParameters[TMDBConstants.language] = locale;
    handler.next(options);
  }
}
