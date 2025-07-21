import 'package:hikki_api_service/src/models/index.dart';
import 'package:hikki_api_service/src/utils/date_parser.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tv_details_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TvDetailsResponse {
  final String? backdropPath;
  final List<GenreResponse> genres;
  final int id;
  final String originalLanguage;
  final String originalName;
  final String overview;
  final double popularity;
  final String posterPath;
  final String status;
  final String tagline;
  final String type;
  final List<String> originCountry;
  @JsonKey(fromJson: parseDateFromString)
  final DateTime? firstAirDate;
  @JsonKey(fromJson: parseDateFromString)
  final DateTime? lastAirDate;
  final String name;
  final double voteAverage;
  final int voteCount;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final List<SeasonResponse> seasons;
  final TvCollection similar;
  final TvCollection recommendations;
  final VideosResponse videos;
  final Credits credits;

  TvDetailsResponse({
    required this.backdropPath,
    required this.genres,
    required this.id,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.originCountry,
    required this.firstAirDate,
    required this.lastAirDate,
    required this.name,
    required this.voteAverage,
    required this.voteCount,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.seasons,
    required this.status,
    required this.tagline,
    required this.type,
    required this.similar,
    required this.recommendations,
    required this.videos,
    required this.credits,
  });

  factory TvDetailsResponse.fromJson(Map<String, dynamic> json) => _$TvDetailsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TvDetailsResponseToJson(this);
}
