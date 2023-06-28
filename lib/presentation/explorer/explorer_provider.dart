import 'package:flutter/foundation.dart';

import '../../data/anime_api_datasource.dart';
import '../../data/entities.dart';

class ExplorerProvider with ChangeNotifier {
  List<AnimeEntity> items = [];
  bool isError = false;
  Object? error;

  String rankingType = "all";

  bool loading = false;
  final AnimeApiDataSource _datasource = AnimeApiDataSource();

  fetchExplorerPage() {
    items = [];
    notifyListeners();

    _datasource.getAnimeList(rankingType: rankingType).then((value) {
      items = value;
      error = null;
    }).catchError((error) {
      error = error;
    }).whenComplete(() {
      isError = error != null;
      notifyListeners();
    });
  }
}
