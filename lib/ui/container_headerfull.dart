import 'package:flutter/material.dart';

import 'cell_header.dart';

class ContainerHeader extends StatelessWidget {
  final String header;
  final Widget content;
  final EdgeInsets? padding;

  const ContainerHeader({
    required this.header,
    required this.content,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
            padding: padding ?? EdgeInsets.zero,
            child: CellHeader(header: header)
            // child: Row(
            //   crossAxisAlignment: CrossAxisAlignment.baseline,
            //   textBaseline: TextBaseline.alphabetic,
            //   children: [
            //     Expanded(child: CellHeader(header: header)),
            //   ],
            // ),
            ),
        const SizedBox(height: 8),
        content,
      ],
    );
  }
}
