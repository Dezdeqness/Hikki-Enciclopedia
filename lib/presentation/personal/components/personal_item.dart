import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hikki_enciclopedia/presentation/personal/models/personal_ui_item.dart';
import 'package:hikki_localization/hikki_localization.dart';

class PersonalCell extends StatelessWidget {
  final PersonalUiItem item;

  const PersonalCell({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                height: 120,
                width: 80,
                imageUrl: item.posterPath,
                placeholder: (context, url) =>
                    Container(color: Colors.grey.shade300),
                errorWidget: (context, url, error) =>
                    Container(color: Colors.grey.shade300),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.overview,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    item.rating != null
                        ? Text(
                            LocaleKeys.personalUserScore.tr() +
                                item.rating.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : Text(
                            LocaleKeys.personalOverallScore.tr() +
                                item.voteAverage.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                  ],
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
