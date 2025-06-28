import 'package:hikki_enciclopedia/presentation/anime_details/dependency/anime_details_dependencies.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'anime_details_state.dart';

part 'anime_details.g.dart';

@riverpod
class AnimeDetails extends _$AnimeDetails {
  @override
  AnimeDetailsState build() {
    return AnimeDetailsState(
      status: const AnimeDetailsStatus.loading(),
    );
  }

  Future<void> fetchAnimeDetails(int id) async {
    state = state.copyWith(status: const AnimeDetailsStatus.loading());

    final result = await ref.read(getAnimeDetailsUseCaseProvider).execute(animeId: id);

    if (result.isSuccess) {
      final info = ref.read(animeDetailsComposerProvider).compose(result.success);
      state = state.copyWith(
        status: AnimeDetailsStatus.loaded(info),
        title: info.title,
      );
    } else {
      state = state.copyWith(
        status: AnimeDetailsStatus.error(result.failure.error.name),
      );
    }
  }

  void onTransparentToolbarChanged(bool isTransparentToolbar) {
    state = state.copyWith(
      isTransparentToolbar: isTransparentToolbar,
    );
  }
}
