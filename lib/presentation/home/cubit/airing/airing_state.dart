import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hikki_enciclopedia/domain/model/index.dart';

part 'airing_state.freezed.dart';

@freezed
class AiringState with _$AiringState {
  factory AiringState({
    @Default([]) List<AnimeEntity> items,
    @Default(false) bool isLoading,
    @Default(false) bool isError,
  }) = _AiringState;
}
