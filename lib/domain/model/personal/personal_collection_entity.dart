import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hikki_enciclopedia/domain/model/personal/personal_entity.dart';

part 'personal_collection_entity.freezed.dart';

@freezed
abstract class PersonalCollectionEntity with _$PersonalCollectionEntity {
  factory PersonalCollectionEntity({
    required int page,
    required List<PersonalEntity> items,
    required int totalPages,
  }) = _PersonalCollectionEntity;
}
