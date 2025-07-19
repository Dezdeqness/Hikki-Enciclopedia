import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_entity.freezed.dart';

@freezed
abstract class TvEntity with _$TvEntity {
  factory TvEntity({
    required int id,
    required String name,
    required String originalName,
    required String originalLanguage,
    required String overview,
    required double popularity,
    required String backdropPath,
    required String posterPath,
    required List<int> genreIds,
    required DateTime? firstAirDate,
    required bool adult,
    required double voteAverage,
    required int voteCount,
  }) = _TvEntity;
}
