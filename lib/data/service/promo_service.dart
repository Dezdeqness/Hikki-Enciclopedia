import 'package:dio/dio.dart';

class PromoService {
  // TODO: DI
  final Dio _dio = Dio(
    // TODO: move to const
    BaseOptions(baseUrl: 'https://myanimelist.net'),
  )..interceptors.addAll([
    // LogInterceptor(),
  ]);

  Future<Response<String>> getPromoDoc() async =>
      await _dio.get('/watch/promotion');
}
