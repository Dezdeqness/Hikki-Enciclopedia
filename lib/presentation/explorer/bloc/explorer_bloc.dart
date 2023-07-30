import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hikki_enciclopedia/domain/model/ranking_type_entity.dart';
import 'package:hikki_enciclopedia/domain/usecase/get_anime_list_use_case.dart';
import 'package:hikki_enciclopedia/presentation/explorer/bloc/explorer_event.dart';
import 'package:hikki_enciclopedia/presentation/explorer/bloc/explorer_state.dart';
import 'package:async/async.dart';

class ExplorerBloc extends Bloc<ExplorerEvent, ExplorerState> {
  final GetAnimeListUseCase getAnimeListUseCase;

  ExplorerBloc({required this.getAnimeListUseCase})
      : super(const ExplorerState()) {
    on<GetExplorerPageEvent>(_onGetExplorerPageRequested);
    on<GetExplorerNextPageEvent>(_onGetExplorerNextPageRequested);
    on<RefreshEvent>(_onRefreshPageRequested);
  }

  int _offset = 0;

  CancelableOperation? _jobWorker;

  _onRefreshPageRequested(
    RefreshEvent event,
    Emitter<ExplorerState> emit,
  ) async {
    emit(
      state.copyWith(
        isRefreshing: () => true,
      ),
    );
    _offset = 0;

    final result = await getAnimeListUseCase.execute(
      rankingType: state.rankingType.id,
      offset: _offset,
    );

    if (result.isSuccess) {
      final items = result.success;
      emit(
        state.copyWith(
          items: () => items,
          error: () => "",
          isRefreshing: () => false,
        ),
      );
    } else {
      final error = result.failure;
      emit(
        state.copyWith(
          items: () => [],
          error: () => error.name,
          isRefreshing: () => false,
        ),
      );
    }
  }

  _onGetExplorerPageRequested(
    GetExplorerPageEvent event,
    Emitter<ExplorerState> emit,
  ) async {
    _offset = 0;

    emit(
      state.copyWith(
        isLoading: () => true,
        rankingType: () => RankingTypeEntity.fromId(event.rankingType),
      ),
    );

    final result = await getAnimeListUseCase.execute(
      rankingType: event.rankingType,
      offset: _offset,
    );

    if (result.isSuccess) {
      final items = result.success;
      emit(
        state.copyWith(
          items: () => items,
          error: () => "",
          isLoading: () => false,
        ),
      );
    } else {
      final error = result.failure;
      emit(
        state.copyWith(
          items: () => [],
          error: () => error.name,
          isLoading: () => false,
        ),
      );
    }
  }

  _onGetExplorerNextPageRequested(
    GetExplorerNextPageEvent event,
    Emitter<ExplorerState> emit,
  ) async {
    if (state.isPageLoading) {
      return;
    }
    _offset = state.items.length;
    emit(
      state.copyWith(
        isPageLoading: () => true,
      ),
    );

    final result = await getAnimeListUseCase.execute(
      rankingType: state.rankingType.id,
      offset: _offset,
    );

    if (result.isSuccess) {
      final items = result.success;
      emit(
        state.copyWith(
          items: () => state.items + items,
          error: () => "",
          isPageLoading: () => false,
        ),
      );
    } else {
      emit(
        state.copyWith(
          isPageLoading: () => false,
        ),
      );
    }
  }
}
