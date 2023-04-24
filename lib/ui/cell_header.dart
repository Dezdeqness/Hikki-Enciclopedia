import 'package:flutter/material.dart';

import 'package:hikki_enciclopedia/theme/styles.dart';

class CellHeader extends StatelessWidget {
  final String header;

  const CellHeader({
    required this.header,
    super.key,
  });

  @override
  Widget build(BuildContext context) =>
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 6.0, right: 6.0),
          child: Text(
            header,
            style: AppStyles.headerText,
          ),
        ),
      );

}
