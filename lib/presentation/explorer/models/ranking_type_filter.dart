import 'package:flutter/widgets.dart';

import '../../../generated/l10n.dart';

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
          id: "all", displayName: AppLocalizations.of(context).filterAll),
      RankingTypeFilterUiModel(
          id: "airing", displayName: AppLocalizations.of(context).filterAiring),
      RankingTypeFilterUiModel(
          id: "upcoming",
          displayName: AppLocalizations.of(context).filterUpcoming),
      RankingTypeFilterUiModel(
          id: "movie", displayName: AppLocalizations.of(context).filterMovie),
      RankingTypeFilterUiModel(
          id: "special",
          displayName: AppLocalizations.of(context).filterSpecial),
      RankingTypeFilterUiModel(
          id: "bypopularity",
          displayName: AppLocalizations.of(context).filterByPopularity),
      RankingTypeFilterUiModel(
          id: "favorite",
          displayName: AppLocalizations.of(context).filterFavorite)
    ];
