import 'package:freezed_annotation/freezed_annotation.dart';

part 'personal_ui_item.freezed.dart';

@freezed
abstract class PersonalUiItem with _$PersonalUiItem {
  factory PersonalUiItem({
    required int id,
    required String name,
    required String posterPath,
    required String overview,
    required int voteAverage,
    required int? rating,
  }) = _PersonalUiItem;
}
