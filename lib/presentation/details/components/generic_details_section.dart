import 'package:flutter/material.dart';
import 'package:hikki_enciclopedia/ui/container_headerfull.dart';

class GenericDetailsSection<T> extends StatelessWidget {
  final String title;
  final double height;
  final List<T> items;
  final EdgeInsets padding;
  final EdgeInsets listPadding;
  final Widget Function(BuildContext context, T item) itemBuilder;

  const GenericDetailsSection({
    super.key,
    required this.title,
    required this.height,
    required this.items,
    required this.itemBuilder,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.listPadding = const EdgeInsets.symmetric(horizontal: 16),
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();

    return ContainerHeader(
      header: title,
      padding: padding,
      content: SizedBox(
        height: height,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: padding,
          itemCount: items.length,
          separatorBuilder: (_, __) => const SizedBox(width: 12),
          itemBuilder: (context, index) {
            return itemBuilder(context, items[index]);
          },
        ),
      ),
    );
  }
}
