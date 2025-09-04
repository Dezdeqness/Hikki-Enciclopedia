import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class VideoDetailsItem extends StatelessWidget {
  final String imageUrl;

  const VideoDetailsItem({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CachedNetworkImage(
        height: 130,
        width: 250,
        imageUrl: imageUrl,
        placeholder: (context, url) =>
            Container(color: Colors.grey.shade300),
        errorWidget: (context, url, error) =>
            Container(color: Colors.grey.shade300),
        fit: BoxFit.cover,
      ),
    );
  }

}
