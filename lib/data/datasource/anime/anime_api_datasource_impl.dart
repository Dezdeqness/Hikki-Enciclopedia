import 'dart:async';

import 'package:hikki_api_service/hikki_api_service.dart';
import 'package:hikki_enciclopedia/data/core/base_api_datasource.dart';
import 'package:hikki_enciclopedia/data/datasource/anime/anime_api_datasource.dart';
import 'package:result_type/result_type.dart';
import 'package:hikki_enciclopedia/domain/model/index.dart';
import 'package:hikki_enciclopedia/data/mapper/index.dart';

class AnimeApiDataSourceImpl extends BaseApiDatasource
    implements AnimeApiDataSource {
  final AnimeService _animeService;
  final AnimeMapper _animeMapper;

  AnimeApiDataSourceImpl(
    this._animeService,
    this._animeMapper,
    ErrorMapper errorMapper,
  ) : super(errorMapper);

  @override
  Future<Result<List<AnimeEntity>, ErrorEntity>> getAnimeList({
    required String rankingType,
    required int offset,
  }) async {
    try {
      final response = await _animeService.getAnimeListByRank(
        rankingType: rankingType,
        offset: offset,
      );

      if (response.isSuccessRequest()) {
        return Success(_animeMapper.mapAnimeList(response.data));
      } else {
        return Failure(ErrorEntity.unknown);
      }
    } on Exception catch (e) {
      return Failure(errorMapper.mapException(e));
    }
  }

  @override
  Future<Result<AnimeDetailsEntity, ErrorEntity>> getAnimeDetails(
      {required int animeId}) async {
    try {
      final response = await _animeService.getAnimeDetails(animeId);

      if (response.isSuccessRequest()) {
        return Success(_animeMapper.mapAnimeDetails(response.data));
      } else {
        return Failure(ErrorEntity.unknown);
      }
    } on Exception catch (e) {
      return Failure(errorMapper.mapException(e));
    }
  }
}
