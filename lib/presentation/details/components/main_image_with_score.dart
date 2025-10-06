import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hikki_ui_kit/hikki_ui_kit.dart';

class MainImageWithScore extends StatelessWidget {
  final double score;
  final String imageUrl;

  const MainImageWithScore({
    required this.score,
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Center(
        child: SizedBox(
          height: 250,
          width: 200,
          child: Stack(
            children: [
              Align(
                child: ClipRRect(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  borderRadius: BorderRadius.circular(8.0),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl,
                    height: 250,
                    width: 200,
                    fit: BoxFit.fitWidth,
                    placeholder: (context, url) =>
                        Container(color: Colors.grey.shade300),
                    errorWidget: (context, url, error) =>
                        Container(color: Colors.grey.shade300),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      score.toString(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.start,
                      style: context.text.labelMedium
                          .copyWith(color: context.colors.textPrimary),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
