import 'package:flutter/foundation.dart';
import 'package:hikki_enciclopedia/data/anime_api_datasource.dart';

import '../../data/entities.dart';

class HomeProvider with ChangeNotifier {
  List<AnimeEntity> itemsAiring = [];
  List<AnimeEntity> itemsUpcoming = [];
  List<AnimeEntity> itemsBypopularity = [];
  bool isErrorAiring = false;
  bool isErrorUpcoming = false;
  bool isErrorBypopularity = false;

  Object? errorAiring;
  Object? errorUpcoming;
  Object? errorBypopularity;

  String rankingType = "all";

  bool loading = false;
  final AnimeApiDataSource _datasource = AnimeApiDataSource();

  fetchHomePage() {
    _fetchAiringBlock();
    _fetchBypopularityBlock();
    _fetchUpcomingBlock();
  }

  _fetchAiringBlock() {
    _datasource.getAnimeList(rankingType: "airing").then((value) {
      itemsAiring = value;
      errorAiring = null;
    }).catchError((error) {
      error = error;
    }).whenComplete(() {
      isErrorAiring = errorAiring != null;
      notifyListeners();
    });
  }

  _fetchUpcomingBlock() {
    _datasource.getAnimeList(rankingType: "upcoming").then((value) {
      itemsUpcoming = value;
      errorUpcoming = null;
    }).catchError((error) {
      error = error;
    }).whenComplete(() {
      isErrorUpcoming = errorUpcoming != null;
      notifyListeners();
    });
  }

  _fetchBypopularityBlock() {
    _datasource.getAnimeList(rankingType: "bypopularity").then((value) {
      itemsBypopularity = value;
      errorBypopularity = null;
    }).catchError((error) {
      error = error;
    }).whenComplete(() {
      isErrorBypopularity = errorBypopularity != null;
      notifyListeners();
    });
  }
}
