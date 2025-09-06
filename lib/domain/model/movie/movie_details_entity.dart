import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hikki_enciclopedia/domain/model/index.dart';

part 'movie_details_entity.freezed.dart';

@freezed
abstract class MovieDetailsEntity with _$MovieDetailsEntity {
  factory MovieDetailsEntity({
    required int id,
    required String title,
    required String originalTitle,
    required String originalLanguage,
    required String overview,
    required double popularity,
    required String? backdropPath,
    required String posterPath,
    required String status,
    required String? mediaType,
    required String tagline,
    required List<GenreEntity> genres,
    required DateTime? releaseDate,
    required double voteAverage,
    required int voteCount,
    required List<String> originCountry,
    required MovieCollectionEntity similar,
    required MovieCollectionEntity recommendations,
    required List<VideoEntity> videos,
    required List<CastEntity> casts,
  }) = _MovieDetailsEntity;
}
