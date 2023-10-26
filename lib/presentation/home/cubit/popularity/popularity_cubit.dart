import 'package:bloc/bloc.dart';
import 'package:hikki_enciclopedia/domain/model/index.dart';
import 'package:hikki_enciclopedia/domain/usecase/get_anime_list_use_case.dart';
import 'package:hikki_enciclopedia/presentation/home/cubit/popularity/popularity_state.dart';

class PopularityCubit extends Cubit<PopularityState> {
  final GetAnimeListUseCase useCase;

  PopularityCubit({required this.useCase}) : super(PopularityState());

  void fetchByPopularity() async {
    emit(state.copyWith(isLoading: true));
    final result =
        await useCase.execute(rankingType: RankingTypeEntity.airing.id);
    if (result.isSuccess) {
      emit(
        state.copyWith(items: result.success, isLoading: false),
      );
    } else {
      emit(state.copyWith(isLoading: false, isError: true));
    }
  }
}
