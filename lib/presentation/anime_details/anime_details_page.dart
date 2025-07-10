import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hikki_enciclopedia/presentation/anime_details/state/anime_details.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hikki_enciclopedia/core/ui/error_screen.dart';
import 'package:hikki_enciclopedia/core/ui/loading_screen.dart';
import 'package:hikki_enciclopedia/presentation/anime_details/components/index.dart';
import 'package:hikki_enciclopedia/presentation/anime_details/state/anime_details_state.dart';
import 'package:share_plus/share_plus.dart';

import 'components/animated_details_list_item.dart';

// @RoutePage()
// class AnimeDetailsPage extends ConsumerStatefulWidget {
//   final int id;
//
//   const AnimeDetailsPage({
//     required this.id,
//     super.key,
//   });
//
//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() =>
//       _AnimeDetailsScreenState();
// }
//
// class _AnimeDetailsScreenState extends ConsumerState<AnimeDetailsPage> {
//   @override
//   void initState() {
//     super.initState();
//
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       ref.read(animeDetailsProvider.notifier).fetchAnimeDetails(widget.id);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final state = ref.watch(animeDetailsProvider);
//     final status = state.status;
//     final content = switch (status) {
//       AnimeDetailsLoading() => const LoadingScreen(),
//       AnimeDetailsError(:final message) => ErrorScreen(error: message),
//       AnimeDetailsLoaded(:final info) =>
//         _renderList(info, state.title, state.isTransparentToolbar,
//             (isTransparentToolbarChanged) {
//           ref
//               .read(animeDetailsProvider.notifier)
//               .onTransparentToolbarChanged(isTransparentToolbarChanged);
//         }),
//     };
//
//     return Scaffold(body: content);
//   }
//
//   Widget _renderList(
//       AnimeInfo info,
//       String title,
//       bool isTransparentToolbar,
//       ValueChanged<bool> onToolbarChanged,
//       ) {
//     int index = 0;
//
//     return CallbackScrollView(
//       onTransparentToolbarChanged: onToolbarChanged,
//       isTransparentToolbar: isTransparentToolbar,
//       children: [
//         DetailsDynamicToolbar(
//           isTransparentToolbar: isTransparentToolbar,
//           title: title,
//           onPressed: () {
//             SharePlus.instance.share(ShareParams(
//                 uri: Uri.parse('https://myanimelist.net/anime/${info.id}')));
//           },
//         ),
//         animatedSliver(
//             MainImageWithScore(score: info.score, imageUrl: info.imageUrl),
//             index++),
//         animatedSliver(Padding(
//           padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//           child: Text(info.title,
//               style: const TextStyle(
//                   color: Colors.black,
//                   fontSize: 20,
//                   fontWeight: FontWeight.w500),
//               textAlign: TextAlign.center),
//         ), index++),
//         if (info.briefItems.isNotEmpty)
//           animatedSliver(BriefInfoCarousel(items: info.briefItems), index++),
//         if (info.synopsis.isNotEmpty)
//           animatedSliver(
//             ExpandedDescription(
//               text: info.synopsis,
//               textPadding:
//               const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//               textStyle: const TextStyle(color: Colors.black),
//             ),
//             index++,
//           ),
//         if (info.genres.isNotEmpty)
//           animatedSliver(GenreCarousel(items: info.genres), index++),
//         if (info.relatedAnime.isNotEmpty)
//           animatedSliver(RelatedCarousel(items: info.relatedAnime), index++),
//         if (info.screenshots.isNotEmpty)
//           animatedSliver(ScreenshotCarousel(items: info.screenshots), index++),
//         if (info.recommendations.isNotEmpty)
//           animatedSliver(RecommendCarousel(items: info.recommendations), index++),
//         animatedSliver(StatisticsPanel(items: info.stats), index++),
//         const SliverToBoxAdapter(child: SizedBox(height: 100)),
//       ],
//     );
//   }
//
//   SliverToBoxAdapter animatedSliver(Widget child, int index) {
//     return SliverToBoxAdapter(
//       child: AnimatedListItem(index: index, child: child),
//     );
//   }
// }
