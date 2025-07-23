import 'package:hikki_enciclopedia/domain/model/tv/tv_details_entity.dart';
import 'package:hikki_enciclopedia/presentation/home/mapper/tv_ui_mapper.dart';
import 'package:hikki_enciclopedia/presentation/tv_details/mapper/season_ui_mapper.dart';
import 'package:hikki_enciclopedia/presentation/tv_details/models/index.dart';
import 'package:hikki_localization/hikki_localization.dart';

import 'cast_ui_mapper.dart';

class TvDetailsUiMapper {
  final _dateFormat = DateFormat('yyyy/MM/dd');

  final SeasonUiMapper _seasonUiMapper;
  final CastUiMapper _castUiMapper;
  final TvUiMapper _tvUiMapper;

  TvDetailsUiMapper(this._seasonUiMapper, this._castUiMapper, this._tvUiMapper);

  TvDetailsUiItem toUiItem(TvDetailsEntity item) => TvDetailsUiItem(
        id: item.id,
        name: item.name,
        originalName: item.originalName,
        originalLanguage: item.originalLanguage,
        overview: item.overview,
        popularity: item.popularity,
        backdropPath: item.backdropPath ?? "",
        posterPath: item.posterPath,
        status: item.status,
        type: item.type,
        tagline: item.tagline,
        genres: item.genres.map((item) => item.name).toList(),
        firstAirDate: item.firstAirDate != null
            ? _dateFormat.format(item.firstAirDate!)
            : "",
        lastAirDate: item.lastAirDate != null
            ? _dateFormat.format(item.lastAirDate!)
            : "",
        voteAverage: (item.voteAverage * 10).truncateToDouble() / 10,
        voteCount: item.voteCount,
        numberOfEpisodes: item.numberOfEpisodes,
        numberOfSeasons: item.numberOfSeasons,
        videos: item.videos.map((item) => item.previewImageUrl).toList(),
        seasons: item.seasons
            .map((item) => _seasonUiMapper.toUiModel(item))
            .toList(),
        casts: item.casts.map((item) => _castUiMapper.toUiModel(item)).toList(),
        similar: item.similar.items
            .map((item) => _tvUiMapper.toUiModel(item))
            .toList(),
        recommendations: item.recommendations.items
            .map((item) => _tvUiMapper.toUiModel(item))
            .toList(),
        originCountry: item.originCountry,
      );
}
