import 'package:flutter/material.dart';

import 'cell_header.dart';

class ContainerHeader extends StatelessWidget {
  final String header;
  final Widget content;

  const ContainerHeader({
    required this.header,
    required this.content,
    super.key,
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
      mainAxisSize: MainAxisSize.min,
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
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        AppLocalizations.of(context).seeAll,
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
