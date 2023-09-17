import 'package:json_annotation/json_annotation.dart';

part 'anime_api_model.g.dart';

@JsonSerializable()
class AnimeApi {
  final List<Data> data;

  AnimeApi({required this.data});

  factory AnimeApi.fromJson(Map<String, dynamic> json) =>
      _$AnimeApiFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeApiToJson(this);
}

@JsonSerializable()
class Data {
  final AnimeNode node;

  Data({required this.node});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class AnimeNode {
  final int id;
  final String title;
  @JsonKey(name: "main_picture")
  final Map<String, String> mainPicture;
  @JsonKey(name: "media_type")
  final String mediaType;
  final double? mean;

  AnimeNode(
      {required this.id,
      required this.title,
      required this.mainPicture,
      required this.mediaType,
      required this.mean});

  factory AnimeNode.fromJson(Map<String, dynamic> json) => _$NodeFromJson(json);

  Map<String, dynamic> toJson() => _$NodeToJson(this);
}
