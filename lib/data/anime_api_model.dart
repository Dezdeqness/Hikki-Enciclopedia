import 'package:json_annotation/json_annotation.dart';

part 'anime_api_model.g.dart';

@JsonSerializable()
class AnimeResponse {
  final List<Data> data;

  AnimeResponse({required this.data});

  factory AnimeResponse.fromJson(Map<String, dynamic> json) =>
      _$AnimeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeResponseToJson(this);
}

@JsonSerializable()
class Data {
  final Node node;

  Data({required this.node});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Node {
  final int id;
  final String title;
  @JsonKey(name: "main_picture")
  final Map<String, String> mainPicture;
  @JsonKey(name: "media_type")
  final String mediaType;
  final double? mean;

  Node(
      {required this.id,
      required this.title,
      required this.mainPicture,
      required this.mediaType,
      required this.mean});

  factory Node.fromJson(Map<String, dynamic> json) => _$NodeFromJson(json);

  Map<String, dynamic> toJson() => _$NodeToJson(this);
}
