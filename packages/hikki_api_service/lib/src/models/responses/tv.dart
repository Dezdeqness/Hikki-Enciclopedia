import 'package:hikki_api_service/src/utils/date_parser.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tv.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Tv {
  final bool adult;
  final String? backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final String posterPath;
  @JsonKey(fromJson: parseDateFromString)
  final DateTime? firstAirDate;
  final String name;
  final double voteAverage;
  final int voteCount;

  Tv({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.firstAirDate,
    required this.name,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Tv.fromJson(Map<String, dynamic> json) => _$TvFromJson(json);
  Map<String, dynamic> toJson() => _$TvToJson(this);
}
