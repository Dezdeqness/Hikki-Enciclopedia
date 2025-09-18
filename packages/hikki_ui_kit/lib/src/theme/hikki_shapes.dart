import 'package:flutter/material.dart';

@immutable
class HikkiShapes extends ThemeExtension<HikkiShapes> {
  final BorderRadius extraSmall;
  final BorderRadius small;
  final BorderRadius medium;
  final BorderRadius large;
  final BorderRadius extraLarge;
  final BorderRadius full;

  const HikkiShapes({
    required this.extraSmall,
    required this.small,
    required this.medium,
    required this.large,
    required this.extraLarge,
    required this.full,
  });

  @override
  HikkiShapes copyWith({
    BorderRadius? extraSmall,
    BorderRadius? small,
    BorderRadius? medium,
    BorderRadius? large,
    BorderRadius? extraLarge,
    BorderRadius? full,
  }) {
    return HikkiShapes(
      extraSmall: extraSmall ?? this.extraSmall,
      small: small ?? this.small,
      medium: medium ?? this.medium,
      large: large ?? this.large,
      extraLarge: extraLarge ?? this.extraLarge,
      full: full ?? this.full,
    );
  }

  @override
  HikkiShapes lerp(ThemeExtension<HikkiShapes>? other, double t) {
    if (other is! HikkiShapes) return this;
    return HikkiShapes(
      extraSmall: BorderRadius.lerp(extraSmall, other.extraSmall, t)!,
      small: BorderRadius.lerp(small, other.small, t)!,
      medium: BorderRadius.lerp(medium, other.medium, t)!,
      large: BorderRadius.lerp(large, other.large, t)!,
      extraLarge: BorderRadius.lerp(extraLarge, other.extraLarge, t)!,
      full: BorderRadius.lerp(full, other.full, t)!,
    );
  }
}
