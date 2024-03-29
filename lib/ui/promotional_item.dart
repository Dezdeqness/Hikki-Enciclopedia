import 'package:flutter/material.dart';

import 'package:hikki_ui_kit/hikki_ui_kit.dart';
import 'package:url_launcher/url_launcher.dart';

class PromotionalItem extends StatelessWidget {
  final String name;
  final String kind;
  final String imageUrl;
  final String url;
  final double height;

  const PromotionalItem({
    required this.name,
    required this.kind,
    required this.imageUrl,
    required this.height,
    required this.url,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWellWrapper(
          onTap: () async {
            final uri = Uri.parse(url);
            await launchUrl(
              uri,
              mode: LaunchMode.externalApplication,
            );
          },
          child: Stack(
            children: [
              SizedBox(
                height: height,
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
                      style: context.textTheme.c2
                          .copyWith(color: context.colors.primaryLight),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      kind,
                      textAlign: TextAlign.start,
                      style: context.textTheme.c2
                          .copyWith(color: context.colors.primaryLight),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
