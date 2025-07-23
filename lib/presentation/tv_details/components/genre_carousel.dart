import 'package:flutter/material.dart';

class GenreCarousel extends StatelessWidget {
  final List<String> items;
  final EdgeInsets? padding;

  const GenreCarousel({
    super.key,
    required this.items,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      height: 50,
      child: ListView.separated(
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return _GenreItem(text: items[index]);
        },
        separatorBuilder: (_, __) => const SizedBox(width: 8),
      ),
    );
  }
}

class _GenreItem extends StatelessWidget {
  final String text;

  const _GenreItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            Color(0xFFB2DFDB),
            Color(0xFFE0F7FA),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
