import 'package:freezed_annotation/freezed_annotation.dart';

part 'recommendation_entity.freezed.dart';

@freezed
class RecommendationEntity with _$RecommendationEntity {
  factory RecommendationEntity({
    required int id,
    required String title,
    required String imageUrl,
    required int numRecommendations,
  }) = _RecommendationEntity;
}
