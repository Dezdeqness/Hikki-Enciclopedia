import 'package:flutter/foundation.dart';
import 'package:hikki_api_service/hikki_api_service.dart';
import 'package:hikki_enciclopedia/data/datasource/news/news_api_datasource_impl.dart';
import 'package:hikki_enciclopedia/data/datasource/promo/promo_api_datasource_impl.dart';
import 'package:hikki_enciclopedia/data/mapper/index.dart';
import 'package:hikki_enciclopedia/domain/model/index.dart';
import 'package:hikki_enciclopedia/domain/usecase/get_anime_list_use_case.dart';

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
  final GetAnimeListUseCase useCase;

  HomeProvider({required this.useCase});

  fetchHomePage() {
    _fetchAiringBlock();
    _fetchBypopularityBlock();
    _fetchUpcomingBlock();
  }

  _fetchAiringBlock() {
    useCase.execute(rankingType: RankingTypeEntity.airing.id).then((result) {
      if (result.isSuccess) {
        itemsAiring = result.success;
        isErrorAiring = false;
        errorAiring = null;
      } else {
        errorAiring = result.failure.name;
        isErrorAiring = true;
      }
      notifyListeners();
    });
  }

  _fetchUpcomingBlock() {
    useCase.execute(rankingType: RankingTypeEntity.upcoming.id).then((result) {
      if (result.isSuccess) {
        itemsUpcoming = result.success;
        isErrorUpcoming = false;
        errorUpcoming = null;
      } else {
        errorUpcoming = result.failure.name;
        isErrorUpcoming = true;
      }
      notifyListeners();
    });
  }

  _fetchBypopularityBlock() {
    useCase.execute(rankingType: RankingTypeEntity.byPopularity.id).then((result) {
      if (result.isSuccess) {
        itemsBypopularity = result.success;
        isErrorUpcoming = false;
        errorBypopularity = null;
      } else {
        errorBypopularity = result.failure.name;
        isErrorBypopularity = true;
      }
      notifyListeners();
    });
  }
}
