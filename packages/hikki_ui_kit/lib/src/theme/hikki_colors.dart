import 'package:flutter/material.dart';

@immutable
class HikkiColors extends ThemeExtension<HikkiColors> {
  final Color primary;
  final Color secondary;
  final Color tertiary;
  final Color accent;
  final Color brand;

  final Color background;
  final Color surface;
  final Color surfaceVariant;
  final Color divider;

  final Color textPrimary;
  final Color textSecondary;
  final Color textDisabled;
  final Color textInverse;

  final Color success;
  final Color warning;
  final Color error;
  final Color info;

  final Color white;
  final Color black;

  const HikkiColors({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.accent,
    required this.brand,

    required this.background,
    required this.surface,
    required this.surfaceVariant,
    required this.divider,

    required this.textPrimary,
    required this.textSecondary,
    required this.textDisabled,
    required this.textInverse,

    required this.success,
    required this.warning,
    required this.error,
    required this.info,

    required this.white,
    required this.black,
  });

  @override
  HikkiColors copyWith({
    Color? primary,
    Color? secondary,
    Color? tertiary,
    Color? accent,
    Color? brand,
    Color? background,
    Color? surface,
    Color? surfaceVariant,
    Color? divider,
    Color? textPrimary,
    Color? textSecondary,
    Color? textDisabled,
    Color? textInverse,
    Color? success,
    Color? warning,
    Color? error,
    Color? info,
    Color? white,
    Color? black,
  }) {
    return HikkiColors(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      tertiary: tertiary ?? this.tertiary,
      accent: accent ?? this.accent,
      brand: brand ?? this.brand,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surfaceVariant: surfaceVariant ?? this.surfaceVariant,
      divider: divider ?? this.divider,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textDisabled: textDisabled ?? this.textDisabled,
      textInverse: textInverse ?? this.textInverse,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      error: error ?? this.error,
      info: info ?? this.info,
      white: white ?? this.white,
      black: black ?? this.black,
    );
  }

  @override
  HikkiColors lerp(ThemeExtension<HikkiColors>? other, double t) {
    if (other is! HikkiColors) return this;
    return HikkiColors(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      tertiary: Color.lerp(tertiary, other.tertiary, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      brand: Color.lerp(brand, other.brand, t)!,
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceVariant: Color.lerp(surfaceVariant, other.surfaceVariant, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textDisabled: Color.lerp(textDisabled, other.textDisabled, t)!,
      textInverse: Color.lerp(textInverse, other.textInverse, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      error: Color.lerp(error, other.error, t)!,
      info: Color.lerp(info, other.info, t)!,
      white: Color.lerp(white, other.white, t)!,
      black: Color.lerp(black, other.black, t)!,
    );
  }
}
