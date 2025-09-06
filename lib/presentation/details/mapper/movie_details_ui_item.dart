import 'package:hikki_enciclopedia/domain/model/movie/movie_details_entity.dart';
import 'package:hikki_enciclopedia/presentation/details/models/movie_details_ui_item.dart';
import 'package:hikki_enciclopedia/presentation/explorer/mapper/movie_ui_mapper.dart';
import 'package:hikki_localization/hikki_localization.dart';

import 'cast_ui_mapper.dart';

class MovieDetailsUiMapper {
  final _dateFormat = DateFormat('yyyy/MM/dd');

  final CastUiMapper _castUiMapper;
  final MovieUiMapper _movieUiMapper;

  MovieDetailsUiMapper(this._castUiMapper, this._movieUiMapper);

  MovieDetailsUiItem toUiItem(MovieDetailsEntity item) => MovieDetailsUiItem(
    id: item.id,
    title: item.title,
    originalTitle: item.originalTitle,
    originalLanguage: item.originalLanguage,
    overview: item.overview,
    popularity: item.popularity,
    backdropPath: item.backdropPath ?? "",
    posterPath: item.posterPath,
    status: item.status,
    mediaType: item.mediaType,
    tagline: item.tagline,
    genres: item.genres.map((item) => item.name).toList(),
    releaseDate: item.releaseDate != null
        ? _dateFormat.format(item.releaseDate!)
        : "",
    voteAverage: (item.voteAverage * 10).truncateToDouble() / 10,
    voteCount: item.voteCount,
    videos: item.videos.map((item) => item.previewImageUrl).toList(),
    casts: item.casts.map((item) => _castUiMapper.toUiModel(item)).toList(),
    similar: item.similar.items
        .map((item) => _movieUiMapper.toUiModel(item))
        .toList(),
    recommendations: item.recommendations.items
        .map((item) => _movieUiMapper.toUiModel(item))
        .toList(),
    originCountry: item.originCountry,
  );
}
