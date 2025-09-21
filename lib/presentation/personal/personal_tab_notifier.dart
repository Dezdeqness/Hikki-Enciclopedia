import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hikki_api_service/hikki_api_service.dart';
import 'package:hikki_enciclopedia/core/utils/result_type_utils.dart';
import 'package:hikki_enciclopedia/domain/model/personal/personal_collection_entity.dart';
import 'package:hikki_enciclopedia/domain/model/personal_list_type.dart';
import 'package:hikki_enciclopedia/domain/model/personal_page_type.dart';
import 'package:hikki_enciclopedia/presentation/personal/mapper/personal_ui_mapper.dart';
import 'package:hikki_enciclopedia/presentation/personal/personal_tab_args.dart';
import 'package:hikki_enciclopedia/presentation/personal/personal_tab_state.dart';
import 'package:hikki_enciclopedia/presentation/personal/personal_tab_status.dart';
import 'package:hikki_enciclopedia/presentation/personal/provider/personal_providers.dart';
import 'package:result_type/result_type.dart';

class PersonalTabNotifier
    extends FamilyNotifier<PersonalTabState, PersonalTabArgs> {
  late PersonalPageType type;
  late PersonalListType listType;
  late final PersonalUiMapper _mapper;
  late final Future<Result<PersonalCollectionEntity, HikkiApiException>>
      Function(int page, PersonalListType type) _fetcher;

  @override
  PersonalTabState build(PersonalTabArgs arg) {
    type = arg.type;
    listType = arg.listType;
    _fetcher = ref.read(fetcherProvider(type));
    _mapper = ref.read(personalUiMapperProvider);
    _fetchInitial();
    return PersonalTabState();
  }

  Future<void> switchTab(PersonalListType type) async {
    state = state.copyWith(type: type);

    _fetchInitial(isInitial: true);
  }

  Future<void> _fetchInitial({bool isInitial = true}) async {
    if (isInitial) {
      state = stateOrNull?.copyWith(status: PersonalTabStatus.loading()) ??
          PersonalTabState(status: PersonalTabStatus.loading());
    }

    final result = await _fetcher.call(1, listType);

    result.when(
      success: (data) {
        state = state.copyWith(
          status: PersonalTabStatus.loaded(),
          items: data.items.map((item) => _mapper.fromEntity(item)).toList(),
          currentPage: data.page,
          hasMore: data.page < data.totalPages,
        );
      },
      failure: (e) {
        state = state.copyWith(
          status: PersonalTabStatus.error(e),
        );
      },
    );
  }

  Future<void> refresh() async {
    _fetchInitial(isInitial: false);
  }

  Future<void> fetchNextPage() async {
    final current = state;

    if (current is! Success || current.isLoadingMore || !current.hasMore) {
      return;
    }

    state = current.copyWith(isLoadingMore: true);

    final nextPage = current.currentPage + 1;
    final result = await _fetcher.call(nextPage, listType);

    result.when(
      success: (collection) {
        final newItems = [
          ...current.items,
          ...collection.items.map((item) => _mapper.fromEntity(item))
        ];
        final hasMore = nextPage < collection.totalPages;

        state = current.copyWith(
          items: newItems,
          currentPage: nextPage,
          isLoadingMore: false,
          hasMore: hasMore,
        );
      },
      failure: (e) {
        // state = ExplorerState.error(e);
      },
    );
  }
}
