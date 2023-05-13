import 'package:dio/dio.dart';
import 'dart:async';

import 'package:flutter/foundation.dart';

import '../presentation/models/entities.dart';
import 'anime_api_model.dart';

class AnimeApiDataSource {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: 'https://api.myanimelist.net/v2'),
  )..interceptors.addAll([
      InterceptorsWrapper(
        onRequest:
            (RequestOptions requestOptions, RequestInterceptorHandler handler) {
          requestOptions.headers.putIfAbsent(
              'X-MAL-CLIENT-ID', () => '0ad808c2b2f8fbf7d88fd21bc75a173b');
          handler.next(requestOptions);
        },
      ),
      LogInterceptor()
    ]);

  // TODO: result?
  Future<List<Anime>> getAnimeList({required String rankingType}) async {
    try {
      Response userData = await _dio.get(
        '/anime/ranking',
        queryParameters: {
          "ranking_type": rankingType,
          "fields": "mean,media_type",
        },
      );

      if (userData.statusCode == 200) {
        return compute(parseAnimeList, userData);
      } else {
        print(userData.statusCode);
      }
    } catch (e) {
      print(e);
      rethrow;
    }
    return [];
  }

}

List<Anime> parseAnimeList(Response<dynamic> value) {
  final animeResponse = AnimeResponse.fromJson(value.data);

  return animeResponse.data
      .map(
        (e) => Anime(
        title: e.node.title,
        type: e.node.mediaType,
        score: e.node.mean ?? 0,
        imageUrl: e.node.mainPicture['large'] ?? ""),
  )
      .toList();
}