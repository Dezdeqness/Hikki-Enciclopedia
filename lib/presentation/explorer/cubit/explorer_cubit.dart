import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hikki_enciclopedia/domain/model/ranking_type_entity.dart';
import 'package:hikki_enciclopedia/domain/usecase/get_anime_list_use_case.dart';
import 'package:hikki_enciclopedia/presentation/explorer/cubit/explorer_state.dart';
import 'package:async/async.dart';

class ExplorerCubit extends Cubit<ExplorerState> {
  final GetAnimeListUseCase getAnimeListUseCase;

  ExplorerCubit({required this.getAnimeListUseCase}) : super(ExplorerState());

  int _offset = 0;

  CancelableOperation? _jobWorker;

  void onSwipeRefreshed() async {
    emit(
      state.copyWith(
        isRefreshing: true,
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
          items: items,
          error: "",
          isRefreshing: false,
        ),
      );
    } else {
      final error = result.failure;
      emit(
        state.copyWith(
          items: [],
          error: error.name,
          isRefreshing: false,
        ),
      );
    }
  }

  void fetchInitialPage({
    RankingTypeEntity rankingType = RankingTypeEntity.all,
  }) async {
    _offset = 0;

    emit(
      state.copyWith(
        isLoading: true,
        rankingType: RankingTypeEntity.fromId(rankingType.id),
      ),
    );

    final result = await getAnimeListUseCase.execute(
      rankingType: rankingType.id,
      offset: _offset,
    );

    if (result.isSuccess) {
      final items = result.success;
      emit(
        state.copyWith(
          items: items,
          error: "",
          isLoading: false,
        ),
      );
    } else {
      final error = result.failure;
      emit(
        state.copyWith(
          items: [],
          error: error.name,
          isLoading: false,
        ),
      );
    }
  }

  void onLoadMore() async {
    if (state.isPageLoading) {
      return;
    }
    _offset = state.items.length;
    emit(
      state.copyWith(
        isPageLoading: true,
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
          items: state.items + items,
          error: "",
          isPageLoading: false,
        ),
      );
    } else {
      emit(
        state.copyWith(
          isPageLoading: false,
        ),
      );
    }
  }
}
