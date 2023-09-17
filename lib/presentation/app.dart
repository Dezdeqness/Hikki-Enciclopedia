import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hikki_enciclopedia/presentation/explorer/explorer_tab.dart';
import 'package:hikki_enciclopedia/presentation/personallist/personal_list_tab.dart';
import 'package:hikki_enciclopedia/presentation/profile/profile_tab.dart';
import 'package:hikki_enciclopedia/ui/lazy_indexed_stack.dart';
import 'package:hikki_localization/hikki_localization.dart';
import 'package:hikki_enciclopedia/presentation/exit_dialog/index.dart';
import 'package:hikki_ui_kit/hikki_ui_kit.dart';

import 'home/home_tab.dart';
import 'main/main_bottom_nav_bar.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State {
  // TODO: Save in preferences
  int _selectedIndex = 1;
  final List<GlobalKey<NavigatorState>> _navigatorsKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        extensions: <ThemeExtension<HikkiColors>>[
          HikkiColors(),
        ],
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
          ),
        ),
      ),
      home: WillPopScope(
        onWillPop: () async {
          final navState = _navigatorsKeys[_selectedIndex].currentState;
          final isFirstRouteCurrentTab = !(await navState?.maybePop() ?? false);

          if (isFirstRouteCurrentTab) {
            if (_selectedIndex != 1) {
              setState(() {
                _onItemTapped(1);
              });
              return false;
            }
          }

          if (isFirstRouteCurrentTab && context.mounted) {
            bool? result = await showDialog<bool>(
              context: context,
              builder: (context) => const ExitDialog(),
            );
            return result ?? isFirstRouteCurrentTab;
          }

          return isFirstRouteCurrentTab;
        },
        child: Scaffold(
            body: LazyIndexedStack(
              index: _selectedIndex,
              children: [
                PersonalListTab(navigatorKey: _navigatorsKeys[0]),
                HomeTab(navigatorKey: _navigatorsKeys[1]),
                ExplorerTab(navigatorKey: _navigatorsKeys[2]),
                ProfileTab(navigatorKey: _navigatorsKeys[3]),
              ],
            ),
            bottomNavigationBar: MainBottomNavBar(
              currentIndex: _selectedIndex,
              onSelectTab: _onItemTapped,
            )),
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
