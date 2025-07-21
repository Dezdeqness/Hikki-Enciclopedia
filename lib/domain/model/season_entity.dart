import 'package:freezed_annotation/freezed_annotation.dart';

part 'season_entity.freezed.dart';

@freezed
abstract class SeasonEntity with _$SeasonEntity {
  factory SeasonEntity({
    required int id,
    required String name,
    required int episodeCount,
    required String overview,
    required DateTime? airDate,
    required String posterPath,
    required double voteAverage,
    required int seasonNumber,
  }) = _SeasonEntity;
}
