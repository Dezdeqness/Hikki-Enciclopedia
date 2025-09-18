import 'package:flutter/material.dart';
import 'package:hikki_ui_kit/hikki_ui_kit.dart';
import 'package:hikki_ui_kit/src/theme/hikki_shapes.dart';

const appShapes = HikkiShapes(
  extraSmall: BorderRadius.all(Radius.circular(4)),
  small: BorderRadius.all(Radius.circular(8)),
  medium: BorderRadius.all(Radius.circular(16)),
  large: BorderRadius.all(Radius.circular(24)),
  extraLarge: BorderRadius.all(Radius.circular(32)),
  full: BorderRadius.all(Radius.circular(1000)),
);

const appTextStyles = HikkiText(
  displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
  displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
  displaySmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
  headlineLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
  headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
  headlineSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
  titleLarge: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
  titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
  titleSmall: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
  bodyLarge: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
  bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
  bodySmall: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
  labelLarge:
      TextStyle(fontSize: 13, fontWeight: FontWeight.w600, letterSpacing: 0.1),
  labelMedium:
      TextStyle(fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 0.5),
  labelSmall:
      TextStyle(fontSize: 11, fontWeight: FontWeight.w400, letterSpacing: 0.5),
);

const hikkiColorsLight = HikkiColors(
  primary: Color(0xFF3A7CA5),
  secondary: Color(0xFF5584AC),
  tertiary: Color(0xFF87A8D0),
  accent: Color(0xFF4A90E2),
  brand: Color(0xFF3A7CA5),
  background: Color(0xFFE6F0FA),
  surface: Color(0xFFFFFFFF),
  surfaceVariant: Color(0xFFF0F4F9),
  divider: Color(0xFFC7D3E3),
  textPrimary: Color(0xFF1E2A3A),
  textSecondary: Color(0xFF4A5A70),
  textDisabled: Color(0xFF9BA9BF),
  textInverse: Color(0xFFFFFFFF),
  success: Color(0xFF4CAF50),
  warning: Color(0xFFFFC107),
  error: Color(0xFFF44336),
  info: Color(0xFF2196F3),
  white: Color(0xFFFFFFFF),
  black: Color(0xFF000000),
);

const hikkiColorsDark = HikkiColors(
  primary: Color(0xFF4A90E2),
  secondary: Color(0xFF3A7CA5),
  tertiary: Color(0xFF2C3E55),
  accent: Color(0xFF5DADE2),
  brand: Color(0xFF4A90E2),
  background: Color(0xFF0F1824),
  surface: Color(0xFF1C2736),
  surfaceVariant: Color(0xFF283445),
  divider: Color(0xFF3C4A5C),
  textPrimary: Color(0xFFE6EEF7),
  textSecondary: Color(0xFFAAB8C8),
  textDisabled: Color(0xFF6C7A8D),
  textInverse: Color(0xFF000000),
  success: Color(0xFF66BB6A),
  warning: Color(0xFFFFCA28),
  error: Color(0xFFEF5350),
  info: Color(0xFF42A5F5),
  white: Color(0xFFFFFFFF),
  black: Color(0xFF000000),
);
