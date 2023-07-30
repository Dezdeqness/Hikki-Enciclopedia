import 'package:result_type/result_type.dart';

import '../../domain/model/anime_details_entity.dart';
import '../../domain/model/anime_entity.dart';
import '../../domain/model/error_entity.dart';

abstract class AnimeApiDataSource {
  Future<Result<List<AnimeEntity>, ErrorEntity>> getAnimeList({
    required String rankingType,
    required int offset,
  });

  Future<Result<AnimeDetailsEntity, ErrorEntity>> getAnimeDetails({
    required int animeId,
  });
}
