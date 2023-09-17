import 'package:flutter/material.dart';
import 'package:hikki_localization/hikki_localization.dart';

class MainBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onSelectTab;

  const MainBottomNavBar({
    required this.currentIndex,
    required this.onSelectTab,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      NavBarItem(
        icon: const Icon(Icons.bookmark),
        label: LocaleKeys.tabItemPersonalList.tr(),
      ),
      NavBarItem(
        icon: const Icon(Icons.home),
        label: LocaleKeys.tabItemHome.tr(),
      ),
      NavBarItem(
        icon: const Icon(Icons.explore),
        label: LocaleKeys.tabItemExplorer.tr(),
      ),
      NavBarItem(
        icon: const Icon(Icons.person),
        label: LocaleKeys.tabItemProfile.tr(),
      ),
    ].map((value) {
      return _buildItem(value);
    }).toList();

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: items,
      currentIndex: currentIndex,
      onTap: onSelectTab,
    );
  }

  BottomNavigationBarItem _buildItem(NavBarItem item) =>
      BottomNavigationBarItem(
        icon: item.icon,
        label: item.label,
      );
}

class NavBarItem {
  final String label;
  final Widget icon;

  NavBarItem({
    required this.label,
    required this.icon,
  });
}
