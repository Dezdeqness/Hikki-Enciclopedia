import 'package:json_annotation/json_annotation.dart';

part 'genre_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GenreResponse {
  final int id;
  final String name;

  GenreResponse({
    required this.id,
    required this.name,
  });

  factory GenreResponse.fromJson(Map<String, dynamic> json) => _$GenreResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GenreResponseToJson(this);
}
