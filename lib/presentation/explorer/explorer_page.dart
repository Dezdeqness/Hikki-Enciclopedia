import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hikki_enciclopedia/core/ui/custom_refresh_indicator.dart';
import 'package:hikki_enciclopedia/core/ui/error_screen.dart';
import 'package:hikki_enciclopedia/core/ui/loading_screen.dart';
import 'package:hikki_enciclopedia/presentation/explorer/cubit/explorer_cubit.dart';
import 'package:hikki_enciclopedia/presentation/explorer/cubit/explorer_state.dart';
import 'package:hikki_enciclopedia/presentation/explorer/models/ranking_type_filter.dart';
import 'package:hikki_enciclopedia/presentation/navigation/hikki_app_router.dart';
import 'package:hikki_enciclopedia/ui/anime_item.dart';

@RoutePage()
class ExplorerPage extends StatefulWidget {
  const ExplorerPage({
    super.key,
  });

  @override
  State<ExplorerPage> createState() => _ExplorerPage();
}

class _ExplorerPage extends State<ExplorerPage> {
  late final ExplorerCubit explorerCubit;

  @override
  void initState() {
    explorerCubit = BlocProvider.of<ExplorerCubit>(context, listen: false)
      ..fetchInitialPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: BlocBuilder<ExplorerCubit, ExplorerState>(
              bloc: explorerCubit,
              builder: (context, state) {
                return DropdownButton<String>(
                  value: state.rankingType.id,
                  style: const TextStyle(color: Colors.deepPurple),
                  onChanged: (value) {
                    final filteredList = getRankingTypeFilter(context)
                        .where((element) => element.id == value);
                    if (filteredList.isNotEmpty) {
                      explorerCubit.onLoadMore();
                    }
                  },
                  items: getRankingTypeFilter(context)
                      .map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value.id,
                      child: Text(value.displayName),
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
      body: BlocBuilder<ExplorerCubit, ExplorerState>(
        bloc: explorerCubit,
        builder: (context, state) {
          Widget? widget;

          if (state.isLoading) {
            widget = const LoadingScreen();
          } else if (state.error.isNotEmpty) {
            widget = CustomScrollView(
              slivers: <Widget>[
                SliverFillRemaining(child: ErrorScreen(error: state.error)),
              ],
            );
          } else {
            final scrollController = ScrollController();
            scrollController.addListener(() {
              if (scrollController.position.maxScrollExtent * 0.9 <
                  scrollController.position.pixels) {
                explorerCubit;
              }
            });
            final List<Widget> widgets = state.items
                .map((element) => Container(
                      child: AnimeItem(
                        id: element.id,
                        title: element.title,
                        score: element.score,
                        imageUrl: element.imageUrl,
                        genres: element.type,
                        onAnimeDetailsClicked: (id) {
                          context.pushRoute(AnimeDetailsRoute(id: id));
                        },
                      ),
                    ))
                .toList();

            if (state.isPageLoading == true) {
              widgets.add(
                Container(
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              );
            }
            widget = Column(
              children: [
                Expanded(
                  child: OrientationBuilder(builder: (context, orientation) {
                    return GridView.count(
                      controller: scrollController,
                      childAspectRatio: 0.66,
                      crossAxisCount:
                          orientation == Orientation.portrait ? 2 : 4,
                      children: widgets,
                    );
                  }),
                ),
              ],
            );
          }

          return RefreshIndicator1(
            onRefresh: () {
              explorerCubit.onSwipeRefreshed();
            },
            isRefreshing: state.isRefreshing,
            child: widget,
          );
        },
      ),
    );
  }
}
