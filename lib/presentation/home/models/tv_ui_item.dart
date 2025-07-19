import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_ui_item.freezed.dart';

@freezed
abstract class TvUiItem with _$TvUiItem {
  factory TvUiItem({
    required int id,
    required String name,
    required String overview,
    required double popularity,
    required String posterPath,
    required String firstAirDate,
    required int voteAverage,
  }) = _TvUiItem;
}
