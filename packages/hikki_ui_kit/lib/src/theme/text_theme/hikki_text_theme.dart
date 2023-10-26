import 'package:flutter/material.dart';

class HikkiTextTheme {
  final TextStyle d1;
  final TextStyle d2;
  final TextStyle h1;
  final TextStyle h2;
  final TextStyle c1;
  final TextStyle c2;

  HikkiTextTheme({
    required this.d1,
    required this.d2,
    required this.h1,
    required this.h2,
    required this.c1,
    required this.c2,
  });

  static HikkiTextTheme of(BuildContext context) {
    return _HikkiThemeInheritedWidget.of(context).textTheme;
  }

  factory HikkiTextTheme.defaultTheme() {

    const TextStyle d1 = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 18,
    );

    const TextStyle d2 = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16,
    );

    const TextStyle h1 = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14,
    );

    const TextStyle h2 = TextStyle(
      fontSize: 14,
    );

    const TextStyle c1 = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 12,
      letterSpacing: 1.1,
    );

    const TextStyle c2 = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 12,
      letterSpacing: 1.1,
    );

    return HikkiTextTheme(
      d1: d1,
      d2: d2,
      h1: h1,
      h2: h2,
      c1: c1,
      c2: c2,
    );
  }
}

class _HikkiThemeInheritedWidget extends InheritedWidget {
  const _HikkiThemeInheritedWidget({
    required this.textTheme,
    required super.child,
  });

  final HikkiTextTheme textTheme;

  static _HikkiThemeInheritedWidget of(BuildContext context) {
    final _HikkiThemeInheritedWidget? result = context
        .dependOnInheritedWidgetOfExactType<_HikkiThemeInheritedWidget>();
    assert(result != null, 'No ThemeWidget found in context');

    return result!;
  }

  @override
  bool updateShouldNotify(_HikkiThemeInheritedWidget old) {
    return old.textTheme != textTheme;
  }
}

class HikkiThemeProvider extends StatelessWidget {
  final WidgetBuilder builder;

  const HikkiThemeProvider({
    required this.builder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _HikkiThemeInheritedWidget(
      textTheme: HikkiTextTheme.defaultTheme(),
      child: Builder(builder: builder),
    );
  }
}
