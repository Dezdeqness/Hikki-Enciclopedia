import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hikki_enciclopedia/domain/model/index.dart';

part 'explorer_state.freezed.dart';

@freezed
class ExplorerState with _$ExplorerState {
  factory ExplorerState({
    @Default(RankingTypeEntity.all) RankingTypeEntity rankingType,
    @Default([]) List<AnimeEntity> items,
    @Default(false) bool isLoading,
    @Default(false) bool isPageLoading,
    @Default(false) bool isRefreshing,
    @Default('') String error,
  }) = _ExplorerState;
}
