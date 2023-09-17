import 'package:hikki_api_service/hikki_api_service.dart';
import 'package:hikki_enciclopedia/domain/model/index.dart';
import 'package:result_type/result_type.dart';

import 'package:hikki_enciclopedia/domain/repository/index.dart';

class GetAnimeDetailsUseCase {
  final AnimeRepository animeRepository;

  GetAnimeDetailsUseCase({required this.animeRepository});

  Future<Result<AnimeDetailsEntity, ErrorEntity>> execute({
    required int animeId,
  }) =>
      animeRepository.getAnimeDetails(animeId: animeId);
}
