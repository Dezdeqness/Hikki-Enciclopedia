import 'package:hikki_enciclopedia/core/extensions/response_extension.dart';
import 'dart:async';

import 'package:hikki_enciclopedia/data/core/base_api_datasource.dart';
import 'package:hikki_enciclopedia/data/datasource/anime_api_datasource.dart';
import 'package:hikki_enciclopedia/data/mapper/error_mapper.dart';
import 'package:hikki_enciclopedia/data/service/anime_service.dart';
import 'package:hikki_enciclopedia/domain/model/error_entity.dart';
import 'package:result_type/result_type.dart';
import '../../domain/model/anime_details_entity.dart';
import '../../domain/model/anime_entity.dart';
import '../mapper/anime_mapper.dart';

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
  Future<Result<List<AnimeEntity>, ErrorEntity>> getAnimeList(
      {required String rankingType}) async {
    try {
      final response = await _animeService.getAnimeListByRank(rankingType);

      if (response.isSuccessRequest()) {
        return Success(_animeMapper.mapAnimeList(response));
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
        return Success(_animeMapper.mapAnimeDetails(response));
      } else {
        return Failure(ErrorEntity.unknown);
      }
    } on Exception catch (e) {
      return Failure(errorMapper.mapException(e));
    }
  }
}
