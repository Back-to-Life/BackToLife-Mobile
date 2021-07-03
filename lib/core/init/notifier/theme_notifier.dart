import '../../constants/enum/locale_keys_enum.dart';
import '../cache/locale_manager.dart';

import '../theme/dark/app_theme_dark.dart';

import '../../constants/enum/app_theme_enum.dart';
import '../theme/app_theme_light.dart';
import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = AppThemeLight.instance.theme;
  ThemeData get currentTheme => _currentTheme;

  bool isLight = true;
  bool isDark = false;

  ThemeNotifier() {
    var isLocaleCheck =
        LocaleManager.instance.getThemeManager(PreferencesKeys.THEME);
    if (isLocaleCheck) {
      _currentTheme = AppThemeLight.instance.theme;
      isLight = true;
      isDark = false;
    } else {
      _currentTheme = AppThemeDark.instance.theme;
      isLight = false;
      isDark = true;
    }
    notifyListeners();
  }

  void changeValue(AppThemes theme) {
    if (theme == AppThemes.LIGHT) {
      _currentTheme = AppThemeLight.instance.theme;
      isLight = true;
      isDark = false;
      LocaleManager.instance.setThemeManager(PreferencesKeys.THEME, true);
    } else if (theme == AppThemes.DARK) {
      _currentTheme = AppThemeDark.instance.theme;
      isLight = false;
      isDark = true;
      LocaleManager.instance.setThemeManager(PreferencesKeys.THEME, false);
    }
    notifyListeners();
  }
}
