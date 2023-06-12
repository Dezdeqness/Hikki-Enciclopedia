import 'package:dio/dio.dart';
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:hikki_enciclopedia/data/anime_details_model.dart';

import 'anime_api_model.dart';
import 'entities.dart';

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
  Future<List<AnimeEntity>> getAnimeList({required String rankingType}) async {
    try {
      Response response = await _dio.get(
        '/anime/ranking',
        queryParameters: {
          "ranking_type": rankingType,
          "fields": "mean, media_type",
        },
      );

      if (response.statusCode == 200) {
        return compute(parseAnimeList, response);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
      rethrow;
    }
    return [];
  }

  Future<AnimeDetailsEntity?> getAnimeDetails({required int animeId}) async {
    try {
      Response response = await _dio.get(
        '/anime/$animeId',
        queryParameters: {
          "fields":
              "synopsis, mean, genres, media_type,status, num_episodes, rating, studios, pictures, related_anime, recommendations, statistics",
        },
      );

      if (response.statusCode == 200) {
        return compute(parseAnimeDetails, response);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
      rethrow;
    }
    return null;
  }
}

List<AnimeEntity> parseAnimeList(Response<dynamic> value) {
  final animeResponse = AnimeResponse.fromJson(value.data);

  return animeResponse.data
      .map(
        (e) => AnimeEntity(
            id: e.node.id,
            title: e.node.title,
            type: e.node.mediaType,
            score: e.node.mean ?? 0,
            imageUrl: e.node.mainPicture['large'] ?? ""),
      )
      .toList();
}

AnimeDetailsEntity parseAnimeDetails(Response<dynamic> value) {

  final animeDetailsResponse = AnimeDetailsResponse.fromJson(value.data);
  return AnimeDetailsEntity(
    id: animeDetailsResponse.id ?? 0,
    title: animeDetailsResponse.title ?? '',
    type: animeDetailsResponse.mediaType ?? '',
    score: animeDetailsResponse.mean ?? 0.0,
    imageUrl: animeDetailsResponse.mainPicture['large'] ?? "",
  );
}
