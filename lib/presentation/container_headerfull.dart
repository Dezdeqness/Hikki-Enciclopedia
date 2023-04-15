import 'package:flutter/material.dart';

import 'package:hikki_enciclopedia/theme/colors.dart';
import 'package:hikki_enciclopedia/theme/styles.dart';

import 'cell_header.dart';

class ContainerHeaderFull extends StatelessWidget {
  final String header;
  final Widget content;
  final bool isActionPresent;

  const ContainerHeaderFull({
    super.key,
    required this.header,
    required this.content,
    this.isActionPresent = false,
  });

  @override
  Widget build(BuildContext context) {
    final double contentMargin;
    if (isActionPresent) {
      contentMargin = 2.0;
    } else {
      contentMargin = 8.0;
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Expanded(child: CellHeader(header: header)),
              Visibility(
                visible: isActionPresent,
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: AppColors.cardBackground,
                  elevation: 0,
                  child: InkWell(
                    onTap: () {},
                    child: const Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Text(
                        'See All',
                        style: AppStyles.headerActionButton,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: contentMargin),
        content,
      ],
    );
  }
}
