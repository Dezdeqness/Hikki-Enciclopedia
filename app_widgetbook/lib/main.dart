import 'package:flutter/material.dart';
import 'package:hikki_localization/hikki_localization.dart';
import 'package:hikki_ui_kit/hikki_ui_kit.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import 'main.directories.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return HikkiLocalizationWrapper(
      child: Widgetbook(
        appBuilder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              extensions: [hikkiColorsLight, hikkiShapes, hikkiTextStyles],
            ),
            home: child,
          );
        },
        directories: directories,
        addons: [
          MaterialThemeAddon(
            themes: [
              WidgetbookTheme(
                name: 'Light',
                data: ThemeData(
                  extensions: [hikkiColorsLight, hikkiShapes, hikkiTextStyles],
                ),
              ),
              WidgetbookTheme(
                name: 'Dark',
                data: ThemeData(
                  extensions: [hikkiColorsDark, hikkiShapes, hikkiTextStyles],
                ),
              ),
            ],
          ),
          InspectorAddon(),
          AlignmentAddon(),
          ViewportAddon([Viewports.none, IosViewports.iPhone13]),
        ],
      ),
    );
  }
}
