import 'dart:ui';

class Locales {
  static const List<Locale> supportedLocales = [
    Locale('de'),
    Locale('en'),
  ];
  static const String path = 'assets/translations';
  static const Locale fallback = Locale("de");
}
