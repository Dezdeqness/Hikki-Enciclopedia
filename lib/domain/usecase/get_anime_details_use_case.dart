import 'package:hikki_enciclopedia/domain/model/anime_details_entity.dart';
import 'package:hikki_enciclopedia/domain/model/error_entity.dart';
import 'package:result_type/result_type.dart';

import '../repository/anime_repository.dart';

class GetAnimeDetailsUseCase {
  final AnimeRepository animeRepository;

  GetAnimeDetailsUseCase({required this.animeRepository});

  Future<Result<AnimeDetailsEntity, ErrorEntity>> execute({
    required int animeId,
  }) =>
      animeRepository.getAnimeDetails(animeId: animeId);
}
