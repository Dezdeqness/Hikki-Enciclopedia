import 'package:hikki_api_service/hikki_api_service.dart';
import 'package:hikki_enciclopedia/domain/model/movie/movie_entity.dart';

class MovieMapper {
  MovieEntity toEntity(Movie movie) => MovieEntity(
        id: movie.id,
        name: movie.name,
        originalName: movie.originalName,
        originalLanguage: movie.originalLanguage,
        overview: movie.overview,
        popularity: movie.popularity,
        posterPath: movie.posterPath,
        backdropPath: movie.backdropPath,
        adult: movie.adult,
        genreIds: movie.genreIds,
        firstAirDate: movie.firstAirDate,
        originCountry: movie.originCountry,
        voteAverage: movie.voteAverage,
        voteCount: movie.voteCount,
      );
}
