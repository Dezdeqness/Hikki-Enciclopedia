import 'package:freezed_annotation/freezed_annotation.dart';

part 'statistics_anime_ui_model.freezed.dart';

@freezed
class StatisticsAnimeUiModel with _$StatisticsAnimeUiModel {
  factory StatisticsAnimeUiModel({
    required String title,
    required String value,
    required double progress,
  }) = _StatisticsAnimeUiModel;
}
