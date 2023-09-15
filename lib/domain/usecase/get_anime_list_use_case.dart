import 'package:hikki_api_service/hikki_api_service.dart';
import 'package:hikki_enciclopedia/domain/model/anime_entity.dart';
import 'package:hikki_enciclopedia/domain/repository/anime_repository.dart';
import 'package:result_type/result_type.dart';

class GetAnimeListUseCase {
  final AnimeRepository animeRepository;

  GetAnimeListUseCase({required this.animeRepository});

  Future<Result<List<AnimeEntity>, ErrorEntity>> execute({
    required String rankingType,
    int offset = 0,
  }) =>
      animeRepository.getAnimeListByRanking(
        rankingType: rankingType,
        offset: offset,
      );
}
