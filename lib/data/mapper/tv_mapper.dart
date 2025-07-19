import 'package:hikki_api_service/hikki_api_service.dart';
import 'package:hikki_enciclopedia/domain/model/tv/tv_entity.dart';

class TvMapper {
  TvEntity toEntity(Tv movie) => TvEntity(
    id: movie.id,
    name: movie.name,
    originalName: movie.originalName,
    originalLanguage: movie.originalLanguage,
    overview: movie.overview,
    popularity: movie.popularity,
    posterPath: TMDBConstants.baseImageUrl +
        TMDBConstants.imagePath +
        movie.posterPath,
    backdropPath: movie.backdropPath ?? "",
    adult: movie.adult,
    genreIds: movie.genreIds,
    firstAirDate: movie.firstAirDate,
    voteAverage: movie.voteAverage,
    voteCount: movie.voteCount,
  );
}
