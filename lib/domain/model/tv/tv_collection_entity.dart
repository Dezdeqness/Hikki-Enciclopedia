import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hikki_enciclopedia/domain/model/tv/tv_entity.dart';

part 'tv_collection_entity.freezed.dart';

@freezed
abstract class TvCollectionEntity with _$TvCollectionEntity {
  factory TvCollectionEntity({
    required int page,
    required List<TvEntity> items,
    required int totalPages,
  }) = _TvCollectionEntity;
}
