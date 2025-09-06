import 'package:hikki_api_service/src/models/index.dart';
import 'package:hikki_api_service/src/utils/date_parser.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_details_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieDetailsResponse {
  final String? backdropPath;
  final List<GenreResponse> genres;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String status;
  final String tagline;
  final String? mediaType;
  final List<String> originCountry;
  @JsonKey(fromJson: parseDateFromString)
  final DateTime? releaseDate;
  final String title;
  final double voteAverage;
  final int voteCount;
  final MovieCollection similar;
  final MovieCollection recommendations;
  final VideosResponse videos;
  final Credits credits;

  MovieDetailsResponse({
    required this.backdropPath,
    required this.genres,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.originCountry,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
    required this.status,
    required this.tagline,
    required this.mediaType,
    required this.similar,
    required this.recommendations,
    required this.videos,
    required this.credits,
  });

  factory MovieDetailsResponse.fromJson(Map<String, dynamic> json) => _$MovieDetailsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MovieDetailsResponseToJson(this);
}
