import 'package:flutter/material.dart';
import 'package:hikki_enciclopedia/presentation/anime_details/models/recommend_anime_ui_model.dart';
import 'package:hikki_localization/hikki_localization.dart';

class RecommendCarousel extends StatelessWidget {
  final List<RecommendAnimeUiModel> items;

  const RecommendCarousel({
    required this.items,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              LocaleKeys.animeDetailCarouselRecommendedAnime
                  .tr(context: context),
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
              textAlign: TextAlign.start,
            ),
          ),
        ),
        SizedBox(
          height: 240,
          child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              scrollDirection: Axis.horizontal,
              children: items.map((e) => RecommendItem(item: e)).toList()),
        ),
      ],
    );
  }
}

class RecommendItem extends StatelessWidget {
  final RecommendAnimeUiModel item;

  const RecommendItem({
    required this.item,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        surfaceTintColor: Colors.transparent,
        child: InkWell(
          onTap: () {
            // context.pushRoute(AnimeDetailsRoute(id: item.id));
          },
          child: SizedBox(
            width: 130,
            height: 240,
            child: Column(
              children: [
                Flexible(
                  flex: 70,
                  child: Stack(
                    children: [
                      Image.network(
                        item.imageUrl,
                        width: 130,
                        fit: BoxFit.fitWidth,
                        color: Colors.black38,
                        colorBlendMode: BlendMode.darken,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return const SizedBox(
                            width: 130,
                            child: Center(child: CircularProgressIndicator()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 30,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Align(
                            child: Text(
                              item.title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
