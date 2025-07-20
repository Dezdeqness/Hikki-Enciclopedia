import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hikki_enciclopedia/presentation/home/models/tv_ui_item.dart';

import 'package:hikki_ui_kit/hikki_ui_kit.dart';

class TvAiringItem extends StatelessWidget {
  final TvUiItem item;

  const TvAiringItem({
    required this.item,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            width: 120,
            height: 180,
            imageUrl: item.posterPath,
            fit: BoxFit.fitWidth,
            placeholder: (context, url) =>
                Container(color: Colors.grey.shade300),
            errorWidget: (context, url, error) =>
                Container(color: Colors.grey.shade300),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      textAlign: TextAlign.start,
                      style: context.textTheme.d2
                          .copyWith(color: context.colors.primaryDark),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                    const SizedBox(height: 8.0),
                    Expanded(
                      child: Text(
                        item.overview,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        textAlign: TextAlign.start,
                        style: context.textTheme.h2
                            .copyWith(color: context.colors.primaryDark500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
