import 'package:hikki_api_service/src/utils/date_parser.dart';
import 'package:json_annotation/json_annotation.dart';

part 'season_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SeasonResponse {
  final int id;
  final int episodeCount;
  final String name;
  final String overview;
  @JsonKey(fromJson: parseDateFromString)
  final DateTime? airDate;
  final String posterPath;
  final double voteAverage;
  final int seasonNumber;

  SeasonResponse({
    required this.id,
    required this.name,
    required this.episodeCount,
    required this.overview,
    required this.posterPath,
    required this.airDate,
    required this.voteAverage,
    required this.seasonNumber,
  });

  factory SeasonResponse.fromJson(Map<String, dynamic> json) => _$SeasonResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SeasonResponseToJson(this);
}
