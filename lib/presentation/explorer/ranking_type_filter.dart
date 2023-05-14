import 'package:flutter/widgets.dart';

import '../../generated/l10n.dart';

class RankingTypeFilter {
  final String id;
  final String displayName;

  const RankingTypeFilter({
    required this.id,
    required this.displayName,
  });
}

List<RankingTypeFilter> getRankingTypeFilter(BuildContext context) => [
      RankingTypeFilter(
          id: "all", displayName: AppLocalizations.of(context).filterAll),
      RankingTypeFilter(
          id: "airing", displayName: AppLocalizations.of(context).filterAiring),
      RankingTypeFilter(
          id: "upcoming",
          displayName: AppLocalizations.of(context).filterUpcoming),
      RankingTypeFilter(
          id: "movie", displayName: AppLocalizations.of(context).filterMovie),
      RankingTypeFilter(
          id: "special",
          displayName: AppLocalizations.of(context).filterSpecial),
      RankingTypeFilter(
          id: "bypopularity",
          displayName: AppLocalizations.of(context).filterByPopularity),
      RankingTypeFilter(
          id: "favorite",
          displayName: AppLocalizations.of(context).filterFavorite)
    ];
