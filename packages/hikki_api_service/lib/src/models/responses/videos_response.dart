import 'package:json_annotation/json_annotation.dart';

part 'videos_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class VideosResponse {
  final List<Video> results;

  VideosResponse({
    required this.results,
  });

  factory VideosResponse.fromJson(Map<String, dynamic> json) => _$VideosResponseFromJson(json);
  Map<String, dynamic> toJson() => _$VideosResponseToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Video {
  final String name;
  final String key;
  final String site;
  final int size;
  final String type;
  final bool official;
  final String id;

  Video({
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.id,
  });

  factory Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);
  Map<String, dynamic> toJson() => _$VideoToJson(this);
}