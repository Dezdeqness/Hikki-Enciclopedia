import 'package:flutter/material.dart';

import 'package:hikki_ui_kit/hikki_ui_kit.dart';

class CellHeader extends StatelessWidget {
  final String header;

  const CellHeader({
    required this.header,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 6.0, right: 6.0),
        child: Text(
          header,
          style:
              context.textTheme.d1.copyWith(color: context.colors.primaryDark),
        ),
      ),
    );
  }
}
