import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hikki_enciclopedia/core/ui/error_screen.dart';
import 'package:hikki_enciclopedia/core/ui/loading_screen.dart';
import 'package:hikki_enciclopedia/domain/model/index.dart';
import 'package:hikki_enciclopedia/domain/usecase/get_anime_details_use_case.dart';
import 'package:hikki_enciclopedia/presentation/anime_details/models/brief_info_anime_ui_model.dart';
import 'package:hikki_enciclopedia/presentation/anime_details/models/recommend_anime_ui_model.dart';
import 'package:hikki_enciclopedia/presentation/anime_details/models/related_anime_ui_model.dart';
import 'package:hikki_localization/hikki_localization.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import 'components/brief_info_carousel.dart';
import 'components/expanded_description.dart';
import 'components/genre_carousel.dart';
import 'components/main_image_with_score.dart';
import 'components/recommend_carousel.dart';
import 'components/related_carousel.dart';
import 'components/screenshot_carousel.dart';
import 'components/statistics_panel.dart';
import 'models/statistics_anime_ui_model.dart';

@RoutePage()
class AnimeDetailsPage extends StatefulWidget {
  final int id;

  const AnimeDetailsPage({
    required this.id,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _AnimeDetailsState();
}

class _AnimeDetailsState extends State<AnimeDetailsPage> {
  AnimeDetailsEntity? _item;
  bool _isError = false;
  String? _error;

  late ScrollController _controller;
  bool isTransparentToolbar = true;

  @override
  void initState() {
    _controller = ScrollController()..addListener(_scrollListener);
    super.initState();

    Future.delayed(Duration.zero, () {
      var useCase = Provider.of<GetAnimeDetailsUseCase>(context, listen: false);

      useCase.execute(animeId: widget.id).then((result) => setState(() {
            if (result.isSuccess) {
              _item = result.success;
              _isError = false;
              _error = null;
            } else {
              _error = result.failure.name;
              _isError = true;
            }
          }));
    });
  }

  _scrollListener() {
    if (_controller.offset >= 280) {
      if (!isTransparentToolbar) {
        return;
      }
      setState(() {
        isTransparentToolbar = false;
      });
    }
    if (_controller.offset <= 280) {
      if (isTransparentToolbar) {
        return;
      }
      setState(() {
        isTransparentToolbar = true;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_item == null) {
      return const LoadingScreen();
    }
    if (_isError) {
      return ErrorScreen(error: _error ?? '');
    }
    Color color = Color(0xFFF5F5F5);
    if (isTransparentToolbar) {
      color = Colors.transparent;
    } else {
      color = Color(0xFFF5F5F5);
    }

    Widget? text;
    if (isTransparentToolbar) {
      text = null;
    } else {
      text = Text(
        _item?.title ?? LocaleKeys.animeDetailTitle.tr(context: context),
        style: const TextStyle(
          color: Colors.black,
          overflow: TextOverflow.ellipsis,
        ),
      );
    }

    final List<Widget> list = [];

    list.add(
      SliverAppBar(
        pinned: true,
        title: text,
        backgroundColor: color,
        foregroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.share_outlined),
            onPressed: () {
              Share.share('https://myanimelist.net/anime/${_item?.id ?? ''}');
            },
          ),
        ],
        surfaceTintColor: Colors.transparent,
      ),
    );

    list.add(
      SliverToBoxAdapter(
        child: MainImageWithScore(
          score: _item?.score ?? 0,
          imageUrl: _item?.imageUrl ?? '',
        ),
      ),
    );

    list.add(
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Text(
            _item?.title ?? '',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );

    final List<BriefInfoAnimeUIModel> briefInfoItems = [];
    if (_item?.startDate != null) {
      final date = DateTime.tryParse(_item!.startDate);
      if (date != null) {
        briefInfoItems.add(
          BriefInfoAnimeUIModel(
              title: LocaleKeys.animeDetailYear.tr(context: context),
              value: date.year.toString()),
        );
      }
    }

    if (_item?.status != null && _item?.status != StatusAnimeEntity.unknown) {
      briefInfoItems.add(
        BriefInfoAnimeUIModel(
            title: LocaleKeys.animeDetailStatus.tr(context: context),
            value: _getStatusDisplayName(_item!.status)),
      );
    }

    if (_item?.mediaType != null &&
        _item?.mediaType != MediaTypeAnimeEntity.unknown) {
      briefInfoItems.add(
        BriefInfoAnimeUIModel(
          title: LocaleKeys.animeDetailType.tr(context: context),
          value: _getMediaTypeDisplayName(_item!.mediaType),
        ),
      );
    }

    if (_item?.numEpisodes != null) {
      briefInfoItems.add(
        BriefInfoAnimeUIModel(
          title: LocaleKeys.animeDetailEpisodes.tr(context: context),
          value: _item!.numEpisodes.toString(),
        ),
      );
    }

    if (_item?.averageEpisodeDuration != null) {
      briefInfoItems.add(
        BriefInfoAnimeUIModel(
            title: LocaleKeys.animeDetailTimeEpisode.tr(context: context),
            value:
                '${(_item!.averageEpisodeDuration / 60).round()}  ${LocaleKeys.animeDetailMinute.tr(context: context)}'),
      );
    }

    if (_item?.rating != null &&
        _item?.rating != AgeRatingAnimeEntity.unknown) {
      briefInfoItems.add(
        BriefInfoAnimeUIModel(
          title: LocaleKeys.animeDetailAgeRating.tr(context: context),
          value: _item!.rating.displayName,
        ),
      );
    }

    if (_item?.rank != null) {
      briefInfoItems.add(
        BriefInfoAnimeUIModel(
          title: LocaleKeys.animeDetailRank.tr(context: context),
          value: _item!.rank.toString(),
        ),
      );
    }

    if (_item?.startDate != null) {
      briefInfoItems.add(
        BriefInfoAnimeUIModel(
          title: LocaleKeys.animeDetailPopularity.tr(context: context),
          value: _item!.popularity.toString(),
        ),
      );
    }

    list.add(
      SliverToBoxAdapter(
        child: BriefInfoCarousel(
          items: briefInfoItems,
        ),
      ),
    );

    if (_item?.synopsis.isNotEmpty == true) {
      list.add(
        SliverToBoxAdapter(
          child: ExpandedDescription(
            text: _item!.synopsis,
            textPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            textStyle: const TextStyle(color: Colors.black),
          ),
        ),
      );
    }

    if (_item?.genres.isNotEmpty == true) {
      list.add(
        SliverToBoxAdapter(
          child: GenreCarousel(
            items: _item?.genres.map((e) => e.name).toList() ?? [],
          ),
        ),
      );
    }

    if (_item?.relatedAnime.isNotEmpty == true) {
      list.add(
        SliverToBoxAdapter(
          child: RelatedCarousel(
              items: _item?.relatedAnime
                      .map((e) => RelatedAnimeUiModel(
                          id: e.id,
                          title: e.title,
                          imageUrl: e.imageUrl,
                          relationType: e.relationTypeFormatted))
                      .toList() ??
                  []),
        ),
      );
    }

    if (_item?.screenshots.isNotEmpty == true) {
      list.add(
        SliverToBoxAdapter(
          child: ScreenshotCarousel(
            items: _item?.screenshots ?? [],
          ),
        ),
      );
    }

    if (_item?.recommendations.isNotEmpty == true) {
      list.add(
        SliverToBoxAdapter(
          child: RecommendCarousel(
            items: _item?.recommendations
                    .map((e) => RecommendAnimeUiModel(
                        id: e.id, title: e.title, imageUrl: e.imageUrl))
                    .toList() ??
                [],
          ),
        ),
      );
    }

    list.add(
      SliverToBoxAdapter(
        child: StatisticsPanel(
          items: [
            StatisticsAnimeUiModel(
              title: LocaleKeys.animeDetailStatsWatching.tr(context: context),
              value: _item?.stats.watching.toString() ?? '',
              progress: _item!.stats.watching / (_item!.stats.numListUsers),
            ),
            StatisticsAnimeUiModel(
              title: LocaleKeys.animeDetailStatsCompleted.tr(context: context),
              value: _item?.stats.completed.toString() ?? '',
              progress: _item!.stats.completed / (_item!.stats.numListUsers),
            ),
            StatisticsAnimeUiModel(
              title: LocaleKeys.animeDetailStatsOnHold.tr(context: context),
              value: _item?.stats.onHold.toString() ?? '',
              progress: _item!.stats.onHold / (_item!.stats.numListUsers),
            ),
            StatisticsAnimeUiModel(
              title: LocaleKeys.animeDetailStatsDropped.tr(context: context),
              value: _item?.stats.dropped.toString() ?? '',
              progress: _item!.stats.dropped / (_item!.stats.numListUsers),
            ),
            StatisticsAnimeUiModel(
              title: LocaleKeys.animeDetailStatsPlanWatch.tr(context: context),
              value: _item?.stats.planToWatch.toString() ?? '',
              progress: _item!.stats.planToWatch / (_item!.stats.numListUsers),
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      body: CustomScrollView(
        controller: _controller,
        slivers: list,
      ),
    );
  }

  String _getMediaTypeDisplayName(MediaTypeAnimeEntity item) {
    switch (item) {
      case MediaTypeAnimeEntity.movie:
        return LocaleKeys.animeDetailTypeMovie.tr(context: context);
      case MediaTypeAnimeEntity.tv:
        return LocaleKeys.animeDetailTypeTv.tr(context: context);
      case MediaTypeAnimeEntity.ona:
        return LocaleKeys.animeDetailTypeOna.tr(context: context);
      case MediaTypeAnimeEntity.ova:
        return LocaleKeys.animeDetailTypeOva.tr(context: context);
      case MediaTypeAnimeEntity.music:
        return LocaleKeys.animeDetailTypeMusic.tr(context: context);
      default:
        return "";
    }
  }

  String _getStatusDisplayName(StatusAnimeEntity item) {
    switch (item) {
      case StatusAnimeEntity.airing:
        return LocaleKeys.animeDetailTypeAiring.tr(context: context);
      case StatusAnimeEntity.finished:
        return LocaleKeys.animeDetailTypeFinished.tr(context: context);
      case StatusAnimeEntity.notStarted:
        return LocaleKeys.animeDetailTypeNotStartedYet.tr(context: context);
      default:
        return '';
    }
  }
}
