import 'package:dio/dio.dart';

class NewsService {
  // TODO: DI
  final Dio _dio = Dio(
    // TODO: move to const
    BaseOptions(baseUrl: 'https://myanimelist.net'),
  )..interceptors.addAll([
    // LogInterceptor(),
  ]);

  Future<Response<String>> getNewsDoc() async =>
      await _dio.get('/news');
}
