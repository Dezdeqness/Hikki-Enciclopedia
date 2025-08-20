import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_entity.freezed.dart';

@freezed
abstract class MovieEntity with _$MovieEntity {
  factory MovieEntity({
    required int id,
    required String title,
    required String originalTitle,
    required String originalLanguage,
    required String overview,
    required double popularity,
    required String backdropPath,
    required String posterPath,
    required List<int> genreIds,
    required DateTime? releaseDate,
    required bool adult,
    required double voteAverage,
    required int voteCount,
    required int? rating,
  }) = _MovieEntity;
}
