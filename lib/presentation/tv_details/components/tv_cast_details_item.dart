import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TvCastDetailsModel {
  final String name;
  final String character;
  final String imageUrl;

  TvCastDetailsModel({
    required this.name,
    required this.character,
    required this.imageUrl,
  });
}

class TvCastDetailsItem extends StatelessWidget {
  final TvCastDetailsModel item;

  const TvCastDetailsItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: item.imageUrl,
            width: 120,
            height: 170,
            placeholder: (context, url) =>
                Container(color: Colors.grey.shade300),
            errorWidget: (context, url, error) =>
                Container(color: Colors.grey.shade300),
            fit: BoxFit.cover,
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              item.name,
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              item.character,
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        )
      ],
    );
  }
}
