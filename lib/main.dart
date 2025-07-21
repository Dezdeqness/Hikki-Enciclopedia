import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hikki_enciclopedia/core/providers/locale_provider.dart';

import 'package:hikki_enciclopedia/presentation/app.dart';
import 'package:hikki_localization/hikki_localization.dart';
import 'package:hikki_ui_kit/hikki_ui_kit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/providers/providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await dotenv.load(fileName: ".env");
  } catch (e) {
    throw Exception('Error loading .env file: $e');
  }
  await EasyLocalization.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  runApp(
    HikkiLocalizationWrapper(
      child: HikkiThemeProvider(
        builder: (BuildContext context) => ProviderScope(
          overrides: [
            sharedPreferencesProvider.overrideWithValue(prefs),
            localeProvider.overrideWith((ref) => context.locale.toLanguageTag())
          ],
          child: const App(),
        ),
      ),
    ),
  );
}
