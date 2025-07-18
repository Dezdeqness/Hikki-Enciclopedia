import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hikki_enciclopedia/presentation/entry_page/providers/entry_providers.dart';
import 'package:hikki_enciclopedia/presentation/navigation/hikki_app_router.dart';
import 'package:hikki_ui_kit/hikki_ui_kit.dart';
import 'package:lottie/lottie.dart';

import 'app_auth_state.dart';

@RoutePage()
class EntryPage extends ConsumerStatefulWidget {
  const EntryPage({super.key});

  @override
  ConsumerState<EntryPage> createState() => _EntryPageState();
}

class _EntryPageState extends ConsumerState<EntryPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(appAuthStateNotifierProvider.notifier).checkAuth();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AppAuthState>(appAuthStateNotifierProvider, (prev, next) {
      switch (next) {
        case LoggedIn():
          context.replaceRoute(const MainRoute());
          break;
        case LoggedOut():
          context.replaceRoute(const AuthorizeRoute());
          break;
        case Initial():
          break;
      }
    });

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color(0xFFB2DFDB),
              Color(0xFFE0F7FA),
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Lottie.asset(HikkiAssets.lottie.entryLoading),
          ),
        ),
      ),
    );
  }
}
