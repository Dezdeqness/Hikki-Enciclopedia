import 'package:flutter/material.dart';
import 'package:hikki_localization/hikki_localization.dart';

class ScreenshotCarousel extends StatelessWidget {
  final List<String> items;

  const ScreenshotCarousel({
    required this.items,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenshots = items
        .map((e) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  e,
                  width: 110,
                  height: 180,
                  fit: BoxFit.fitHeight,
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
              ),
            ))
        .toList();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              LocaleKeys.animeDetailCarouselScreenshots.tr(context: context),
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
              textAlign: TextAlign.start,
            ),
          ),
        ),
        SizedBox(
          height: 180,
          child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              scrollDirection: Axis.horizontal,
              children: screenshots),
        ),
      ],
    );
  }
}
