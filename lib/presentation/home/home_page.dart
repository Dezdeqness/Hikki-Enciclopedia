import 'package:flutter/material.dart';
import 'package:hikki_enciclopedia/data/anime_api_datasource.dart';
import 'package:hikki_enciclopedia/data/entities.dart';
import 'package:hikki_enciclopedia/generated/l10n.dart';

import 'package:hikki_enciclopedia/ui/anime_pager_item.dart';
import 'package:hikki_enciclopedia/ui/category_item.dart';
import 'package:hikki_enciclopedia/ui/container_headerfull.dart';
import 'package:hikki_enciclopedia/ui/news_item.dart';
import 'package:hikki_enciclopedia/ui/promotional_item.dart';

import '../models/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.title,
    required this.onAnimeDetailsClicked,
  });

  final ValueChanged<int> onAnimeDetailsClicked;
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AnimeApiDataSource animeApiDataSource = AnimeApiDataSource();

  late Future<List<AnimeEntity>> futureAiringAnime;
  late Future<List<AnimeEntity>> futureUpcomingAnime;
  late Future<List<AnimeEntity>> futureRecommendationsAnime;

  @override
  void initState() {
    super.initState();
    futureAiringAnime = animeApiDataSource.getAnimeList(rankingType: "airing");
    futureUpcomingAnime =
        animeApiDataSource.getAnimeList(rankingType: "upcoming");
    futureRecommendationsAnime =
        animeApiDataSource.getAnimeList(rankingType: "bypopularity");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildHomePage(),
    );
  }

  _buildAppBar() => AppBar(
        title: Text(widget.title, style: const TextStyle(color: Colors.black)),
        elevation: 0,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.list),
          color: Colors.black,
          splashRadius: 24,
          onPressed: () {},
        ),
      );

  _buildHomePage() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildBanner(),
          _buildNewsContainer(),
          _buildPromotionalContainer(),
          _buildHorizontalList(
            header: AppLocalizations.of(context).airingHeader,
            future: futureAiringAnime,
          ),
          _buildHorizontalList(
            header: AppLocalizations.of(context).upcomingHeader,
            future: futureUpcomingAnime,
          ),
          _buildHorizontalList(
            header: AppLocalizations.of(context).recommendationsHeader,
            future: futureRecommendationsAnime,
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  _buildNewsContainer() => ContainerHeaderFull(
        header: AppLocalizations.of(context).latestHeader,
        content: _buildNewsPager(),
      );

  _buildBanner() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Flexible(
              child: CategoryItem(
                title: AppLocalizations.of(context).topAnime,
                icon: Icons.trending_up,
              ),
            ),
            const SizedBox(width: 16),
            Flexible(
              child: CategoryItem(
                title: AppLocalizations.of(context).seasonal,
                icon: Icons.sunny,
              ),
            ),
          ],
        ),
      );

  _buildNewsPager() {
    final PageController controller = PageController();
    return SizedBox(
      height: 180,
      child: PageView(
        controller: controller,
        children:
            getNewsList().map((element) => NewsItem(news: element)).toList(),
      ),
    );
  }

  _buildPromotionalContainer() => Container(
        padding: const EdgeInsets.only(top: 16),
        child: ContainerHeaderFull(
          header: AppLocalizations.of(context).promotionalHeader,
          content: _buildPromotionalPager(),
        ),
      );

  _buildHorizontalList(
          {required String header, required Future<List<AnimeEntity>> future}) =>
      Container(
        padding: const EdgeInsets.only(top: 16),
        child: ContainerHeaderFull(
          header: header,
          content: _buildPager(future),
          isActionPresent: true,
        ),
      );

  _buildPromotionalPager() {
    final PageController controller = PageController();
    return SizedBox(
      height: 190,
      child: PageView(
        controller: controller,
        children: getPromotionalList()
            .map((element) => PromotionalItem(
                  name: element.name,
                  kind: element.kind,
                  imageUrl: element.imageUrl,
                ))
            .toList(),
      ),
    );
  }

  _buildPager(Future<List<AnimeEntity>> future) => FutureBuilder<List<AnimeEntity>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _animeHorizontalList(snapshot.data ?? []);
          } else if (snapshot.hasError) {
            return _errorScreen(snapshot.error);
          } else {
            return _loadingScreen();
          }
        },
      );

  _animeHorizontalList(List<AnimeEntity> list) => SizedBox(
        height: 210,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          scrollDirection: Axis.horizontal,
          children: list
              .map((element) => AnimePagerItem(
                    id: element.id,
                    title: element.title,
                    type: element.type,
                    score: element.score,
                    imageUrl: element.imageUrl,
                    onAnimeDetailsClicked: widget.onAnimeDetailsClicked,
                  ))
              .toList(),
        ),
      );

  _errorScreen(Object? error) => SizedBox(
        height: 210,
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

  _loadingScreen() => const SizedBox(
        height: 210,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
}
