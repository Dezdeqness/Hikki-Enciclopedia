import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_entity.freezed.dart';

@freezed
abstract class ProfileEntity with _$ProfileEntity {
  factory ProfileEntity({
    required int id,
    required String name,
    required bool includeAdult,
    required String username,
    required String avatar,
  }) = _ProfileEntity;
}
