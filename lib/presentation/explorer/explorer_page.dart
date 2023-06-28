import 'package:flutter/material.dart';
import 'package:hikki_enciclopedia/presentation/explorer/explorer_provider.dart';
import 'package:hikki_enciclopedia/presentation/explorer/ranking_type_filter.dart';
import 'package:hikki_enciclopedia/ui/anime_item.dart';
import 'package:provider/provider.dart';

class ExplorerPage extends StatefulWidget {
  const ExplorerPage({
    super.key,
    // required this.onAnimeDetailsClicked,
  });

  // final ValueChanged<String> onAnimeDetailsClicked;

  @override
  State<ExplorerPage> createState() => _ExplorerPage();
}

class _ExplorerPage extends State<ExplorerPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ExplorerProvider>(context, listen: false).fetchExplorerPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Consumer<ExplorerProvider>(
            builder: (context, explorer, child) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: DropdownButton<String>(
                  value: explorer.rankingType,
                  style: const TextStyle(color: Colors.deepPurple),
                  onChanged: (String? value) {
                    final filteredList = getRankingTypeFilter(context)
                        .where((element) => element.id == value);
                    if (filteredList.isNotEmpty) {
                      explorer.rankingType = filteredList.first.id;
                      explorer.fetchExplorerPage();
                    }
                  },
                  items: getRankingTypeFilter(context)
                      .map<DropdownMenuItem<String>>((RankingTypeFilter value) {
                    return DropdownMenuItem<String>(
                      value: value.id,
                      child: Text(value.displayName),
                    );
                  }).toList(),
                ),
              );
            },
          )
        ],
      ),
      body: _buildHomePage(),
    );
  }

  _buildHomePage() {
    return Consumer<ExplorerProvider>(builder: (context, explorer, child) {
      if (explorer.items.isEmpty) {
        return _loadingScreen();
      }
      if (explorer.isError) {
        return _errorScreen(explorer.error);
      }

      return Column(
        children: [
          Expanded(
            child: OrientationBuilder(builder: (context, orientation) {
              return GridView.count(
                childAspectRatio: 0.66,
                crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
                children: explorer.items
                    .map((element) => AnimeItem(
                          title: element.title,
                          score: element.score,
                          imageUrl: element.imageUrl,
                          genres: element.type,
                        ))
                    .toList(),
              );
            }),
          ),
        ],
      );
    });
  }

  _errorScreen(Object? error) => Center(
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
