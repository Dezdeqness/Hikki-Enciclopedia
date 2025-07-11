import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hikki_enciclopedia/core/utils/result_type_utils.dart';
import 'package:hikki_enciclopedia/domain/repository/movie/movie_repository.dart';
import 'package:hikki_enciclopedia/presentation/explorer/explorer_state.dart';
import 'package:hikki_enciclopedia/presentation/explorer/mapper/movie_ui_mapper.dart';
import 'package:hikki_enciclopedia/presentation/explorer/providers/explorer_providers.dart';

class ExplorerNotifier extends Notifier<ExplorerState> {
  late final MovieRepository _repo;
  late final MovieUiMapper _mapper;

  @override
  ExplorerState build() {
    _repo = ref.read(movieRepositoryProvider);
    _mapper = ref.read(movieUiMapperProvider);
    _fetchInitial();
    return const ExplorerState.initial();
  }

  Future<void> _fetchInitial({bool isInitial = true}) async {
    if (isInitial) {
      state = const ExplorerState.loading();
    }

    final result = await _repo.getMovies(page: 1);

    state = result.when(
      success: (data) => ExplorerState.success(
        movies: data.items.map((item) => _mapper.toUiModel(item)).toList(),
        currentPage: data.page,
        hasMore: data.page < data.totalPages,
      ),
      failure: ExplorerState.error,
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
    final result = await _repo.getMovies(page: nextPage);

    result.when(
      success: (collection) {
        final newMovies = [
          ...current.movies,
          ...collection.items.map((item) => _mapper.toUiModel(item))
        ];
        final hasMore = nextPage < collection.totalPages;

        state = current.copyWith(
          movies: newMovies,
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
