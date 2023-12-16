import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hikki_enciclopedia/domain/model/index.dart';
import 'package:hikki_enciclopedia/presentation/anime_details/models/index.dart';

part 'anime_details_state.freezed.dart';

@freezed
class AnimeDetailsState with _$AnimeDetailsState {
  factory AnimeDetailsState({
    @Default(false) bool isLoading,
    @Default(false) bool isError,
    @Default('') String error,
    @Default(false) bool isTransparentToolbar,
    @Default('') String title,
    required AnimeInfo info,
  }) = _AnimeDetailsState;
}

@freezed
class AnimeInfo with _$AnimeInfo {
  factory AnimeInfo({
    @Default(0) int id,
    @Default('') String title,
    @Default(0.0) double score,
    @Default('') String imageUrl,
    @Default('') String startYear,
    @Default('') String synopsis,
    @Default('') String rank,
    @Default('') String popularity,
    @Default('') String numListUsers,
    @Default('') String numScoringUsers,
    @Default([]) List<BriefInfoAnimeUIModel> briefItems,
    @Default(MediaTypeAnimeEntity.unknown) MediaTypeAnimeEntity mediaType,
    @Default(StatusAnimeEntity.unknown) StatusAnimeEntity status,
    @Default([]) List<String> genres,
    @Default('') String numEpisodes,
    @Default(AgeRatingAnimeEntity.unknown) AgeRatingAnimeEntity rating,
    @Default('') String averageEpisodeDuration,
    @Default([]) List<String> studios,
    @Default([]) List<String>screenshots,
    @Default([]) List<RelatedAnimeUiModel> relatedAnime,
    @Default([]) List<RecommendAnimeUiModel> recommendations,
    @Default([]) List<StatisticsAnimeUiModel> stats,
  }) = _AnimeInfo;
}
