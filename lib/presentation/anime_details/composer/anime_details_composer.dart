import 'package:hikki_enciclopedia/domain/model/index.dart';
import 'package:hikki_enciclopedia/presentation/anime_details/cubit/anime_details_state.dart';
import 'package:hikki_enciclopedia/presentation/anime_details/models/index.dart';
import 'package:hikki_localization/hikki_localization.dart';

class AnimeDetailsComposer {
  AnimeInfo compose(AnimeDetailsEntity entity) {
    final briefInfo = _composeBriefInfo(entity);
    final relatedAnime = _composeRelatedAnime(entity);
    final recommendations = _composeRecommendations(entity);
    final stats = _composeStats(entity);

    return AnimeInfo(
      id: entity.id,
      title: entity.title,
      score: entity.score,
      imageUrl: entity.imageUrl,
      briefItems: briefInfo,
      genres: entity.genres.map((e) => e.name).toList(),
      relatedAnime: relatedAnime,
      screenshots: entity.screenshots,
      recommendations: recommendations,
      stats: stats,
    );
  }

  List<StatisticsAnimeUiModel> _composeStats(AnimeDetailsEntity entity) => [
        StatisticsAnimeUiModel(
          title: LocaleKeys.animeDetailStatsWatching.tr(),
          value: entity.stats.watching.toString() ?? '',
          progress: entity.stats.watching / (entity.stats.numListUsers),
        ),
        StatisticsAnimeUiModel(
          title: LocaleKeys.animeDetailStatsCompleted.tr(),
          value: entity.stats.completed.toString() ?? '',
          progress: entity.stats.completed / (entity.stats.numListUsers),
        ),
        StatisticsAnimeUiModel(
          title: LocaleKeys.animeDetailStatsOnHold.tr(),
          value: entity.stats.onHold.toString() ?? '',
          progress: entity.stats.onHold / (entity.stats.numListUsers),
        ),
        StatisticsAnimeUiModel(
          title: LocaleKeys.animeDetailStatsDropped.tr(),
          value: entity.stats.dropped.toString() ?? '',
          progress: entity.stats.dropped / (entity.stats.numListUsers),
        ),
        StatisticsAnimeUiModel(
          title: LocaleKeys.animeDetailStatsPlanWatch.tr(),
          value: entity.stats.planToWatch.toString() ?? '',
          progress: entity.stats.planToWatch / (entity.stats.numListUsers),
        ),
      ];

  List<RecommendAnimeUiModel> _composeRecommendations(
          AnimeDetailsEntity entity) =>
      entity.recommendations
          .map((e) => RecommendAnimeUiModel(
                id: e.id,
                title: e.title,
                imageUrl: e.imageUrl,
              ))
          .toList();

  List<RelatedAnimeUiModel> _composeRelatedAnime(AnimeDetailsEntity entity) =>
      entity.relatedAnime
          .map((e) => RelatedAnimeUiModel(
                id: e.id,
                title: e.title,
                imageUrl: e.imageUrl,
                relationType: e.relationTypeFormatted,
              ))
          .toList();

  List<BriefInfoAnimeUIModel> _composeBriefInfo(AnimeDetailsEntity entity) {
    final List<BriefInfoAnimeUIModel> briefInfo = [];

    if (entity.startDate.isNotEmpty) {
      final parsedData = DateTime.tryParse(entity.startDate)?.year;
      briefInfo.add(BriefInfoAnimeUIModel(
        title: LocaleKeys.animeDetailYear.tr(),
        value: parsedData?.toString() ?? entity.startDate.toString(),
      ));
    }

    if (entity.status != StatusAnimeEntity.unknown) {
      briefInfo.add(BriefInfoAnimeUIModel(
        title: LocaleKeys.animeDetailStatus.tr(),
        value: StatusAnimeEntity.getDisplayNameKey(entity.status).tr(),
      ));
    }

    if (entity.mediaType != MediaTypeAnimeEntity.unknown) {
      briefInfo.add(BriefInfoAnimeUIModel(
        title: LocaleKeys.animeDetailType.tr(),
        value: MediaTypeAnimeEntity.getDisplayNameKey(entity.mediaType).tr(),
      ));
    }

    if (entity.numEpisodes != 0) {
      briefInfo.add(BriefInfoAnimeUIModel(
        title: LocaleKeys.animeDetailEpisodes.tr(),
        value: entity.numEpisodes.toString(),
      ));
    }

    if (entity.averageEpisodeDuration != 0) {
      final averageDuration = (entity.averageEpisodeDuration / 60).round();
      final minutesText = LocaleKeys.animeDetailMinute.tr();

      briefInfo.add(BriefInfoAnimeUIModel(
        title: LocaleKeys.animeDetailTimeEpisode.tr(),
        value: '$averageDuration  $minutesText',
      ));
    }

    if (entity.rating != AgeRatingAnimeEntity.unknown) {
      briefInfo.add(BriefInfoAnimeUIModel(
        title: LocaleKeys.animeDetailAgeRating.tr(),
        value: entity.rating.displayName,
      ));
    }

    if (entity.rank != 0) {
      briefInfo.add(BriefInfoAnimeUIModel(
        title: LocaleKeys.animeDetailRank.tr(),
        value: entity.rank.toString(),
      ));
    }

    if (entity.popularity != 0) {
      briefInfo.add(BriefInfoAnimeUIModel(
        title: LocaleKeys.animeDetailPopularity.tr(),
        value: entity.popularity.toString(),
      ));
    }

    return briefInfo;
  }
}
