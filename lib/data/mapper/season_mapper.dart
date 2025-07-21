import 'package:hikki_api_service/hikki_api_service.dart';
import 'package:hikki_enciclopedia/domain/model/season_entity.dart';

class SeasonMapper {
  SeasonEntity toEntity(SeasonResponse season) => SeasonEntity(
    id: season.id,
    name: season.name,
    episodeCount: season.episodeCount,
    overview: season.overview,
    voteAverage: season.voteAverage,
    posterPath: TMDBConstants.baseImageUrl +
        TMDBConstants.imagePath +
        season.posterPath,
    airDate: season.airDate,
    seasonNumber: season.seasonNumber,
  );
}
