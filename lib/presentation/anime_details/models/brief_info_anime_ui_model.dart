import 'package:freezed_annotation/freezed_annotation.dart';

part 'brief_info_anime_ui_model.freezed.dart';

@freezed
class BriefInfoAnimeUIModel with _$BriefInfoAnimeUIModel {
  factory BriefInfoAnimeUIModel({
    required String title,
    required String value,
  }) = _BriefInfoAnimeUIModel;
}
