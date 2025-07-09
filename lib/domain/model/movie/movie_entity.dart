import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_entity.freezed.dart';

@freezed
abstract class MovieEntity with _$MovieEntity {
  factory MovieEntity({
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
    required List<String> originCountry,
    required double voteAverage,
    required int voteCount,
  }) = _MovieEntity;
}
