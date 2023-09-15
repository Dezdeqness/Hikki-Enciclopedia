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
              () => 'cafa1f4d6c21d80b3200dc3610970c22');
          handler.next(requestOptions);
        },
      ),
      LogInterceptor()
    ]);

  Future<Response<dynamic>> getAnimeListByRank({
    required String rankingType,
    required int offset,
  }) async =>
      await _dio.get(
        '/anime/ranking',
        queryParameters: {
          "ranking_type": rankingType,
          'offset': offset,
          "fields": "mean, media_type",
        },
      );

  Future<Response<dynamic>> getAnimeDetails(int animeId) async =>
      await _dio.get(
        '/anime/$animeId',
        queryParameters: {
          "fields":
              "id,title,main_picture,,start_date,end_date,synopsis,mean,rank,popularity,num_list_users,num_scoring_users,created_at,updated_at,media_type,status,genres,my_list_status,num_episodes,start_season,source,average_episode_duration,rating,pictures,related_anime,recommendations,studios,statistics",
        },
      );
}
