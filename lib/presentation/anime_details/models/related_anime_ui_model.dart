import 'package:freezed_annotation/freezed_annotation.dart';

part 'related_anime_ui_model.freezed.dart';

@freezed
class RelatedAnimeUiModel with _$RelatedAnimeUiModel {
  factory RelatedAnimeUiModel({
    required int id,
    required String title,
    required String imageUrl,
    required String relationType,
  }) = _RelatedAnimeUiModel;
}
