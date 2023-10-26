import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hikki_enciclopedia/data/datasource/news/news_api_datasource.dart';
import 'package:hikki_enciclopedia/data/datasource/promo/promo_api_datasource.dart';
import 'package:hikki_enciclopedia/domain/usecase/get_anime_list_use_case.dart';
import 'package:hikki_enciclopedia/presentation/explorer/cubit/explorer_cubit.dart';
import 'package:hikki_enciclopedia/presentation/home/cubit/airing/airing_cubit.dart';
import 'package:hikki_enciclopedia/presentation/home/cubit/news/news_cubit.dart';
import 'package:hikki_enciclopedia/presentation/home/cubit/popularity/popularity_cubit.dart';
import 'package:hikki_enciclopedia/presentation/home/cubit/promo/promo_cubit.dart';
import 'package:hikki_enciclopedia/presentation/home/cubit/upcoming/upcoming_cubit.dart';
import 'package:hikki_enciclopedia/presentation/navigation/hikki_app_router.dart';
import 'package:hikki_localization/hikki_localization.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UpcomingCubit>(
          create: (context) =>
              UpcomingCubit(useCase: context.read<GetAnimeListUseCase>()),
        ),
        BlocProvider<AiringCubit>(
          create: (context) =>
              AiringCubit(useCase: context.read<GetAnimeListUseCase>()),
        ),
        BlocProvider<PopularityCubit>(
          create: (context) =>
              PopularityCubit(useCase: context.read<GetAnimeListUseCase>()),
        ),
        BlocProvider<NewsCubit>(
          create: (context) => NewsCubit(
              dataSource: context.read<NewsApiDataSource>()),
        ),
        BlocProvider<PromoCubit>(
          create: (context) => PromoCubit(
              dataSource: context.read<PromoApiDataSource>()),
        ),
        BlocProvider<ExplorerCubit>(
          create: (context) => ExplorerCubit(
              getAnimeListUseCase: context.read<GetAnimeListUseCase>()),
        ),
      ],
      child: WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: AutoTabsScaffold(
          animationDuration: const Duration(milliseconds: 0),
          homeIndex: 1,
          routes: const [
            PersonalListRoute(),
            HomeRoute(),
            ExplorerRoute(),
            ProfileRoute(),
          ],
          bottomNavigationBuilder: (_, tabsRouter) {
            return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: tabsRouter.activeIndex,
              onTap: tabsRouter.setActiveIndex,
              items: [
                BottomNavigationBarItem(
                  label: LocaleKeys.tabItemPersonalList.tr(),
                  icon: const Icon(Icons.bookmark),
                ),
                BottomNavigationBarItem(
                  label: LocaleKeys.tabItemHome.tr(),
                  icon: const Icon(Icons.home),
                ),
                BottomNavigationBarItem(
                  label: LocaleKeys.tabItemExplorer.tr(),
                  icon: const Icon(Icons.explore),
                ),
                BottomNavigationBarItem(
                  label: LocaleKeys.tabItemProfile.tr(),
                  icon: const Icon(Icons.person),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
