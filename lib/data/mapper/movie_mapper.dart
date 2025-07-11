import 'package:hikki_api_service/hikki_api_service.dart';
import 'package:hikki_enciclopedia/domain/model/movie/movie_entity.dart';

class MovieMapper {
  MovieEntity toEntity(Movie movie) => MovieEntity(
        id: movie.id,
        title: movie.title,
        originalTitle: movie.originalTitle,
        originalLanguage: movie.originalLanguage,
        overview: movie.overview,
        popularity: movie.popularity,
        posterPath: TMDBConstants.baseImageUrl +
            TMDBConstants.imagePath +
            movie.posterPath,
        backdropPath: movie.backdropPath ?? "",
        adult: movie.adult,
        genreIds: movie.genreIds,
        releaseDate: movie.releaseDate,
        voteAverage: movie.voteAverage,
        voteCount: movie.voteCount,
      );
}
