import 'package:freezed_annotation/freezed_annotation.dart';

part 'studio_entity.freezed.dart';

@freezed
class StudioEntity with _$StudioEntity {
  factory StudioEntity({
    required int id,
    required String name,
  }) = _StudioEntity;
}
