import 'package:flutter/material.dart';
import 'package:hikki_enciclopedia/data/entities.dart';

import '../../data/anime_api_datasource.dart';

class AnimeDetailsArguments {
  final int id;

  AnimeDetailsArguments({required this.id});
}

class AnimeDetails extends StatefulWidget {
  const AnimeDetails({super.key});

  @override
  State<StatefulWidget> createState() => _AnimeDetailsState();
}

class _AnimeDetailsState extends State<AnimeDetails> {
  final AnimeApiDataSource animeApiDataSource = AnimeApiDataSource();

  AnimeDetailsEntity? _item;
  bool _isError = false;
  Object? _error;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      final args =
          ModalRoute.of(context)?.settings.arguments as AnimeDetailsArguments;

      animeApiDataSource
          .getAnimeDetails(animeId: args.id)
          .then((value) => setState(() {
                _item = value;
                _error = null;
              }))
          .catchError((error) => setState(() {
                _error = error;
              }))
          .whenComplete(() => setState(() {
                _isError = _error != null;
              }));
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_item == null) {
      return _loadingScreen();
    }
    if (_isError) {
      return _errorScreen(_error);
    }

    return Container(
      color: Colors.white,
      child: Center(
        child: Text(_item.toString()),
      ),
    );
  }

  _errorScreen(Object? error) => Container(
        color: Colors.white,
        child: Center(
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
        ),
      );

  _loadingScreen() => const Center(
        child: CircularProgressIndicator(),
      );
}
