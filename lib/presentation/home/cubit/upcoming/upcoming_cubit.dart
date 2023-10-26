import 'package:bloc/bloc.dart';
import 'package:hikki_enciclopedia/domain/model/index.dart';
import 'package:hikki_enciclopedia/domain/usecase/get_anime_list_use_case.dart';
import 'package:hikki_enciclopedia/presentation/home/cubit/upcoming/upcoming_state.dart';

class UpcomingCubit extends Cubit<UpcomingState> {
  final GetAnimeListUseCase useCase;

  UpcomingCubit({required this.useCase}) : super(UpcomingState());

  void fetchUpcoming() async {
    emit(state.copyWith(isLoading: true));
    final result =
        await useCase.execute(rankingType: RankingTypeEntity.upcoming.id);
    if (result.isSuccess) {
      emit(
        state.copyWith(items: result.success, isLoading: false),
      );
    } else {
      emit(state.copyWith(isLoading: false, isError: true));
    }
  }
}
