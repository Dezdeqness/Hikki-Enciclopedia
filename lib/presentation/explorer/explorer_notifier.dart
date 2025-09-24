import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hikki_enciclopedia/core/utils/result_type_utils.dart';
import 'package:hikki_enciclopedia/domain/repository/movie/movie_repository.dart';
import 'package:hikki_enciclopedia/presentation/explorer/explorer_state.dart';
import 'package:hikki_enciclopedia/presentation/explorer/mapper/movie_ui_mapper.dart';
import 'package:hikki_enciclopedia/presentation/explorer/providers/explorer_providers.dart';

class ExplorerNotifier extends Notifier<ExplorerState> {
  late final MovieRepository _repo;
  late final MovieUiMapper _mapper;
  String _currentQuery = '';
  Timer? _searchDebounce;

  @override
  ExplorerState build() {
    _repo = ref.read(movieRepositoryProvider);
    _mapper = ref.read(movieUiMapperProvider);
    _fetchInitial();
    return const ExplorerState.initial();
  }

  Future<void> _fetchInitial({bool isInitial = true, String query = ""}) async {
    if (isInitial) {
      state = const ExplorerState.loading();
    }

    final result = await _repo.searchMovies(
      page: 1,
      query: query,
    );

    state = result.when(
      success: (data) => ExplorerState.success(
        movies: data.items.map((item) => _mapper.toUiModel(item)).toList(),
        currentPage: data.page,
        hasMore: data.page < data.totalPages,
        query: query ?? '',
      ),
      failure: (error) => ExplorerState.error(error),
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
    final result = await _repo.searchMovies(
      page: nextPage,
      query: current.query,
    );

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

  Future<void> onSearchChanged(String query) async {
    final newQuery = query.trim().toLowerCase();
    if (newQuery == _currentQuery) return;

    _currentQuery = newQuery;
    _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 1500), () {
      _fetchInitial(query: _currentQuery);
    });
  }

  Future<void> onSearchCleared() async {
    _currentQuery = "";
    _searchDebounce?.cancel();
    state = const ExplorerState.success(
      movies: [],
      currentPage: 1,
      hasMore: false,
    );
  }
}
