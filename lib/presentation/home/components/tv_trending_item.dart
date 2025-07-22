import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hikki_enciclopedia/presentation/home/models/tv_ui_item.dart';
import 'package:hikki_enciclopedia/presentation/navigation/hikki_app_router.dart';

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
        onTap: () async {
          context.pushRoute(TvDetailsRoute(id: item.id.toString()));
        },
        child: Stack(
          children: [
            CachedNetworkImage(
              height: 180,
              width: double.infinity,
              imageUrl: item.posterPath,
              placeholder: (context, url) =>
                  Container(color: Colors.grey.shade300),
              errorWidget: (context, url, error) =>
                  Container(color: Colors.grey.shade300),
              fit: BoxFit.cover,
              colorBlendMode: BlendMode.darken,
              color: Colors.black45,
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
