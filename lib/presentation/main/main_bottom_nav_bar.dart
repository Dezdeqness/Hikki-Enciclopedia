import 'package:flutter/material.dart';
import 'package:hikki_enciclopedia/generated/l10n.dart';

class MainBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onSelectTab;

  const MainBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onSelectTab,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      NavBarItem(
        icon: const Icon(Icons.bookmark),
        label: AppLocalizations.of(context).tabItemPersonalList,
      ),
      NavBarItem(
        icon: const Icon(Icons.home),
        label: AppLocalizations.of(context).tabItemHome,
      ),
      NavBarItem(
        icon: const Icon(Icons.explore),
        label: AppLocalizations.of(context).tabItemExplorer,
      ),
      NavBarItem(
        icon: const Icon(Icons.person),
        label: AppLocalizations.of(context).tabItemProfile,
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
