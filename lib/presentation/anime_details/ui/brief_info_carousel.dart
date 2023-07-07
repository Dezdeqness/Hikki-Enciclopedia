import 'package:flutter/material.dart';

import '../models/brief_info_anime_ui_model.dart';

class BriefInfoCarousel extends StatelessWidget {
  const BriefInfoCarousel({super.key, required this.items});

  final List<BriefInfoAnimeUIModel> items;

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
  const BriefInfoItem({super.key, required this.title, required this.value});

  final String title;
  final String value;

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
