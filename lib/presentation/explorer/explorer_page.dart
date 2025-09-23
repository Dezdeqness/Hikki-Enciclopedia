import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hikki_enciclopedia/core/ui/error_screen.dart';
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

  @override
  void initState() {
    super.initState();

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
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(explorerNotifierProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Hero(
              tag: 'searchBarHero',
              child: Material(
                color: Colors.transparent,
                child: Container(
                  height: 48,
                  margin: const EdgeInsets.fromLTRB(24, 16, 24, 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 16),
                      const Icon(Icons.search, color: Colors.blueAccent),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          autofocus: true,
                          decoration: const InputDecoration(
                            hintText: 'Search...',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Expanded content
            Expanded(
              child: RefreshIndicator(
                child: Builder(builder: (context) {
                  if (state is Loading || state is Initial) {
                    return const MovieShimmer();
                  }

                  if (state is Error) {
                    return CustomScrollView(
                      slivers: <Widget>[
                        SliverFillRemaining(
                            child: ErrorScreen(error: state.error.toString())),
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
                            onTap: () => context.pushRoute(MovieDetailsRoute(id: successState.movies[index].id.toString()))
                          );
                        } else {
                          return MovieShimmer(placeholderCount: 1);
                        }
                      });
                }),
                onRefresh: () =>
                    ref.read(explorerNotifierProvider.notifier).refresh(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
