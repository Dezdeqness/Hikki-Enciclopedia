import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hikki_enciclopedia/core/ui/error_screen.dart';
import 'package:hikki_enciclopedia/presentation/explorer/components/explorer_search_bar.dart';
import 'package:hikki_enciclopedia/presentation/explorer/explorer_state.dart';
import 'package:hikki_enciclopedia/presentation/explorer/providers/explorer_providers.dart';
import 'package:hikki_enciclopedia/presentation/navigation/hikki_app_router.dart';

import 'components/movie_cell.dart';
import 'components/movie_shimmer.dart';

@RoutePage()
class ExplorerPage extends ConsumerStatefulWidget {
  const ExplorerPage({
    super.key,
  });

  @override
  ConsumerState<ExplorerPage> createState() => _ExplorerPageState();
}

class _ExplorerPageState extends ConsumerState<ExplorerPage> {
  final ScrollController _scrollController = ScrollController();

  bool _loadingNextPage = false;

  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();

    _scrollController.addListener(() async {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent * 0.9 &&
          !_loadingNextPage) {
        _loadingNextPage = true;
        await ref.read(explorerNotifierProvider.notifier).fetchNextPage();
        _loadingNextPage = false;
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (query.isEmpty) {
      ref.read(explorerNotifierProvider.notifier).onSearchCleared();
    } else {
      ref.read(explorerNotifierProvider.notifier).onSearchChanged(query);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(explorerNotifierProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            ExplorerSearchBar(
              searchController: _searchController,
              onChanged: _onSearchChanged,
            ),
            const Divider(height: 1, thickness: 1),
            if (state is Success &&
                state.query.isNotEmpty &&
                state.movies.isEmpty)
              const Expanded(
                child: Center(
                  child: Text(
                    'No results found',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
              )
            else
              // Expanded content
              Expanded(
                child: RefreshIndicator(
                  child: Builder(
                    builder: (context) {
                      if (state is Loading || state is Initial) {
                        return const MovieShimmer();
                      }

                      if (state is Error) {
                        return CustomScrollView(
                          slivers: <Widget>[
                            SliverFillRemaining(
                              child: ErrorScreen(error: state.error.toString()),
                            ),
                          ],
                        );
                      }

                      final successState = state as Success;

                      final additionalItem = state.isLoadingMore ? 1 : 0;

                      return ListView.builder(
                        controller: _scrollController,
                        itemCount: successState.movies.length + additionalItem,
                        itemBuilder: (BuildContext context, int index) {
                          if (index < successState.movies.length) {
                            return MovieCell(
                              item: successState.movies[index],
                              onTap: () => context.pushRoute(
                                MovieDetailsRoute(
                                  id: successState.movies[index].id.toString(),
                                ),
                              ),
                            );
                          } else {
                            return MovieShimmer(placeholderCount: 1);
                          }
                        },
                      );
                    },
                  ),
                  onRefresh: () => state is Success && state.query.isNotEmpty
                      ? ref
                          .read(explorerNotifierProvider.notifier)
                          .onSearchChanged((state).query)
                      : ref.read(explorerNotifierProvider.notifier).refresh(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
