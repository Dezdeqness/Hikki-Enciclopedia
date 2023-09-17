import 'package:flutter/material.dart';

import 'package:hikki_enciclopedia/presentation/anime_details/models/brief_info_anime_ui_model.dart';

class BriefInfoCarousel extends StatelessWidget {
  final List<BriefInfoAnimeUIModel> items;

  const BriefInfoCarousel({
    required this.items,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: 70,
        child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            scrollDirection: Axis.horizontal,
            children: items
                .map((e) => BriefInfoItem(
                      title: e.title,
                      value: e.value,
                    ))
                .toList()),
      ),
    );
  }
}

class BriefInfoItem extends StatelessWidget {
  final String title;
  final String value;

  const BriefInfoItem({
    required this.title,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
