import 'package:hikki_api_service/hikki_api_service.dart';
import 'package:hikki_enciclopedia/data/mapper/season_mapper.dart';
import 'package:hikki_enciclopedia/data/mapper/video_mapper.dart';
import 'package:hikki_enciclopedia/domain/model/tv/tv_collection_entity.dart';
import 'package:hikki_enciclopedia/domain/model/tv/tv_details_entity.dart';
import 'package:hikki_enciclopedia/domain/model/tv/tv_entity.dart';

import 'cast_mapper.dart';
import 'genre_mapper.dart';

class TvMapper {
  final GenreMapper _genreMapper;
  final SeasonMapper _seasonMapper;
  final CastMapper _castMapper;
  final VideoMapper _videoMapper;

  TvMapper(
    this._genreMapper,
    this._seasonMapper,
    this._castMapper,
    this._videoMapper,
  );

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

  TvDetailsEntity toDetailsEntity(TvDetailsResponse details) => TvDetailsEntity(
        id: details.id,
        name: details.name,
        originalName: details.originalName,
        originalLanguage: details.originalLanguage,
        overview: details.overview,
        popularity: details.popularity,
        backdropPath: details.backdropPath,
        posterPath: details.posterPath,
        status: details.status,
        type: details.type,
        tagline: details.tagline,
        genres:
            details.genres.map((item) => _genreMapper.toEntity(item)).toList(),
        firstAirDate: details.firstAirDate,
        lastAirDate: details.lastAirDate,
        voteAverage: details.voteAverage,
        voteCount: details.voteCount,
        numberOfEpisodes: details.numberOfEpisodes,
        numberOfSeasons: details.numberOfSeasons,
        originCountry: details.originCountry,
        similar: TvCollectionEntity(
          items: details.similar.results.map((item) => toEntity(item)).toList(),
          totalPages: details.similar.totalPages,
          page: details.similar.page,
        ),
        recommendations: TvCollectionEntity(
          items: details.recommendations.results
              .map((item) => toEntity(item))
              .toList(),
          totalPages: details.recommendations.totalPages,
          page: details.recommendations.page,
        ),
        seasons: details.seasons
            .map((item) => _seasonMapper.toEntity(item))
            .toList(),
        videos: details.videos.results
            .map((item) => _videoMapper.toEntity(item))
            .toList(),
        casts: details.credits.cast
            .map((item) => _castMapper.toEntity(item))
            .toList(),
      );
}
