import 'package:freezed_annotation/freezed_annotation.dart';

part 'genre_entity.freezed.dart';

@freezed
class GenreEntity with _$GenreEntity {
  factory GenreEntity({
    required int id,
    required String name,
  }) = _GenreEntity;
}
