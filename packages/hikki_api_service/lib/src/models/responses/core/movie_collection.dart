import 'package:hikki_api_service/src/models/responses/movie.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_collection.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class MovieCollection {
  final int page;
  final List<Movie> results;
  final int totalPages;
  final int totalResults;

  MovieCollection({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MovieCollection.fromJson(Map<String, dynamic> json) => _$MovieCollectionFromJson(json);
  Map<String, dynamic> toJson() => _$MovieCollectionToJson(this);
}
