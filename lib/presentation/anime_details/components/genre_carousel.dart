import 'package:flutter/material.dart';

class GenreCarousel extends StatelessWidget {
  final List<String> items;

  const GenreCarousel({
    required this.items,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final chips = items
        .map((value) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Chip(
                label: Text(value),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ))
        .toList();

    return SizedBox(
      height: 50,
      child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          scrollDirection: Axis.horizontal,
          children: chips),
    );
  }
}
