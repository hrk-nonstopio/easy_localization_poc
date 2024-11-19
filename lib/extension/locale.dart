import 'package:flutter/material.dart';

extension LocaleExt on Locale {
  static const Locale en = Locale('en');
  static const Locale hi = Locale('hi');
  static const Locale mr = Locale('mr');
  static const Locale enUS = Locale('en', 'US');

  static Set<Locale> getSupportedLocales() {
    return {
      en,
      hi,
      mr,
      enUS,
    };
  }

  static Set<Locale> getLocalesBundledLocally() {
    return {
      en,
    };
  }
}
