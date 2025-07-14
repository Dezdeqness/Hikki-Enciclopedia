import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hikki_ui_kit/hikki_ui_kit.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class EntryPage extends ConsumerWidget {
  const EntryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(HikkiAssets.lottie.entryLoading),
      ),
    );
  }
}
