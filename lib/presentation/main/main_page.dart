import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hikki_enciclopedia/presentation/navigation/hikki_app_router.dart';
import 'package:hikki_localization/hikki_localization.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
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
    );
  }
}
