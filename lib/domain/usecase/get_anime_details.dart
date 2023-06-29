import 'package:hikki_enciclopedia/domain/model/anime_details_entity.dart';
import 'package:hikki_enciclopedia/domain/model/error_entity.dart';
import 'package:result_type/result_type.dart';

import '../repository/anime_repository.dart';

class GetAnimeDetails {
  final AnimeRepository animeRepository;

  GetAnimeDetails({required this.animeRepository});

  Future<Result<AnimeDetailsEntity, ErrorEntity>> execute({
    required int animeId,
  }) =>
      animeRepository.getAnimeDetails(animeId: animeId);
}
