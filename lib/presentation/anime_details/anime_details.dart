import 'package:flutter/material.dart';
import 'package:hikki_enciclopedia/domain/model/age_rating_anime_entity.dart';
import 'package:hikki_enciclopedia/domain/model/media_type_anime_entity.dart';
import 'package:hikki_enciclopedia/domain/model/status_anime_entity.dart';
import 'package:hikki_enciclopedia/domain/usecase/get_anime_details_use_case.dart';
import 'package:hikki_enciclopedia/presentation/anime_details/models/brief_info_anime_ui_model.dart';
import 'package:hikki_enciclopedia/presentation/anime_details/models/recommend_anime_ui_model.dart';
import 'package:hikki_enciclopedia/presentation/anime_details/models/related_anime_ui_model.dart';
import 'package:hikki_enciclopedia/presentation/anime_details/ui/brief_info_carousel.dart';
import 'package:hikki_enciclopedia/presentation/anime_details/ui/expanded_description.dart';
import 'package:hikki_enciclopedia/presentation/anime_details/ui/genre_carousel.dart';
import 'package:hikki_enciclopedia/presentation/anime_details/ui/main_image_with_score.dart';
import 'package:hikki_enciclopedia/presentation/anime_details/ui/recommend_carousel.dart';
import 'package:hikki_enciclopedia/presentation/anime_details/ui/related_carousel.dart';
import 'package:hikki_enciclopedia/presentation/anime_details/ui/screenshot_carousel.dart';
import 'package:hikki_enciclopedia/presentation/anime_details/ui/statistics_panel.dart';
import 'package:provider/provider.dart';

import '../../domain/model/anime_details_entity.dart';
import 'models/statistics_anime_ui_model.dart';

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
      final args =
          ModalRoute.of(context)?.settings.arguments as AnimeDetailsArguments;

      useCase.execute(animeId: args.id).then((result) => setState(() {
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
      return _loadingScreen();
    }
    if (_isError) {
      return _errorScreen(_error);
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
        _item?.title ?? "Anime",
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
              /* ... */
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
      _item!.startDate;
      final date = DateTime.parse(_item!.startDate);
      briefInfoItems.add(
        BriefInfoAnimeUIModel(title: 'Year', value: date.year.toString()),
      );
    }

    if (_item?.status != null && _item?.status != StatusAnimeEntity.unknown) {
      briefInfoItems.add(
        BriefInfoAnimeUIModel(
            title: 'Status', value: _getStatusDisplayName(_item!.status)),
      );
    }

    if (_item?.mediaType != null &&
        _item?.mediaType != MediaTypeAnimeEntity.unknown) {
      briefInfoItems.add(
        BriefInfoAnimeUIModel(
          title: 'Type',
          value: _getMediaTypeDisplayName(_item!.mediaType),
        ),
      );
    }

    if (_item?.numEpisodes != null) {
      briefInfoItems.add(
        BriefInfoAnimeUIModel(
          title: 'Episodes',
          value: _item!.numEpisodes.toString(),
        ),
      );
    }

    if (_item?.averageEpisodeDuration != null) {
      briefInfoItems.add(
        BriefInfoAnimeUIModel(
            title: 'Time episode',
            value: '${(_item!.averageEpisodeDuration / 60).round()} min'),
      );
    }

    if (_item?.rating != null &&
        _item?.rating != AgeRatingAnimeEntity.unknown) {
      briefInfoItems.add(
        BriefInfoAnimeUIModel(
          title: 'Age Rating',
          value: _item!.rating.displayName,
        ),
      );
    }

    if (_item?.rank != null) {
      briefInfoItems.add(
        BriefInfoAnimeUIModel(
          title: 'Rank',
          value: _item!.rank.toString(),
        ),
      );
    }

    if (_item?.startDate != null) {
      briefInfoItems.add(
        BriefInfoAnimeUIModel(
          title: 'Popularity',
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
              title: 'Watching',
              value: _item?.stats.watching.toString() ?? '',
              progress: _item!.stats.watching / (_item!.stats.numListUsers),
            ),
            StatisticsAnimeUiModel(
              title: 'Completed',
              value: _item?.stats.completed.toString() ?? '',
              progress: _item!.stats.completed / (_item!.stats.numListUsers),
            ),
            StatisticsAnimeUiModel(
              title: 'On Hold',
              value: _item?.stats.onHold.toString() ?? '',
              progress: _item!.stats.onHold / (_item!.stats.numListUsers),
            ),
            StatisticsAnimeUiModel(
              title: 'Dropped',
              value: _item?.stats.dropped.toString() ?? '',
              progress: _item!.stats.dropped / (_item!.stats.numListUsers),
            ),
            StatisticsAnimeUiModel(
              title: 'Plan to watch',
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

  _errorScreen(String? error) => Container(
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

  String _getMediaTypeDisplayName(MediaTypeAnimeEntity item) {
    switch (item) {
      case MediaTypeAnimeEntity.movie:
        return 'Movie';
      case MediaTypeAnimeEntity.tv:
        return 'TV';
      case MediaTypeAnimeEntity.ona:
        return 'Ona';
      case MediaTypeAnimeEntity.ova:
        return 'Ova';
      case MediaTypeAnimeEntity.music:
        return 'Music';
      default:
        return "";
    }
  }

  String _getStatusDisplayName(StatusAnimeEntity item) {
    switch (item) {
      case StatusAnimeEntity.airing:
        return 'Airing';
      case StatusAnimeEntity.finished:
        return 'Finished';
      case StatusAnimeEntity.notStarted:
        return 'Not started yet';
      default:
        return '';
    }
  }
}
