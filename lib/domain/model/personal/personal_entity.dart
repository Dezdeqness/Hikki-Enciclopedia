import 'package:freezed_annotation/freezed_annotation.dart';

part 'personal_entity.freezed.dart';

@freezed
abstract class PersonalEntity with _$PersonalEntity {
  factory PersonalEntity({
    required int id,
    required String title,
    required String originalTitle,
    required String overview,
    required double popularity,
    required String backdropPath,
    required String posterPath,
    required double voteAverage,
    required int voteCount,
    required int? rating,
  }) = _PersonalEntity;
}
