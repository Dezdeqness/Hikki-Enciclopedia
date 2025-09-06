import 'package:hikki_api_service/hikki_api_service.dart';
import 'package:hikki_enciclopedia/domain/model/movie/movie_collection_entity.dart';
import 'package:hikki_enciclopedia/domain/model/movie/movie_details_entity.dart';
import 'package:hikki_enciclopedia/domain/model/movie/movie_entity.dart';

import 'index.dart';

class MovieMapper {
  final GenreMapper _genreMapper;
  final CastMapper _castMapper;
  final VideoMapper _videoMapper;

  MovieMapper(
    this._genreMapper,
    this._castMapper,
    this._videoMapper,
  );

  MovieEntity toEntity(Movie movie) => MovieEntity(
        id: movie.id,
        title: movie.title,
        originalTitle: movie.originalTitle,
        originalLanguage: movie.originalLanguage,
        overview: movie.overview,
        popularity: movie.popularity,
        posterPath: movie.posterPath != null
            ? TMDBConstants.baseImageUrl +
            TMDBConstants.imagePath +
            movie.posterPath!
            : "",
        backdropPath: movie.backdropPath ?? "",
        adult: movie.adult,
        genreIds: movie.genreIds,
        releaseDate: movie.releaseDate,
        voteAverage: movie.voteAverage,
        voteCount: movie.voteCount,
        rating: movie.rating,
      );

  MovieDetailsEntity toDetailsEntity(MovieDetailsResponse details) =>
      MovieDetailsEntity(
        id: details.id,
        title: details.title,
        originalTitle: details.originalTitle,
        originalLanguage: details.originalLanguage,
        overview: details.overview,
        popularity: details.popularity,
        posterPath: TMDBConstants.baseImageUrl +
            TMDBConstants.imagePath +
            details.posterPath,
        backdropPath: details.backdropPath != null
            ? TMDBConstants.baseImageUrl +
                TMDBConstants.imagePath +
                details.backdropPath!
            : "",
        status: details.status,
        mediaType: details.mediaType,
        tagline: details.tagline,
        genres:
            details.genres.map((item) => _genreMapper.toEntity(item)).toList(),
        releaseDate: details.releaseDate,
        voteAverage: details.voteAverage,
        voteCount: details.voteCount,
        originCountry: details.originCountry,
        similar: MovieCollectionEntity(
          items: details.similar.results.map((item) => toEntity(item)).toList(),
          totalPages: details.similar.totalPages,
          page: details.similar.page,
        ),
        recommendations: MovieCollectionEntity(
          items: details.recommendations.results
              .map((item) => toEntity(item))
              .toList(),
          totalPages: details.recommendations.totalPages,
          page: details.recommendations.page,
        ),
        videos: details.videos.results
            .map((item) => _videoMapper.toEntity(item))
            .toList(),
        casts: details.credits.cast
            .map((item) => _castMapper.toEntity(item))
            .toList(),
      );
}
