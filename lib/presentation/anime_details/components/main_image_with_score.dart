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
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: 200,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(8))),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      score.toString(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.start,
                      style: context.textTheme.c2
                          .copyWith(color: context.colors.primaryLight),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
