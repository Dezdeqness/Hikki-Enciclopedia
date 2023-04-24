import 'package:flutter/material.dart';

import 'package:hikki_enciclopedia/theme/styles.dart';

import '../data/entities.dart';

class NewsItem extends StatelessWidget {
  final News news;

  const NewsItem({
    required this.news,
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
                height: 180,
                news.imageUrl,
                fit: BoxFit.fitHeight,
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
