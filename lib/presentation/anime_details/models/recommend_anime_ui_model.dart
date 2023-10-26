import 'package:freezed_annotation/freezed_annotation.dart';

part 'recommend_anime_ui_model.freezed.dart';

@freezed
class RecommendAnimeUiModel with _$RecommendAnimeUiModel {
  factory RecommendAnimeUiModel({
    required int id,
    required String title,
    required String imageUrl,
  }) = _RecommendAnimeUiModel;
}
