import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hikki_enciclopedia/core/ui/error_screen.dart';

import 'base_details_notifier.dart';

abstract class BaseDetailsPage<T extends Object> extends ConsumerWidget {
  final String id;

  const BaseDetailsPage({
    super.key,
    required this.id,
  });

  AutoDisposeAsyncNotifierProviderFamily<BaseDetailsNotifier<T>, T, String> provider();

  Widget buildBody(T item, BuildContext context);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(provider()(id));

    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: Container(
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
            child: state.when(
              data: (data) => buildBody(data, context),
              error: (e, st) => ErrorScreen(error: e.toString()),
              loading: () => const Center(child: CircularProgressIndicator()),
            ),
          ),
        ),
      ),
    );
  }
}
