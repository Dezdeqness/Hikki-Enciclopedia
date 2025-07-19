import 'package:flutter/material.dart';
import 'package:hikki_enciclopedia/presentation/home/models/tv_ui_item.dart';

import 'package:hikki_ui_kit/hikki_ui_kit.dart';

class TvTrendingItem extends StatelessWidget {
  final TvUiItem item;

  const TvTrendingItem({
    required this.item,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWellWrapper(
        onTap: () async {},
        child: Stack(
          children: [
            SizedBox(
              height: 180,
              width: double.infinity,
              child: Image.network(
                item.posterPath,
                fit: BoxFit.fitWidth,
                color: Colors.black45,
                colorBlendMode: BlendMode.darken,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    item.name,
                    textAlign: TextAlign.start,
                    style: context.textTheme.c2
                        .copyWith(color: context.colors.primaryLight),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
