import 'package:flutter/material.dart';

extension StringExtension on String {
  double measureTextHeight(
    TextStyle style,
    BuildContext context,
  ) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: this,
        style: style,
      ),
      textScaleFactor: MediaQuery.of(context).textScaleFactor,
      textDirection: Directionality.of(context),
    )..layout(minWidth: 0, maxWidth: MediaQuery.of(context).size.width);
    return textPainter.height;
  }
}
