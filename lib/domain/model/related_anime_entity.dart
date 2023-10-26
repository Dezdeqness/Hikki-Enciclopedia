import 'package:freezed_annotation/freezed_annotation.dart';

part 'related_anime_entity.freezed.dart';

@freezed
class RelatedAnimeEntity with _$RelatedAnimeEntity {
  factory RelatedAnimeEntity({
    required int id,
    required String title,
    required String imageUrl,
    required String relationType,
    required String relationTypeFormatted,
  }) = _RelatedAnimeEntity;
}


