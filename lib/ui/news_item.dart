import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';

import 'package:hikki_ui_kit/hikki_ui_kit.dart';

class NewsItem extends StatelessWidget {
  final News news;
  final double height;

  const NewsItem({
    required this.news,
    required this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          surfaceTintColor: Colors.transparent,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                width: 120,
                height: height,
                news.imageUrl,
                fit: BoxFit.fitHeight,
                errorBuilder:
                    (BuildContext context, Object exception, StackTrace? stackTrace) {
                  return SizedBox(
                    width: 120,
                    height: height,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        news.title,
                        textAlign: TextAlign.start,
                        style: AppStyles.newsItemTitle,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                      const SizedBox(height: 8.0),
                      Expanded(
                        child: Text(
                          news.description,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                          textAlign: TextAlign.start,
                          style: AppStyles.newsItemDescription,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
