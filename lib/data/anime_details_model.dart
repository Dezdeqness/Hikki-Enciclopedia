import 'package:json_annotation/json_annotation.dart';

part 'anime_details_model.g.dart';

@JsonSerializable()
class AnimeDetailsResponse {
  final int? id;
  final String? title;
  @JsonKey(name: "main_picture")
  final Map<String, String> mainPicture;
  final String? synopsis;
  final double? mean;
  final List<Genres>? genres;
  final String? mediaType;
  final String? status;
  final int? numEpisodes;
  final String? rating;
  final List<Studios>? studios;
  final List<Map<String, String>>? pictures;
  final List<RelatedAnime>? relatedAnime;
  final List<Recommendations>? recommendations;
  final Statistics? statistics;

  AnimeDetailsResponse(
      {required this.id,
      required this.title,
      required this.mainPicture,
      required this.synopsis,
      required this.mean,
      required this.genres,
      required this.mediaType,
      required this.status,
      required this.numEpisodes,
      required this.rating,
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
  int? id;
  String? name;

  Genres({this.id, this.name});

  factory Genres.fromJson(Map<String, dynamic> json) =>
      _$GenresFromJson(json);

  Map<String, dynamic> toJson() => _$GenresToJson(this);
}


@JsonSerializable()
class Studios {
  int? id;
  String? name;

  Studios({this.id, this.name});

  factory Studios.fromJson(Map<String, dynamic> json) =>
      _$StudiosFromJson(json);

  Map<String, dynamic> toJson() => _$StudiosToJson(this);
}

@JsonSerializable()
class RelatedAnime {
  Node? node;
  String? relationType;
  String? relationTypeFormatted;

  RelatedAnime({this.node, this.relationType, this.relationTypeFormatted});

  factory RelatedAnime.fromJson(Map<String, dynamic> json) =>
      _$RelatedAnimeFromJson(json);

  Map<String, dynamic> toJson() => _$RelatedAnimeToJson(this);
}

@JsonSerializable()
class Node {
  int? id;
  String? title;
  @JsonKey(name: "main_picture")
  final Map<String, String> mainPicture;

  Node({this.id, this.title, required this.mainPicture});

  factory Node.fromJson(Map<String, dynamic> json) =>
      _$NodeFromJson(json);

  Map<String, dynamic> toJson() => _$NodeToJson(this);
}

@JsonSerializable()
class Recommendations {
  Node? node;
  int? numRecommendations;

  Recommendations({this.node, this.numRecommendations});

  factory Recommendations.fromJson(Map<String, dynamic> json) =>
      _$RecommendationsFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendationsToJson(this);
}

@JsonSerializable()
class Statistics {
  Map<String, int>? stats;
  int? numListUsers;

  Statistics({this.stats, this.numListUsers});

  factory Statistics.fromJson(Map<String, dynamic> json) =>
      _$StatisticsFromJson(json);

  Map<String, dynamic> toJson() => _$StatisticsToJson(this);
}

@JsonSerializable()
class Status {
  String? watching;
  String? completed;
  String? onHold;
  String? dropped;
  String? planToWatch;

  Status(
      {this.watching,
      this.completed,
      this.onHold,
      this.dropped,
      this.planToWatch});


  factory Status.fromJson(Map<String, dynamic> json) =>
      _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}
