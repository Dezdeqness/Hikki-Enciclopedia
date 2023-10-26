import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hikki_enciclopedia/presentation/home/components/index.dart';
import 'package:hikki_enciclopedia/presentation/home/cubit/airing/airing_cubit.dart';
import 'package:hikki_enciclopedia/presentation/home/cubit/airing/airing_state.dart';
import 'package:hikki_enciclopedia/presentation/home/cubit/news/news_cubit.dart';
import 'package:hikki_enciclopedia/presentation/home/cubit/news/news_state.dart';
import 'package:hikki_enciclopedia/presentation/home/cubit/popularity/popularity_state.dart';
import 'package:hikki_enciclopedia/presentation/home/cubit/popularity/popularity_cubit.dart';
import 'package:hikki_enciclopedia/presentation/home/cubit/promo/promo_cubit.dart';
import 'package:hikki_enciclopedia/presentation/home/cubit/promo/promo_state.dart';
import 'package:hikki_enciclopedia/presentation/home/cubit/upcoming/upcoming_cubit.dart';
import 'package:hikki_enciclopedia/presentation/home/cubit/upcoming/upcoming_state.dart';

import 'package:hikki_enciclopedia/ui/category_item.dart';
import 'package:hikki_enciclopedia/ui/container_headerfull.dart';
import 'package:hikki_enciclopedia/ui/news_item.dart';
import 'package:hikki_enciclopedia/ui/promotional_item.dart';
import 'package:hikki_localization/hikki_localization.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.browseAnime.tr(),
            style: const TextStyle(color: Colors.black)),
        elevation: 0,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Flexible(
                    child: CategoryItem(
                      title: LocaleKeys.topAnime.tr(),
                      icon: Icons.trending_up,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Flexible(
                    child: CategoryItem(
                      title: LocaleKeys.seasonal.tr(),
                      icon: Icons.sunny,
                    ),
                  ),
                ],
              ),
            ),
            BlocConsumer<NewsCubit, NewsState>(
              bloc: context.read<NewsCubit>()..fetchNews(),
              builder: (context, state) {
                const double height = 180;
                return ContainerHeader(
                  header: LocaleKeys.latestHeader.tr(),
                  padding:
                      const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                  content: HorizontalPagerWithState(
                    list: state.items
                        .map((element) => NewsItem(
                            title: element.title,
                            description: element.description,
                            imageUrl: element.imageUrl,
                            url: element.url,
                            height: height))
                        .toList(),
                    isError: state.isError,
                    error: null,
                    height: height,
                  ),
                );
              },
              listener: (context, state) {},
            ),
            BlocConsumer<PromoCubit, PromoState>(
              bloc: context.read<PromoCubit>()..fetchPromo(),
              builder: (context, state) {
                const double height = 190;
                return ContainerHeader(
                  header: LocaleKeys.promotionalHeader.tr(),
                  padding:
                      const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                  content: HorizontalPagerWithState(
                    list: state.items
                        .map((element) => PromotionalItem(
                              name: element.name,
                              kind: element.kind,
                              imageUrl: element.imageUrl,
                              url: element.url,
                              height: height,
                            ))
                        .toList(),
                    isError: state.isError,
                    error: null,
                    height: height,
                  ),
                );
              },
              listener: (context, state) {},
            ),
            BlocConsumer<AiringCubit, AiringState>(
              bloc: context.read<AiringCubit>()..fetchAiring(),
              builder: (context, state) {
                return ContainerHeader(
                  header: LocaleKeys.airingHeader.tr(),
                  padding:
                      const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                  content: HorizontalListWithState(
                    list: state.items,
                    isError: state.isError,
                    error: null,
                  ),
                );
              },
              listener: (context, state) {},
            ),
            BlocConsumer<UpcomingCubit, UpcomingState>(
              bloc: context.read<UpcomingCubit>()..fetchUpcoming(),
              builder: (context, state) {
                return ContainerHeader(
                  header: LocaleKeys.upcomingHeader.tr(),
                  padding:
                      const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                  content: HorizontalListWithState(
                    list: state.items,
                    isError: state.isError,
                    error: null,
                  ),
                );
              },
              listener: (BuildContext context, state) {},
            ),
            BlocConsumer<PopularityCubit, PopularityState>(
              bloc: context.read<PopularityCubit>()..fetchByPopularity(),
              builder: (context, state) {
                return ContainerHeader(
                  header: LocaleKeys.recommendationsHeader.tr(),
                  padding:
                      const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                  content: HorizontalListWithState(
                    list: state.items,
                    isError: state.isError,
                    error: null,
                  ),
                );
              },
              listener: (context, state) {},
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
