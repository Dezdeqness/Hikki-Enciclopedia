import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hikki_enciclopedia/presentation/explorer/models/movie_ui_item.dart';
import 'package:hikki_enciclopedia/presentation/home/models/tv_ui_item.dart';
import 'package:hikki_enciclopedia/presentation/details/models/season_ui_item.dart';

import 'cast_ui_item.dart';

part 'movie_details_ui_item.freezed.dart';

@freezed
abstract class MovieDetailsUiItem with _$MovieDetailsUiItem {
  factory MovieDetailsUiItem({
    required int id,
    required String title,
    required String originalTitle,
    required String originalLanguage,
    required String overview,
    required double popularity,
    required String backdropPath,
    required String posterPath,
    required String status,
    required String? mediaType,
    required String tagline,
    required List<String> genres,
    required String releaseDate,
    required double voteAverage,
    required int voteCount,
    required List<String> originCountry,
    required List<MovieUiItem> similar,
    required List<MovieUiItem> recommendations,
    required List<String> videos,
    required List<CastUiItem> casts,
  }) = _MovieDetailsUiItem;
}
