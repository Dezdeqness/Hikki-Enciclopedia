import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hikki_enciclopedia/domain/model/index.dart';

part 'popularity_state.freezed.dart';

@freezed
class PopularityState with _$PopularityState {
  factory PopularityState({
    @Default([]) List<AnimeEntity> items,
    @Default(false) bool isLoading,
    @Default(false) bool isError,
  }) = _PopularityState;
}
