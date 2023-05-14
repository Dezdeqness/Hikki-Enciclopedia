import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:hikki_enciclopedia/generated/l10n.dart';
import 'package:hikki_enciclopedia/presentation/app.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
          ),
        ),
      ),
      home: const App(),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.delegate.supportedLocales,
    ),
  );
}
