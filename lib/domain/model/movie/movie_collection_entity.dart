import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hikki_enciclopedia/domain/model/movie/movie_entity.dart';

part 'movie_collection_entity.freezed.dart';

@freezed
abstract class MovieCollectionEntity with _$MovieCollectionEntity {
  factory MovieCollectionEntity({
    required int page,
    required List<MovieEntity> items,
    required int totalPages,
  }) = _MovieCollectionEntity;
}
