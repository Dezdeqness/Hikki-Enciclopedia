import 'package:flutter/material.dart';
import 'package:hikki_ui_kit/hikki_ui_kit.dart';

extension HikkiThemeExtension on BuildContext {
  HikkiTextTheme get textTheme => HikkiTextTheme.of(this);

  HikkiColors get colors => Theme.of(this).extension<HikkiColors>()!;
}
