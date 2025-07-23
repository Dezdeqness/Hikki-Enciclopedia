import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hikki_enciclopedia/core/ui/error_screen.dart';
import 'package:hikki_enciclopedia/presentation/tv_details/models/tv_details_ui_item.dart';
import 'package:hikki_enciclopedia/presentation/tv_details/providers/tv_details_providers.dart';

import 'components/expanded_description.dart';
import 'components/genre_carousel.dart';
import 'components/main_image_with_score.dart';
import 'components/related_info.dart';

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
                data: (data) => _body(data),
                error: (e, st) => ErrorScreen(error: e.toString()),
                loading: () => Center(child: CircularProgressIndicator())),
          ),
        ),
      ),
    );
  }

  Widget _body(TvDetailsUiItem item) {
    return SingleChildScrollView(
      child: Column(
        spacing: 8,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: MainImageWithScore(
              imageUrl: item.posterPath,
              score: item.voteAverage,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Text(
              item.name,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          GenreCarousel(items: item.genres),
          Card(
            margin: const EdgeInsets.all(8),
            color: Colors.white,
            child: ExpandedDescription(
              text: item.overview,
              textPadding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              textStyle: const TextStyle(color: Colors.black),
            ),
          ),
          RelatedInfo(item: item),
        ],
      ),
    );
  }
}
