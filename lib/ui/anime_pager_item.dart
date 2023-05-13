import 'package:flutter/material.dart';

import '../theme/styles.dart';

class AnimePagerItem extends StatelessWidget {
  final String title;
  final String type;
  final double score;
  final String imageUrl;
  final ValueChanged<String> onAnimeDetailsClicked;

  const AnimePagerItem({
    super.key,
    required this.title,
    required this.type,
    required this.score,
    required this.imageUrl,
    required this.onAnimeDetailsClicked,
  });

  @override
  Widget build(BuildContext context) {
    final String formatScore = score == 0.0 ? "N/A" : score.toString();
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      surfaceTintColor: Colors.transparent,
      child: InkWell(
        onTap: () {
          onAnimeDetailsClicked.call(title);
        },
        child: SizedBox(
          width: 110,
          height: 180,
          child: Column(
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
                          style: AppStyles.animeTypeLabel,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          style: AppStyles.animeTitle,
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
                                style: AppStyles.animeScore,
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
