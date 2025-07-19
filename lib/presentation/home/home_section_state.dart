import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hikki_api_service/hikki_api_service.dart';

import 'models/tv_ui_item.dart';

part 'home_section_state.freezed.dart';

@freezed
sealed class HomeSectionState with _$HomeSectionState {
  const factory HomeSectionState.initial() = Initial;
  const factory HomeSectionState.loading() = Loading;
  const factory HomeSectionState.success({
    required List<TvUiItem> tvs,
  }) = Success;
  const factory HomeSectionState.error(HikkiApiException error) = Error;
}
