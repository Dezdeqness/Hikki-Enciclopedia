import 'package:dio/dio.dart';
import 'package:hikki_api_service/src/constants/index.dart';

class ApiKeyInterceptor extends Interceptor {
  final String apiKey;

  ApiKeyInterceptor(this.apiKey);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters[TMDBConstants.apiKey] = apiKey;
    handler.next(options);
  }
}
