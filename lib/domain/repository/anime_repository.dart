import 'package:hikki_enciclopedia/domain/model/anime_details_entity.dart';
import 'package:hikki_enciclopedia/domain/model/anime_entity.dart';
import 'package:hikki_enciclopedia/domain/model/error_entity.dart';
import 'package:result_type/result_type.dart';

abstract class AnimeRepository {
  Future<Result<List<AnimeEntity>, ErrorEntity>> getAnimeListByRanking({
    required String rankingType,
  });

  Future<Result<AnimeDetailsEntity, ErrorEntity>> getAnimeDetails({
    required int animeId,
  });
}
