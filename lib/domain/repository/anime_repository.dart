import 'package:hikki_api_service/hikki_api_service.dart';
import 'package:hikki_enciclopedia/domain/model/index.dart';
import 'package:result_type/result_type.dart';

abstract class AnimeRepository {
  Future<Result<List<AnimeEntity>, HikkiApiException>> getAnimeListByRanking({
    required String rankingType,
    required int offset,
  });

  Future<Result<AnimeDetailsEntity, HikkiApiException>> getAnimeDetails({
    required int animeId,
  });
}
