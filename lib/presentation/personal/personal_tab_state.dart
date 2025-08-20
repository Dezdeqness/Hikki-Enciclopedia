import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hikki_enciclopedia/domain/model/personal_list_type.dart';
import 'package:hikki_enciclopedia/presentation/personal/models/personal_ui_item.dart';
import 'package:hikki_enciclopedia/presentation/personal/personal_tab_status.dart';

part 'personal_tab_state.freezed.dart';

@freezed
abstract class PersonalTabState with _$PersonalTabState {
  factory PersonalTabState({
    @Default([]) List<PersonalUiItem> items,
    @Default(1) int currentPage,
    @Default(false) bool hasMore,
    @Default(PersonalListType.tv) PersonalListType type,
    @Default(false) bool isLoadingMore,
    @Default(PersonalTabStatus.initial()) PersonalTabStatus status,
  }) = _PersonalTabState;
}
