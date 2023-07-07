import 'package:flutter/material.dart';

import '../anime_details.dart';
import '../models/related_anime_ui_model.dart';

class RelatedCarousel extends StatelessWidget {
  const RelatedCarousel({super.key, required this.items});

  final List<RelatedAnimeUiModel> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Related anime',
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
              children: items.map((e) => RelatedItem(item: e)).toList()),
        ),
      ],
    );
  }
}

class RelatedItem extends StatelessWidget {
  final RelatedAnimeUiModel item;

  const RelatedItem({
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
                        Align(
                          child: Text(
                            item.relationType,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(
                              color: Color(0x86484848),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
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
