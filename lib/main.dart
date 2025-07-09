import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:hikki_enciclopedia/presentation/app.dart';
import 'package:hikki_localization/hikki_localization.dart';
import 'package:hikki_ui_kit/hikki_ui_kit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(ProviderScope(
      child: HikkiLocalizationWrapper(
          child: HikkiThemeProvider(
              builder: (BuildContext context) => const App()
          )
      )
  ));
}
