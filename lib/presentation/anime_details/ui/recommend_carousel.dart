import 'package:flutter/material.dart';

import '../anime_details.dart';
import '../models/recommend_anime_ui_model.dart';

class RecommendCarousel extends StatelessWidget {
  const RecommendCarousel({super.key, required this.items});

  final List<RecommendAnimeUiModel> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Recommended anime',
              style: TextStyle(
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
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) => Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        surfaceTintColor: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
              "/animedetails",
              arguments: AnimeDetailsArguments(id: item.id),
            );
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
