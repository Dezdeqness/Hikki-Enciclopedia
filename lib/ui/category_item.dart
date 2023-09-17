import 'package:flutter/material.dart';
import 'package:hikki_ui_kit/hikki_ui_kit.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final IconData icon;

  const CategoryItem({
    required this.title,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 0,
        color: AppColors.cardBackground,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: Colors.black,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.start,
                      style: AppStyles.categoryItemText,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
