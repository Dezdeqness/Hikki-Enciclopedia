import 'package:flutter/material.dart';
import 'package:hikki_localization/hikki_localization.dart';
import 'package:hikki_ui_kit/hikki_ui_kit.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'main.directories.g.dart';

Future<void> main() async {
  await EasyLocalization.ensureInitialized();
  runApp(WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return HikkiLocalizationWrapper(
      child: HikkiThemeProvider(
        builder: (context) {
          return Widgetbook(
            appBuilder: (context, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  extensions: [
                    HikkiColors(),
                  ],
                ),
                home: child,
              );
            },
            directories: directories,
            addons: [
              MaterialThemeAddon(
                themes: [
                  WidgetbookTheme(name: 'Light', data: ThemeData.light()),
                  WidgetbookTheme(name: 'Dark', data: ThemeData.dark()),
                ],
              ),
              AlignmentAddon(),
              ViewportAddon([Viewports.none, IosViewports.iPhone13]),
            ],
          );
        },
      )
    );
  }
}
