import 'package:json_annotation/json_annotation.dart';

part 'anime_details_model.g.dart';

@JsonSerializable()
class AnimeDetailsResponse {
  final int id;
  final String title;
  @JsonKey(name: "main_picture")
  final Map<String, String> mainPicture;
  @JsonKey(name: "start_date")
  final String? startDate;
  @JsonKey(name: "end_date")
  final String? endDate;
  final String synopsis;
  final double? mean;
  final int? rank;
  final int popularity;
  @JsonKey(name: "num_list_users")
  final int numListUsers;
  @JsonKey(name: "num_scoring_users")
  final int numScoringUsers;
  @JsonKey(name: "created_at")
  final String createdAt;
  @JsonKey(name: "updated_at")
  final String updatedAt;
  @JsonKey(name: "media_type")
  final String mediaType;
  final String status;
  final List<Genres> genres;
  @JsonKey(name: "num_episodes")
  final int numEpisodes;
  final String rating;
  final String source;
  @JsonKey(name: "average_episode_duration")
  final int averageEpisodeDuration;
  final List<Studios> studios;
  final List<Map<String, String>> pictures;
  @JsonKey(name: "related_anime")
  final List<RelatedAnime> relatedAnime;
  final List<Recommendations> recommendations;
  final Statistics statistics;

  AnimeDetailsResponse(
      {required this.id,
      required this.title,
      required this.mainPicture,
      required this.startDate,
      required this.endDate,
      required this.synopsis,
      required this.mean,
      required this.rank,
      required this.popularity,
      required this.numListUsers,
      required this.numScoringUsers,
      required this.createdAt,
      required this.updatedAt,
      required this.genres,
      required this.mediaType,
      required this.status,
      required this.numEpisodes,
      required this.rating,
      required this.source,
      required this.averageEpisodeDuration,
      required this.studios,
      required this.pictures,
      required this.relatedAnime,
      required this.recommendations,
      required this.statistics});

  factory AnimeDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$AnimeDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeDetailsResponseToJson(this);
}

@JsonSerializable()
class Genres {
  final int id;
  final String name;

  Genres({required this.id, required this.name});

  factory Genres.fromJson(Map<String, dynamic> json) => _$GenresFromJson(json);

  Map<String, dynamic> toJson() => _$GenresToJson(this);
}

@JsonSerializable()
class Studios {
  final int id;
  final String name;

  Studios({required this.id, required this.name});

  factory Studios.fromJson(Map<String, dynamic> json) =>
      _$StudiosFromJson(json);

  Map<String, dynamic> toJson() => _$StudiosToJson(this);
}

@JsonSerializable()
class RelatedAnime {
  final Node node;
  @JsonKey(name: "relation_type")
  final String relationType;
  @JsonKey(name: "relation_type_formatted")
  final String relationTypeFormatted;

  RelatedAnime(
      {required this.node,
      required this.relationType,
      required this.relationTypeFormatted});

  factory RelatedAnime.fromJson(Map<String, dynamic> json) =>
      _$RelatedAnimeFromJson(json);

  Map<String, dynamic> toJson() => _$RelatedAnimeToJson(this);
}

@JsonSerializable()
class Node {
  final int id;
  final String title;
  @JsonKey(name: "main_picture")
  final Map<String, String> mainPicture;

  Node({required this.id, required this.title, required this.mainPicture});

  factory Node.fromJson(Map<String, dynamic> json) => _$NodeFromJson(json);

  Map<String, dynamic> toJson() => _$NodeToJson(this);
}

@JsonSerializable()
class Recommendations {
  final Node node;
  @JsonKey(name: "num_recommendations")
  final int numRecommendations;

  Recommendations({required this.node, required this.numRecommendations});

  factory Recommendations.fromJson(Map<String, dynamic> json) =>
      _$RecommendationsFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendationsToJson(this);
}

@JsonSerializable()
class Statistics {
  final Map<String, dynamic> status;
  @JsonKey(name: "num_list_users")
  final int numListUsers;

  Statistics({required this.status, required this.numListUsers});

  factory Statistics.fromJson(Map<String, dynamic> json) =>
      _$StatisticsFromJson(json);

  Map<String, dynamic> toJson() => _$StatisticsToJson(this);
}
