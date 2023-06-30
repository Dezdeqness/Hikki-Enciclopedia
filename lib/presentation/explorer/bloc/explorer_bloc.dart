import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hikki_enciclopedia/domain/model/ranking_type_entity.dart';
import 'package:hikki_enciclopedia/domain/usecase/get_anime_list_use_case.dart';
import 'package:hikki_enciclopedia/presentation/explorer/bloc/explorer_event.dart';
import 'package:hikki_enciclopedia/presentation/explorer/bloc/explorer_state.dart';

class ExplorerBloc extends Bloc<ExplorerEvent, ExplorerState> {
  final GetAnimeListUseCase getAnimeListUseCase;

  ExplorerBloc({required this.getAnimeListUseCase})
      : super(const ExplorerState()) {
    on<GetExplorerPageEvent>(_onGetExplorerPageRequested);
  }

  _onGetExplorerPageRequested(
    GetExplorerPageEvent event,
    Emitter<ExplorerState> emit,
  ) async {
    emit(
      state.copyWith(
        isLoading: () => true,
        rankingType: () => RankingTypeEntity.fromId(event.rankingType),
      ),
    );

    final result =
        await getAnimeListUseCase.execute(rankingType: event.rankingType);

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
}
