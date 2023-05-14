import 'package:flutter/material.dart';
import 'package:hikki_enciclopedia/data/anime_api_datasource.dart';
import 'package:hikki_enciclopedia/presentation/explorer/ranking_type_filter.dart';
import 'package:hikki_enciclopedia/ui/anime_item.dart';

import '../models/entities.dart';

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
  final AnimeApiDataSource animeApiDataSource = AnimeApiDataSource();

  List<Anime> _items = [];
  bool _isError = false;
  Object? _error;

  String _rankingType = "all";

  @override
  void initState() {
    super.initState();
    _fetchList();
  }

  void _fetchList() {
    setState(() {
      _items = [];
    });
    animeApiDataSource
        .getAnimeList(rankingType: _rankingType)
        .then((value) => setState(() {
              _items = value;
              _error = null;
            }))
        .catchError((error) => setState(() {
              _error = error;
            }))
        .whenComplete(() => setState(() {
              _isError = _error != null;
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: DropdownButton<String>(
              value: _rankingType,
              style: const TextStyle(color: Colors.deepPurple),
              onChanged: (String? value) {
                final filteredList = getRankingTypeFilter(context)
                    .where((element) => element.id == value);
                if (filteredList.isNotEmpty) {
                  setState(() {
                    _rankingType = filteredList.first.id;
                    _fetchList();
                  });
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
          ),
        ],
      ),
      body: _buildHomePage(),
    );
  }

  _buildHomePage() {
    if (_items.isEmpty) {
      return _loadingScreen();
    }
    if (_isError) {
      return _errorScreen(_error);
    }

    return Column(
      children: [
        Expanded(
          child: OrientationBuilder(builder: (context, orientation) {
            return GridView.count(
              childAspectRatio: 0.66,
              crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
              children: _items
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
