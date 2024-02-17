import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/services.dart';

import 'package:shared_preferences/shared_preferences.dart';

///
/// Preferences related
///
const String _storageKey = 'MyApplication_';
const List<String> _supportedLanguages = <String>['en', 'tr'];
const Map<String, String> _codeAndLanguage = <String, String>{
  'en': 'English',
  'tr': 'Türkçe',
};
const Map<String, Map<String, String>> _codeAndLanguageFlag =
    <String, Map<String, String>>{
  'en': <String, String>{'English': '🏴󠁧󠁢󠁥󠁮󠁧󠁿'},
  'tr': <String, String>{
    'Türkçe': '🇹🇷',
  }
};
Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class GlobalTranslations {
  factory GlobalTranslations() {
    return _translations;
  }
  GlobalTranslations._internal();
  Locale? _locale;
  Map<dynamic, dynamic>? _localizedValues;
  VoidCallback? _onLocaleChangedCallback;

  ///
  /// Returns the list of supported Locales
  ///
  Map<String, String> supportedLocalesAndLanguagesMap() => _codeAndLanguage;
  Map<String, Map<String, String>> supportedLocalesAndLanguagesFlagMap() =>
      _codeAndLanguageFlag;
  List<String> supportedLanguages() => _supportedLanguages;

  ///
  /// Returns the list of supported Locales
  ///
  Iterable<Locale> supportedLocales() =>
      _supportedLanguages.map<Locale>((String lang) => Locale(lang, ''));

  ///
  /// Returns the translation that corresponds to the [key]
  ///
  String? text(String key) {
    // Return the requested string
    return (_localizedValues == null || _localizedValues![key] == null)
        ? '** $key not found'
        : _localizedValues![key] as String?;
  }

  ///
  /// Returns the current language code
  ///
  String get currentLanguage => _locale == null ? 'en' : _locale!.languageCode;

  ///
  /// Returns the current Locale
  ///
  Locale? get locale => _locale;

  ///
  /// One-time initialization
  ///
  Future<void> init([String? language]) async {
    if (_locale == null) {
      await setNewLanguage(language);
    }
  }

  /// ----------------------------------------------------------
  /// Method that saves/restores the preferred language
  /// ----------------------------------------------------------
  Future<String> getPreferredLanguage() async {
    return _getApplicationSavedInformation('language');
  }

  Future<Future<bool>> setPreferredLanguage(String lang) async {
    return _setApplicationSavedInformation('language', lang);
  }

  ///
  /// Routine to change the language
  ///
  Future<void>? setNewLanguage(
      [String? newLanguage, bool saveInPrefs = false]) async {
    String? language = newLanguage;
    language ??= await getPreferredLanguage();
    // Set the locale
    if (language == '') {
      language = 'en';
    }
    _locale = Locale(language, '');

    // Load the language strings
    final String jsonContent = await rootBundle
        .loadString('locale/i18n_${_locale!.languageCode}.json');
    _localizedValues = json.decode(jsonContent) as Map<String, dynamic>?;

    // If we are asked to save the new language in the application preferences
    if (saveInPrefs) {
      await setPreferredLanguage(language);
    }

    // If there is a callback to invoke to notify that a language has changed
    if (_onLocaleChangedCallback != null) {
      _onLocaleChangedCallback!();
    }
  }

  ///
  /// Callback to be invoked when the user changes the language
  ///
  // ignore: avoid_setters_without_getters
  set onLocaleChangedCallback(VoidCallback callback) {
    _onLocaleChangedCallback = callback;
  }

  ///
  /// Application Preferences related
  ///
  /// ----------------------------------------------------------
  /// Generic routine to fetch an application preference
  /// ----------------------------------------------------------
  Future<String> _getApplicationSavedInformation(String name) async {
    final SharedPreferences prefs = await _prefs;

    return prefs.getString(_storageKey + name) ?? '';
  }

  /// ----------------------------------------------------------
  /// Generic routine to saves an application preference
  /// ----------------------------------------------------------
  Future<bool> _setApplicationSavedInformation(
      String name, String value) async {
    final SharedPreferences prefs = await _prefs;

    return prefs.setString(_storageKey + name, value);
  }

  ///
  /// Singleton Factory
  ///
  static final GlobalTranslations _translations =
      GlobalTranslations._internal();
}

GlobalTranslations allTranslations = GlobalTranslations();
