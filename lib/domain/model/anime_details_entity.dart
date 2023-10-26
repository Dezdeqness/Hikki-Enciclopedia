import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hikki_enciclopedia/domain/model/index.dart';

part 'anime_details_entity.freezed.dart';

@freezed
class AnimeDetailsEntity with _$AnimeDetailsEntity {
  factory AnimeDetailsEntity({
    required int id,
    required String title,
    required String type,
    required double score,
    required String imageUrl,
    required String startDate,
    required String endDate,
    required String synopsis,
    required int rank,
    required int popularity,
    required int numListUsers,
    required int numScoringUsers,
    required String createdAt,
    required String updatedAt,
    required MediaTypeAnimeEntity mediaType,
    required StatusAnimeEntity status,
    required List<GenreEntity> genres,
    required int numEpisodes,
    required AgeRatingAnimeEntity rating,
    required String source,
    required int averageEpisodeDuration,
    required List<StudioEntity> studios,
    required List<String> screenshots,
    required List<RelatedAnimeEntity> relatedAnime,
    required List<RecommendationEntity> recommendations,
    required StatsEntity stats,
  }) = _AnimeDetailsEntity;
}
