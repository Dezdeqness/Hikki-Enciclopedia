import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hikki_enciclopedia/domain/model/index.dart';

part 'upcoming_state.freezed.dart';

@freezed
class UpcomingState with _$UpcomingState {
  factory UpcomingState({
    @Default([]) List<AnimeEntity> items,
    @Default(false) bool isLoading,
    @Default(false) bool isError,
  }) = _UpcomingState;
}
