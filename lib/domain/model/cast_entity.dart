import 'package:freezed_annotation/freezed_annotation.dart';

part 'cast_entity.freezed.dart';

@freezed
abstract class CastEntity with _$CastEntity {
  factory CastEntity({
    required int id,
    required String name,
    required int gender,
    required String knownForDepartment,
    required String originalName,
    required double popularity,
    required String profilePath,
    required String character,
    required String creditId,
    required int order,
  }) = _CastEntity;
}
