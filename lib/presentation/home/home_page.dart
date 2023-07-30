import 'package:flutter/material.dart';
import 'package:hikki_enciclopedia/generated/l10n.dart';
import 'package:hikki_enciclopedia/presentation/home/home_provier.dart';

import 'package:hikki_enciclopedia/ui/anime_pager_item.dart';
import 'package:hikki_enciclopedia/ui/category_item.dart';
import 'package:hikki_enciclopedia/ui/container_headerfull.dart';
import 'package:hikki_enciclopedia/ui/news_item.dart';
import 'package:hikki_enciclopedia/ui/promotional_item.dart';
import 'package:provider/provider.dart';

import '../../domain/model/anime_entity.dart';

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
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    Provider.of<HomeProvider>(context, listen: false).fetchHomePage();
    // });
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
      );

  _buildHomePage() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildBanner(),
          _buildNewsContainer(),
          _buildPromotionalContainer(),
          _buildHorizontalListAiring(
            header: AppLocalizations.of(context).airingHeader,
          ),
          _buildHorizontalListUpcoming(
            header: AppLocalizations.of(context).upcomingHeader,
          ),
          _buildHorizontalListBypopularity(
            header: AppLocalizations.of(context).recommendationsHeader,
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
    const double height = 180;
    final PageController controller = PageController();
    return SizedBox(
      height: height,
      child: PageView(
        controller: controller,
        children: getNewsList()
            .map((element) => NewsItem(news: element, height: height))
            .toList(),
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

  _buildHorizontalListAiring({required String header}) => Container(
        padding: const EdgeInsets.only(top: 16),
        child: ContainerHeaderFull(
          header: header,
          content: Consumer<HomeProvider>(builder: (context, explorer, child) {
            return _buildPager(explorer.itemsAiring, explorer.isErrorAiring,
                explorer.errorAiring);
          }),
          isActionPresent: true,
        ),
      );

  _buildHorizontalListUpcoming({required String header}) => Container(
        padding: const EdgeInsets.only(top: 16),
        child: ContainerHeaderFull(
          header: header,
          content: Consumer<HomeProvider>(builder: (context, explorer, child) {
            return _buildPager(explorer.itemsUpcoming, explorer.isErrorUpcoming,
                explorer.errorUpcoming);
          }),
          isActionPresent: true,
        ),
      );

  _buildHorizontalListBypopularity({required String header}) => Container(
        padding: const EdgeInsets.only(top: 16),
        child: ContainerHeaderFull(
          header: header,
          content: Consumer<HomeProvider>(builder: (context, explorer, child) {
            return _buildPager(explorer.itemsBypopularity,
                explorer.isErrorBypopularity, explorer.errorBypopularity);
          }),
          isActionPresent: true,
        ),
      );

  _buildPromotionalPager() {
    const double height = 190;
    final PageController controller = PageController();
    return SizedBox(
      height: height,
      child: PageView(
        controller: controller,
        children: getPromotionalList()
            .map((element) => PromotionalItem(
                  name: element.name,
                  kind: element.kind,
                  imageUrl: element.imageUrl,
                  height: height,
                ))
            .toList(),
      ),
    );
  }

  _buildPager(List<AnimeEntity> list, bool isError, Object? error) {
    if (list.isNotEmpty) {
      return _animeHorizontalList(list);
    } else if (isError) {
      return _errorScreen(error);
    } else {
      return _loadingScreen();
    }
  }

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
                    height: 210,
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
