import 'package:hikki_enciclopedia/domain/model/anime_entity.dart';
import 'package:hikki_enciclopedia/domain/model/error_entity.dart';
import 'package:hikki_enciclopedia/domain/repository/anime_repository.dart';
import 'package:result_type/result_type.dart';

class GetAnimeList {
  final AnimeRepository animeRepository;

  GetAnimeList({required this.animeRepository});

  Future<Result<List<AnimeEntity>, ErrorEntity>> execute({
    required String rankingType,
  }) =>
      animeRepository.getAnimeListByRanking(rankingType: rankingType);
}
