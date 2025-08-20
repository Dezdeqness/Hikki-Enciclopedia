import 'package:hikki_api_service/hikki_api_service.dart';
import 'package:hikki_enciclopedia/domain/model/movie/movie_entity.dart';
import 'package:hikki_enciclopedia/domain/model/personal/personal_entity.dart';
import 'package:hikki_enciclopedia/domain/model/tv/tv_entity.dart';

class PersonalMapper {

  PersonalEntity toPersonalEntityFromMovie(MovieEntity movie) => PersonalEntity(
        id: movie.id,
        title: movie.title,
        originalTitle: movie.originalTitle,
        overview: movie.overview,
        popularity: movie.popularity,
        posterPath: TMDBConstants.baseImageUrl +
            TMDBConstants.imagePath +
            movie.posterPath,
        backdropPath: movie.backdropPath ?? "",
        voteAverage: movie.voteAverage,
        voteCount: movie.voteCount,
        rating: movie.rating,
      );

  PersonalEntity toPersonalEntityFromTv(TvEntity tv) => PersonalEntity(
        id: tv.id,
        title: tv.name,
        originalTitle: tv.originalName,
        overview: tv.overview,
        popularity: tv.popularity,
        posterPath: TMDBConstants.baseImageUrl +
            TMDBConstants.imagePath +
            tv.posterPath,
        backdropPath: tv.backdropPath ?? "",
        voteAverage: tv.voteAverage,
        voteCount: tv.voteCount,
        rating: tv.rating,
  );
}
