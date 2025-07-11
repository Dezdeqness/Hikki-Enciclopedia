import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hikki_enciclopedia/core/ui/error_screen.dart';
import 'package:hikki_enciclopedia/core/ui/loading_screen.dart';
import 'package:hikki_enciclopedia/presentation/explorer/explorer_state.dart';
import 'package:hikki_enciclopedia/presentation/explorer/providers/explorer_providers.dart';

import 'components/movie_cell.dart';

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
          _scrollController.position.maxScrollExtent * 0.9 && !_loadingNextPage) {
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

    return SafeArea(
      child: Scaffold(
          body: RefreshIndicator(
              child: Builder(builder: (context) {
                if (state is Loading || state is Initial) {
                  return const LoadingScreen();
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

                return ListView.builder(
                    controller: _scrollController,
                    itemCount: successState.movies.length,
                    itemBuilder: (BuildContext context, int index) {
                      return MovieCell(
                        item: successState.movies[index],
                        onTap: () => (),
                      );
                    });
              }),
              onRefresh: () =>
                  ref.read(explorerNotifierProvider.notifier).refresh())),
    );
  }
}
