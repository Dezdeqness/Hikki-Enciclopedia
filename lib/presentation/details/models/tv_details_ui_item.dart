import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hikki_enciclopedia/presentation/home/models/tv_ui_item.dart';
import 'package:hikki_enciclopedia/presentation/details/models/season_ui_item.dart';

import 'cast_ui_item.dart';

part 'tv_details_ui_item.freezed.dart';

@freezed
abstract class TvDetailsUiItem with _$TvDetailsUiItem {
  factory TvDetailsUiItem({
    required int id,
    required String name,
    required String originalName,
    required String originalLanguage,
    required String overview,
    required double popularity,
    required String backdropPath,
    required String posterPath,
    required String status,
    required String type,
    required String tagline,
    required List<String> genres,
    required String firstAirDate,
    required String lastAirDate,
    required double voteAverage,
    required int voteCount,
    required int numberOfEpisodes,
    required int numberOfSeasons,
    required List<String> originCountry,
    required List<TvUiItem> similar,
    required List<TvUiItem> recommendations,
    required List<SeasonUiItem> seasons,
    required List<String> videos,
    required List<CastUiItem> casts,
  }) = _TvDetailsUiItem;
}
