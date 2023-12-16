import 'package:bloc/bloc.dart';
import 'package:hikki_enciclopedia/domain/usecase/get_anime_details_use_case.dart';
import 'package:hikki_enciclopedia/presentation/anime_details/composer/anime_details_composer.dart';

import 'anime_details_state.dart';

class AnimeDetailsCubit extends Cubit<AnimeDetailsState> {
  final GetAnimeDetailsUseCase useCase;
  final AnimeDetailsComposer composer;

  AnimeDetailsCubit({
    required this.useCase,
    required this.composer,
  }) : super(
          AnimeDetailsState(
            isLoading: true,
            info: AnimeInfo(),
          ),
        );

  Future<void> fetchAnimeDetails(int id) async {
    emit(state.copyWith(isLoading: true, isError: false));
    final result = await useCase.execute(animeId: id);
    if (result.isSuccess) {
      final info = composer.compose(result.success);
      emit(
        state.copyWith(
          isLoading: false,
          error: '',
          info: info,
          isError: false,
          title: info.title,
        ),
      );
    } else {
      emit(
        state.copyWith(
          isLoading: false,
          error: '',
          isError: true,
        ),
      );
    }
  }

  void onTransparentToolbarChanged(bool isTransparentToolbar) {
    emit(
      state.copyWith(
          isTransparentToolbar: isTransparentToolbar
      ),
    );
  }
}
