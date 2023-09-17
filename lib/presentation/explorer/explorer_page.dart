import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hikki_enciclopedia/core/ui/custom_refresh_indicator.dart';
import 'package:hikki_enciclopedia/domain/model/anime_entity.dart';
import 'package:hikki_enciclopedia/domain/model/ranking_type_entity.dart';
import 'package:hikki_enciclopedia/presentation/explorer/bloc/explorer_bloc.dart';
import 'package:hikki_enciclopedia/presentation/explorer/bloc/explorer_event.dart';
import 'package:hikki_enciclopedia/presentation/explorer/bloc/explorer_state.dart';
import 'package:hikki_enciclopedia/presentation/explorer/models/ranking_type_filter.dart';
import 'package:hikki_enciclopedia/ui/anime_item.dart';
import 'package:provider/provider.dart';


class ExplorerPage extends StatefulWidget {
  final ValueChanged<int> onAnimeDetailsClicked;

  const ExplorerPage({
    required this.onAnimeDetailsClicked,
    super.key,
  });

  @override
  State<ExplorerPage> createState() => _ExplorerPage();
}

class _ExplorerPage extends State<ExplorerPage> {
  late final ExplorerBloc explorerBloc;

  @override
  void initState() {
    explorerBloc = Provider.of<ExplorerBloc>(context, listen: false)
      ..add(GetExplorerPageEvent(rankingType: RankingTypeEntity.all.id));
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
            child: BlocBuilder(
              bloc: explorerBloc,
              builder: (BuildContext context, ExplorerState state) {
                return DropdownButton<String>(
                  value: state.rankingType.id,
                  style: const TextStyle(color: Colors.deepPurple),
                  onChanged: (String? value) {
                    final filteredList = getRankingTypeFilter(context)
                        .where((element) => element.id == value);
                    if (filteredList.isNotEmpty) {
                      final id = filteredList.first.id;
                      explorerBloc.add(GetExplorerPageEvent(rankingType: id));
                    }
                  },
                  items: getRankingTypeFilter(context)
                      .map<DropdownMenuItem<String>>(
                          (RankingTypeFilterUiModel value) {
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
      body: BlocBuilder(
        bloc: explorerBloc,
        builder: (BuildContext context, ExplorerState state) {
          Widget? widget;

          if (state.isLoading) {
            widget = _loadingScreen();
          }
          if (state.error.isNotEmpty) {
            widget = CustomScrollView(
              slivers: <Widget>[
                SliverFillRemaining(child: _errorScreen(state.error)),
              ],
            );
          }

          widget ??= _buildHomePage(state.items, state.isPageLoading);

          return RefreshIndicator1(
            onRefresh: () {
              explorerBloc.add(RefreshEvent());
            },
            isRefreshing: state.isRefreshing,
            child: widget!,
          );
        },
      ),
    );
  }

  _buildHomePage(List<AnimeEntity> items, bool isPageLoading) {
    final scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent * 0.9 <
          scrollController.position.pixels) {
        explorerBloc.add(GetExplorerNextPageEvent());
      }
    });
    final List<Widget> widgets = items
        .map((element) => Container(
              child: AnimeItem(
                id: element.id,
                title: element.title,
                score: element.score,
                imageUrl: element.imageUrl,
                genres: element.type,
                onAnimeDetailsClicked: widget.onAnimeDetailsClicked,
              ),
            ))
        .toList();

    if (isPageLoading == true) {
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
    return Column(
      children: [
        Expanded(
          child: OrientationBuilder(builder: (context, orientation) {
            return GridView.count(
              controller: scrollController,
              childAspectRatio: 0.66,
              crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
              children: widgets,
            );
          }),
        ),
      ],
    );
  }

  _errorScreen(String? error) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('Error: $error'),
            ),
          ],
        ),
      );

  _loadingScreen() => const Center(
        child: CircularProgressIndicator(),
      );
}
