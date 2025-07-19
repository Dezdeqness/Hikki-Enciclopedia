import 'package:hikki_api_service/src/models/responses/tv.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tv_collection.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class TvCollection {
  final int page;
  final List<Tv> results;
  final int totalPages;
  final int totalResults;

  TvCollection({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory TvCollection.fromJson(Map<String, dynamic> json) => _$TvCollectionFromJson(json);
  Map<String, dynamic> toJson() => _$TvCollectionToJson(this);
}
