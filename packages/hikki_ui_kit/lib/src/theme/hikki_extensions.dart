import 'package:flutter/material.dart';
import 'package:hikki_ui_kit/hikki_ui_kit.dart';

extension HikkiThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  HikkiText get text => theme.extension<HikkiText>()!;
  HikkiShapes get shapes => theme.extension<HikkiShapes>()!;
  HikkiColors get colors => Theme.of(this).extension<HikkiColors>()!;
}
