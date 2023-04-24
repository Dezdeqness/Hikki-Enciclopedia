import 'package:flutter/material.dart';

import 'package:hikki_enciclopedia/data/provider.dart';
import 'package:hikki_enciclopedia/ui/anime_item.dart';
import 'package:hikki_enciclopedia/ui/category_item.dart';
import 'package:hikki_enciclopedia/ui/container_headerfull.dart';
import 'package:hikki_enciclopedia/ui/news_item.dart';
import 'package:hikki_enciclopedia/ui/promotional_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.title,
    required this.onAnimeDetailsClicked,
  });

  final ValueChanged<String> onAnimeDetailsClicked;
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          _buildCurrentAiringContainer(),
          _buildUpcomingContainer(),
          _buildRecommendationContainer(),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  _buildNewsContainer() => ContainerHeaderFull(
        header: "Latest News",
        content: _buildNewsPager(),
      );

  _buildBanner() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: const [
            Flexible(
              child: CategoryItem(
                title: 'Top Anime',
                icon: Icons.trending_up,
              ),
            ),
            SizedBox(width: 16),
            Flexible(
              child: CategoryItem(
                title: 'Seasonal',
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
          header: "Latest Promotional",
          content: _buildPromotionalPager(),
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

  _buildCurrentAiringPager() {
    return SizedBox(
      height: 210,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        children: getAnimeCurrentlyAiringList()
            .map((element) => AnimeItem(
                  title: element.title,
                  type: element.type,
                  score: element.score,
                  imageUrl: element.imageUrl,
                  onAnimeDetailsClicked: widget.onAnimeDetailsClicked,
                ))
            .toList(),
      ),
    );
  }

  _buildUpcomingPager() {
    return SizedBox(
      height: 210,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        children: getAnimeUpcomingList()
            .map((element) => AnimeItem(
                  title: element.title,
                  type: element.type,
                  score: element.score,
                  imageUrl: element.imageUrl,
                  onAnimeDetailsClicked: widget.onAnimeDetailsClicked,
                ))
            .toList(),
      ),
    );
  }

  _buildRecommendationsPager() {
    return SizedBox(
      height: 210,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        children: getAnimeRecommendationsList()
            .map((element) => AnimeItem(
                  title: element.title,
                  type: element.type,
                  score: element.score,
                  imageUrl: element.imageUrl,
                  onAnimeDetailsClicked: widget.onAnimeDetailsClicked,
                ))
            .toList(),
      ),
    );
  }

  _buildCurrentAiringContainer() => Container(
        padding: const EdgeInsets.only(top: 16),
        child: ContainerHeaderFull(
          header: "Currently Airing",
          content: _buildCurrentAiringPager(),
          isActionPresent: true,
        ),
      );

  _buildUpcomingContainer() => Container(
        padding: const EdgeInsets.only(top: 16),
        child: ContainerHeaderFull(
          header: "Upcoming Anime",
          content: _buildUpcomingPager(),
          isActionPresent: true,
        ),
      );

  _buildRecommendationContainer() => Container(
        padding: const EdgeInsets.only(top: 16),
        child: ContainerHeaderFull(
          header: "Anime Recommendations",
          content: _buildRecommendationsPager(),
          isActionPresent: true,
        ),
      );
}
