import 'package:flutter/foundation.dart';
import 'package:material_ui/material_ui.dart';

/// In-memory settings for the foundation phase; persistence can be injected later.
class AppSettingsController extends ChangeNotifier {
  Locale _locale = const Locale('ar');
  ThemeMode _themeMode = ThemeMode.system;

  Locale get locale => _locale;
  ThemeMode get themeMode => _themeMode;

  void setLocale(Locale locale) {
    if (locale.languageCode != 'ar' && locale.languageCode != 'en') return;
    if (_locale == locale) return;
    _locale = locale;
    notifyListeners();
  }

  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.dark
        ? ThemeMode.light
        : ThemeMode.dark;
    notifyListeners();
  }
}
