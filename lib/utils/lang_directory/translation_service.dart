import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ar.dart';
import 'cn.dart';
import 'de.dart';
import 'en.dart';
import 'es.dart';
import 'fr.dart';
import 'it.dart';
import 'ja.dart';
import 'ko.dart';
import 'nl.dart';
import 'ru.dart';
import 'ur.dart';

class TranslationService extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static const fallbackLocale = Locale('en', 'US');

  // Supported languages
  // Needs to be same order with locales
  static final langs = [
    'English',
  ];

  // Supported locales
  // Needs to be same order with langs
  static final locales = [
    const Locale('en', 'US'),
  ];

  @override
  Map<String, Map<String, String>> get keys => {
    'en': en,
    'ar': ar,
    'cn': cn,
    'de': de,
    'es': es,
    'fr': fr,
    'it': it,
    'ja': ja,
    'ko': ko,
    'nl': nl,
    'ru': ru,
    'ur': ur,
  };

  // Gets locale from language, and updates the locale
  void changeLocale(String lang) {
    //final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(Locale(lang));
  }

// Finds language in `langs` list and returns it as Locale
/*Locale? _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale;
  }*/
}