import 'package:dio/dio.dart';

import '../../domain/model/anime_details_entity.dart';
import '../../domain/model/anime_entity.dart';
import '../model/anime_api_model.dart';
import '../model/anime_details_model.dart';

class AnimeMapper {
  List<AnimeEntity> mapAnimeList(Response<dynamic> value) =>
      AnimeApi.fromJson(value.data).data.map(_mapAnimeItem).toList();

  AnimeEntity _mapAnimeItem(Data data) => AnimeEntity(
        id: data.node.id,
        title: data.node.title,
        type: data.node.mediaType,
        score: data.node.mean ?? 0,
        imageUrl: data.node.mainPicture['large'] ?? "",
      );

  AnimeDetailsEntity mapAnimeDetails(Response<dynamic> value) {
    final animeDetailsResponse = AnimeDetailsResponse.fromJson(value.data);

    return AnimeDetailsEntity(
      id: animeDetailsResponse.id ?? 0,
      title: animeDetailsResponse.title ?? '',
      type: animeDetailsResponse.mediaType ?? '',
      score: animeDetailsResponse.mean ?? 0.0,
      imageUrl: animeDetailsResponse.mainPicture['large'] ?? "",
    );
  }
}
