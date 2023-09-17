import 'package:flutter/widgets.dart';
import 'package:hikki_localization/hikki_localization.dart';

class RankingTypeFilterUiModel {
  final String id;
  final String displayName;

  const RankingTypeFilterUiModel({
    required this.id,
    required this.displayName,
  });
}

List<RankingTypeFilterUiModel> getRankingTypeFilter(BuildContext context) => [
      RankingTypeFilterUiModel(
          id: "all", displayName: LocaleKeys.filterAll.tr()),
      RankingTypeFilterUiModel(
          id: "airing", displayName: LocaleKeys.filterAiring.tr()),
      RankingTypeFilterUiModel(
          id: "upcoming", displayName: LocaleKeys.filterUpcoming.tr()),
      RankingTypeFilterUiModel(
          id: "movie", displayName: LocaleKeys.filterMovie.tr()),
      RankingTypeFilterUiModel(
          id: "special", displayName: LocaleKeys.filterSpecial.tr()),
      RankingTypeFilterUiModel(
          id: "bypopularity", displayName: LocaleKeys.filterByPopularity.tr()),
      RankingTypeFilterUiModel(
          id: "favorite", displayName: LocaleKeys.filterFavorite.tr())
    ];
