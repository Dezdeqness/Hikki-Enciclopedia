import 'package:dio/dio.dart';

class AnimeService {
  // TODO: DI
  final Dio _dio = Dio(
    // TODO: move to const
    BaseOptions(baseUrl: 'https://api.myanimelist.net/v2'),
  )..interceptors.addAll([
      InterceptorsWrapper(
        onRequest:
            (RequestOptions requestOptions, RequestInterceptorHandler handler) {
          requestOptions.headers.putIfAbsent(
              // TODO: setup env
              'X-MAL-CLIENT-ID',
              () => '0ad808c2b2f8fbf7d88fd21bc75a173b');
          handler.next(requestOptions);
        },
      ),
      LogInterceptor()
    ]);

  Future<Response<dynamic>> getAnimeListByRank(String rankingType) async =>
      await _dio.get(
        '/anime/ranking',
        queryParameters: {
          "ranking_type": rankingType,
          "fields": "mean, media_type",
        },
      );

  Future<Response<dynamic>> getAnimeDetails(int animeId) async =>
      await _dio.get(
        '/anime/$animeId',
        queryParameters: {
          "fields":
              "synopsis, mean, genres, media_type,status, num_episodes, rating, studios, pictures, related_anime, recommendations, statistics",
        },
      );
}
