import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hikki_enciclopedia/presentation/home/components/tv_airing_item.dart';
import 'package:hikki_enciclopedia/presentation/home/components/tv_page_shimmer.dart';
import 'package:hikki_enciclopedia/presentation/home/home_section_state.dart';
import 'package:hikki_enciclopedia/presentation/home/providers/home_providers.dart';
import 'package:hikki_enciclopedia/presentation/navigation/hikki_app_router.dart';

import 'package:hikki_enciclopedia/ui/container_headerfull.dart';
import 'package:hikki_localization/hikki_localization.dart';

import 'components/tv_common_item.dart';
import 'components/tv_trending_item.dart';
import 'models/tv_ui_item.dart';

@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final airingState = ref.watch(airingSectionNotifierProvider);
    final trendingState = ref.watch(trendingSectionNotifierProvider);
    final popularState = ref.watch(popularSectionNotifierProvider);
    final topRatedState = ref.watch(topRatedSectionNotifierProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: Colors.transparent,
                    expandedHeight: 180,
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.pin,
                      background: Stack(
                        fit: StackFit.expand,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(24.0),
                              child: Image.network(
                                'https://image.tmdb.org/t/p/w1920_and_h600_multi_faces_filter(duotone,00192f,00baff)/3bhkrj58Vtu7enYsRolD1fZdja1.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                              child: GestureDetector(
                                onTap: () {
                                  context.pushRoute(ExplorerRoute());
                                },
                                child: Hero(
                                  tag: 'searchBarHero',
                                  child: Material(
                                    color: Colors.transparent,
                                    child: Container(
                                      height: 48,
                                      decoration: BoxDecoration(
                                        color: Colors.white.withValues(alpha: 0.95),
                                        borderRadius: BorderRadius.circular(24),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withValues(alpha: 0.1),
                                            blurRadius: 8,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        children: [
                                          const SizedBox(width: 16),
                                          const Icon(Icons.search, color: Colors.blueAccent),
                                          const SizedBox(width: 8),
                                          Text(
                                            'Search...',
                                            style: TextStyle(
                                              color: Colors.grey[700],
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      _buildSection(
                        title: LocaleKeys.airingHeader.tr(),
                        state: airingState,
                        height: 180,
                        contentBuilder: (tvs) => PageView.builder(
                          itemCount: tvs.length,
                          controller: PageController(viewportFraction: 0.92),
                          itemBuilder: (_, index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: TvAiringItem(item: tvs[index]),
                          ),
                        ),
                      ),
                      _buildSection(
                        title: LocaleKeys.trendingHeader.tr(),
                        state: trendingState,
                        height: 180,
                        contentBuilder: (tvs) => PageView.builder(
                          itemCount: tvs.length,
                          controller: PageController(viewportFraction: 0.92),
                          itemBuilder: (_, index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: TvTrendingItem(item: tvs[index]),
                          ),
                        ),
                      ),
                      _buildSection(
                        title: LocaleKeys.popularHeader.tr(),
                        state: popularState,
                        height: 220,
                        contentBuilder: (tvs) => ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: tvs.length,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          separatorBuilder: (_, __) => const SizedBox(width: 12),
                          itemBuilder: (_, index) => SizedBox(
                            width: 120,
                            child: TvCommonItem(item: tvs[index]),
                          ),
                        ),
                      ),
                      _buildSection(
                        title: LocaleKeys.topRatedHeader.tr(),
                        state: topRatedState,
                        height: 220,
                        contentBuilder: (tvs) => ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: tvs.length,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          separatorBuilder: (_, __) => const SizedBox(width: 12),
                          itemBuilder: (_, index) => SizedBox(
                            width: 120,
                            child: TvCommonItem(item: tvs[index]),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required HomeSectionState state,
    required double height,
    required Widget Function(List<TvUiItem> tvs) contentBuilder,
  }) {
    Widget child;
    const padding = EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0);

    if (state is Loading || state is Initial || state is Error) {
      child = Padding(
        padding: padding,
        child: const TvPageShimmer(),
      );
    } else if (state is Success) {
      child = contentBuilder(state.tvs);
    } else {
      child = const SizedBox.shrink();
    }

    return ContainerHeader(
      header: title,
      padding: padding,
      content: SizedBox(
        height: height,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: child,
        ),
      ),
    );
  }
}
