import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hikki_api_service/hikki_api_service.dart';
import 'package:hikki_enciclopedia/presentation/explorer/models/movie_ui_item.dart';

part 'explorer_state.freezed.dart';

@freezed
sealed class ExplorerState with _$ExplorerState {
  const factory ExplorerState.initial() = Initial;
  const factory ExplorerState.loading() = Loading;
  const factory ExplorerState.success({
    required List<MovieUiItem> movies,
    required int currentPage,
    required bool hasMore,
    @Default('') String query,
    @Default(false) bool isLoadingMore,
  }) = Success;
  const factory ExplorerState.error(HikkiApiException error) = Error;
}
