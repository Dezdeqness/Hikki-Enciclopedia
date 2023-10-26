import 'package:flutter/material.dart';

class HikkiColors extends ThemeExtension<HikkiColors> {
  Color get primaryLight => const Color(0xFFECEFF1);

  Color get primaryDark => const Color(0xFF000000);

  Color get primaryDark500 => const Color(0xFF9E9E9E);

  Color get neutral => const Color(0xFFFFFFFF);


  @override
  ThemeExtension<HikkiColors> lerp(
      covariant ThemeExtension<HikkiColors>? other, double t) {
    if (other is! HikkiColors) {
      return this;
    }

    return other;
  }

  @override
  ThemeExtension<HikkiColors> copyWith() => HikkiColors();
}

