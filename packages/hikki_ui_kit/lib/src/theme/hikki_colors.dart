import 'package:flutter/material.dart';

class HikkiColors extends ThemeExtension<HikkiColors> {
  final Color primaryLight;
  final Color secondary;
  final Color primaryDark500;
  final Color neutral;

  const HikkiColors({
    this.primaryLight = const Color(0xFFECEFF1),
    this.secondary = const Color(0xFF000000),
    this.primaryDark500 = const Color(0xFF9E9E9E),
    this.neutral = const Color(0xFFFFFFFF),
  });

  @override
  HikkiColors lerp(ThemeExtension<HikkiColors>? other, double t) {
    if (other is! HikkiColors) return this;
    return HikkiColors(
      primaryLight: Color.lerp(primaryLight, other.primaryLight, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      primaryDark500: Color.lerp(primaryDark500, other.primaryDark500, t)!,
      neutral: Color.lerp(neutral, other.neutral, t)!,
    );
  }

  @override
  HikkiColors copyWith({
    Color? primaryLight,
    Color? secondary,
    Color? primaryDark500,
    Color? neutral,
  }) {
    return HikkiColors(
      primaryLight: primaryLight ?? this.primaryLight,
      secondary: secondary ?? this.secondary,
      primaryDark500: primaryDark500 ?? this.primaryDark500,
      neutral: neutral ?? this.neutral,
    );
  }
}
