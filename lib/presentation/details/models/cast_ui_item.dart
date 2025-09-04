import 'package:freezed_annotation/freezed_annotation.dart';

part 'cast_ui_item.freezed.dart';

@freezed
abstract class CastUiItem with _$CastUiItem {
  factory CastUiItem({
    required String name,
    required String originalName,
    required String profilePath,
  }) = _CastUiItem;
}
