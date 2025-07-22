import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hikki_enciclopedia/core/ui/error_screen.dart';
import 'package:hikki_enciclopedia/presentation/tv_details/providers/tv_details_providers.dart';


@RoutePage()
class TvDetailsPage extends ConsumerWidget {
  final String id;

  const TvDetailsPage({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(tvDetailsNotifierProvider(id));
    return SafeArea(
      child: Scaffold(
        body: state.when(
            data: (data) => Container(),
            error: (e, st) => ErrorScreen(error: e.toString()),
            loading: () => CircularProgressIndicator()),
      ),
    );
  }
}
