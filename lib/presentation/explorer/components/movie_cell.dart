import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hikki_enciclopedia/presentation/explorer/models/movie_ui_item.dart';

class MovieCell extends StatelessWidget {
  final MovieUiItem item;
  final VoidCallback onTap;

  const MovieCell({super.key, required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
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
                Row(children: [
                  Text(
                    item.releaseDate,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  const Spacer(),
                  if (item.voteAverage != 0)
                    Text(
                      "${item.voteAverage.toInt()}%",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: _getUserScoreColor(item.voteAverage),
                      ),
                    ),
                ]),
              ],
            )),
            const SizedBox(width: 12),
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
          ],
        ),
      ),
    );
  }

  Color _getUserScoreColor(int value) {
    if (value <= 40) {
      return const Color(0xFFD32F2F);
    } else if (value <= 70) {
      return const Color(0xFFFFA000);
    } else {
      return const Color(0xFF388E3C);
    }
  }
}
