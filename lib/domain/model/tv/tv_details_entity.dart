import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hikki_enciclopedia/domain/model/cast_entity.dart';
import 'package:hikki_enciclopedia/domain/model/genre_entity.dart';
import 'package:hikki_enciclopedia/domain/model/season_entity.dart';
import 'package:hikki_enciclopedia/domain/model/tv/tv_collection_entity.dart';
import 'package:hikki_enciclopedia/domain/model/video_entity.dart';

part 'tv_details_entity.freezed.dart';

@freezed
abstract class TvDetailsEntity with _$TvDetailsEntity {
  factory TvDetailsEntity({
    required int id,
    required String name,
    required String originalName,
    required String originalLanguage,
    required String overview,
    required double popularity,
    required String? backdropPath,
    required String posterPath,
    required String status,
    required String type,
    required String tagline,
    required List<GenreEntity> genres,
    required DateTime? firstAirDate,
    required DateTime? lastAirDate,
    required double voteAverage,
    required int voteCount,
    required int numberOfEpisodes,
    required int numberOfSeasons,
    required List<String> originCountry,
    required TvCollectionEntity similar,
    required TvCollectionEntity recommendations,
    required List<SeasonEntity> seasons,
    required List<VideoEntity> videos,
    required List<CastEntity> casts,
  }) = _TvDetailsEntity;
}
