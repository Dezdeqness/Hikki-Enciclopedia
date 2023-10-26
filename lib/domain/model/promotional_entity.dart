import 'package:freezed_annotation/freezed_annotation.dart';

part 'promotional_entity.freezed.dart';

@freezed
class PromotionalEntity with _$PromotionalEntity {
  factory PromotionalEntity({
    required String name,
    required String kind,
    required String imageUrl,
    required String url,
  }) = _PromotionalEntity;
}
