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
      surfaceTintColor: Colors.transparent,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            width: 120,
            height: 180,
            item.posterPath,
            fit: BoxFit.fitWidth,
            errorBuilder: (BuildContext context, Object exception,
                StackTrace? stackTrace) {
              return SizedBox(
                width: 120,
                height: 180,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
          Expanded(
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
                      maxLines: 5,
                      textAlign: TextAlign.start,
                      style: context.textTheme.h2
                          .copyWith(color: context.colors.primaryDark500),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
