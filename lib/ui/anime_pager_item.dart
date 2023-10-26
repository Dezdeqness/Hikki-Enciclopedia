import 'package:flutter/material.dart';
import 'package:hikki_localization/hikki_localization.dart';
import 'package:hikki_ui_kit/hikki_ui_kit.dart';

class AnimePagerItem extends StatelessWidget {
  final int id;
  final String title;
  final String type;
  final double score;
  final String imageUrl;
  final ValueChanged<int> onAnimeDetailsClicked;
  final double height;

  const AnimePagerItem({
    required this.id,
    required this.title,
    required this.type,
    required this.score,
    required this.imageUrl,
    required this.onAnimeDetailsClicked,
    required this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final String formatScore = score == 0.0
        ? LocaleKeys.generalNoAvailable.tr(context: context)
        : score.toString();
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      surfaceTintColor: Colors.transparent,
      child: InkWell(
        onTap: () {
          onAnimeDetailsClicked.call(id);
        },
        child: SizedBox(
          width: 110,
          // height: height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                flex: 70,
                child: Stack(
                  children: [
                    Image.network(
                      imageUrl,
                      width: 110,
                      fit: BoxFit.fitWidth,
                      color: Colors.black38,
                      colorBlendMode: BlendMode.darken,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          type.toUpperCase(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          style: context.textTheme.c2
                              .copyWith(color: context.colors.primaryLight),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 20,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          style: context.textTheme.c1
                              .copyWith(color: context.colors.primaryDark),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.black,
                              size: 14,
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                formatScore,
                                style: context.textTheme.c1.copyWith(
                                    color: context.colors.primaryDark),
                              ),
                            ),
                          ],
                        ),
                      )
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
}
