import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileAvatarItem extends StatelessWidget {
  final String imageUrl;

  const ProfileAvatarItem({
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Center(
    child: ClipOval(
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        height: 100,
        width: 100,
        placeholder: (context, url) =>
            Container(color: Colors.grey.shade300),
        errorWidget: (context, url, error) =>
            Container(color: Colors.grey.shade300),
      ),
    ),
  );
}
