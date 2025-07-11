import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_ui_item.freezed.dart';

@freezed
abstract class MovieUiItem with _$MovieUiItem {
  factory MovieUiItem({
    required int id,
    required String title,
    required String overview,
    required double popularity,
    required String posterPath,
    required String releaseDate,
    required int voteAverage,
  }) = _MovieUiItem;
}
