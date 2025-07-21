import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_entity.freezed.dart';

@freezed
abstract class VideoEntity with _$VideoEntity {
  factory VideoEntity({
    required String id,
    required String name,
    required int size,
    required String previewImageUrl,
    required String site,
    required String type,
    required bool official,
  }) = _VideoEntity;
}
