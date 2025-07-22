import 'package:freezed_annotation/freezed_annotation.dart';

part 'season_ui_item.freezed.dart';

@freezed
abstract class SeasonUiItem with _$SeasonUiItem {
  factory SeasonUiItem({
    required int id,
    required String name,
    required String posterPath,
  }) = _SeasonUiItem;
}
