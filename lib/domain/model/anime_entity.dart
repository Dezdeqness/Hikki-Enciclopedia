import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_entity.freezed.dart';

@freezed
class AnimeEntity with _$AnimeEntity {
  factory AnimeEntity({
    required int id,
    required String title,
    required String type,
    required double score,
    required String imageUrl,
  }) = _AnimeEntity;
}
