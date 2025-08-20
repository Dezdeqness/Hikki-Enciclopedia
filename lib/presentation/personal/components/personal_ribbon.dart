import 'package:flutter/material.dart';
import 'package:hikki_enciclopedia/domain/model/personal_list_type.dart';

class PersonalRibbon extends StatelessWidget {
  final PersonalListType selected;
  final ValueChanged<PersonalListType> onChanged;

  const PersonalRibbon({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: PersonalListType.values.map((type) {
          final isSelected = type == selected;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: isSelected
                    ? const LinearGradient(
                  colors: [
                    Color(0xFFB2DFDB),
                    Color(0xFFE0F7FA),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                )
                    : null,
                color: isSelected
                    ? null
                    : Theme.of(context).colorScheme.surface,
                border: Border.all(
                  color: isSelected
                      ? Colors.transparent
                      : Theme.of(context).dividerColor,
                  width: 1,
                ),
                boxShadow: isSelected
                    ? [
                  BoxShadow(
                    color: Colors.teal.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ]
                    : [],
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () => onChanged(type),
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                  child: Text(
                    type.name.toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: isSelected
                          ? Colors.teal.shade900
                          : Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
