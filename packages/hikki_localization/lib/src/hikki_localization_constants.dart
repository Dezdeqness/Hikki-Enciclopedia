import 'dart:ui';

abstract class NvcuLocalizationConsts {
  static const localizationPath = 'packages/hikki_localization/assets/l10n';
  static const englishLocaleCode = 'en';
  static const russianLocaleCode = 'ru';
  static const ukrainianLocaleCode = 'ek';
  static const englishLocale = Locale(englishLocaleCode);
  static const russianLocale = Locale(russianLocaleCode);
  static const ukrainianLocale = Locale(ukrainianLocaleCode);
  static const supportedLocale = [
    englishLocale,
    russianLocale,
    ukrainianLocale,
  ];
}
