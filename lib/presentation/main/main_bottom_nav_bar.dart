import 'package:flutter/material.dart';

class MainBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onSelectTab;

  MainBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onSelectTab,
  });

  final _navBarItemsData = [
    NavBarItem(
      icon: const Icon(Icons.bookmark),
      label: 'Personal list',
    ),
    NavBarItem(
      icon: const Icon(Icons.home),
      label: 'Home',
    ),
    NavBarItem(
      icon: const Icon(Icons.explore),
      label: 'Explorer',
    ),
    NavBarItem(
      icon: const Icon(Icons.person),
      label: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final items = _navBarItemsData.map((value) {
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
