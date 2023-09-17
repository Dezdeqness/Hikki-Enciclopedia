import 'package:hikki_api_service/hikki_api_service.dart';
import 'package:result_type/result_type.dart';
import 'package:hikki_enciclopedia/domain/model/index.dart';

abstract class AnimeApiDataSource {
  Future<Result<List<AnimeEntity>, ErrorEntity>> getAnimeList({
    required String rankingType,
    required int offset,
  });

  Future<Result<AnimeDetailsEntity, ErrorEntity>> getAnimeDetails({
    required int animeId,
  });
}
