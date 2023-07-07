import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hikki_enciclopedia/domain/model/ranking_type_entity.dart';
import 'package:hikki_enciclopedia/presentation/explorer/bloc/explorer_bloc.dart';
import 'package:hikki_enciclopedia/presentation/explorer/bloc/explorer_event.dart';
import 'package:hikki_enciclopedia/presentation/explorer/bloc/explorer_state.dart';
import 'package:hikki_enciclopedia/presentation/explorer/ranking_type_filter.dart';
import 'package:hikki_enciclopedia/ui/anime_item.dart';
import 'package:provider/provider.dart';

import '../../domain/model/anime_entity.dart';

class ExplorerPage extends StatefulWidget {
  const ExplorerPage({
    super.key,
    required this.onAnimeDetailsClicked,
  });

  final ValueChanged<int> onAnimeDetailsClicked;

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
                      .map<DropdownMenuItem<String>>((RankingTypeFilter value) {
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
          if (state.isLoading) {
            return _loadingScreen();
          }
          if (state.error.isNotEmpty) {
            return _errorScreen(state.error);
          }

          return _buildHomePage(state.items);
        },
      ),
    );
  }

  _buildHomePage(List<AnimeEntity> items) => Column(
        children: [
          Expanded(
            child: OrientationBuilder(builder: (context, orientation) {
              return GridView.count(
                childAspectRatio: 0.66,
                crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
                children: items
                    .map((element) => AnimeItem(
                          id: element.id,
                          title: element.title,
                          score: element.score,
                          imageUrl: element.imageUrl,
                          genres: element.type,
                          onAnimeDetailsClicked: widget.onAnimeDetailsClicked,
                        ))
                    .toList(),
              );
            }),
          ),
        ],
      );

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
