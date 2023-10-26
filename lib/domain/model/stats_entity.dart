import 'package:freezed_annotation/freezed_annotation.dart';

part 'stats_entity.freezed.dart';

@freezed
class StatsEntity with _$StatsEntity {
  factory StatsEntity({
     required int numListUsers,
     required int watching,
     required int completed,
     required int onHold,
     required int dropped,
     required int planToWatch,
  }) = _StatsEntity;
}
