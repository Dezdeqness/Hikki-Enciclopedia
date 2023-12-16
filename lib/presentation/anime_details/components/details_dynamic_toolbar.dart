import 'package:flutter/material.dart';
import 'package:hikki_localization/hikki_localization.dart';

class DetailsDynamicToolbar extends StatelessWidget {
  final bool isTransparentToolbar;
  final String title;
  final Function() onPressed;

  const DetailsDynamicToolbar({
    required this.isTransparentToolbar,
    required this.title,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      title: isTransparentToolbar
          ? null
          : Text(
              title.isNotEmpty
                  ? title
                  : LocaleKeys.animeDetailTitle.tr(context: context),
              style: const TextStyle(
                color: Colors.black,
                overflow: TextOverflow.ellipsis,
              ),
            ),
      backgroundColor:
          isTransparentToolbar ? Colors.transparent : const Color(0xFFF5F5F5),
      foregroundColor: Colors.black,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.share_outlined),
          onPressed: () {
            onPressed();
          },
        ),
      ],
      surfaceTintColor: Colors.transparent,
    );
  }
}
