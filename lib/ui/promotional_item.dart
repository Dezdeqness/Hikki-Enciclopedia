import 'package:flutter/material.dart';

import 'package:hikki_enciclopedia/theme/styles.dart';

class PromotionalItem extends StatelessWidget {
  final String name;
  final String kind;
  final String imageUrl;

  const PromotionalItem({
    required this.name,
    required this.kind,
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.fitWidth,
                  color: Colors.black45,
                  colorBlendMode: BlendMode.darken,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      name,
                      textAlign: TextAlign.start,
                      style: AppStyles.promotionalText,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      kind,
                      textAlign: TextAlign.start,
                      style: AppStyles.promotionalText,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
