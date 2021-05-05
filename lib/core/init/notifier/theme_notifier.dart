import '../theme/app_theme_dark.dart';

import '../../constants/enum/app_theme_enum.dart';
import '../theme/app_theme_light.dart';
import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = AppThemeLight.instance.theme;
  ThemeData get currentTheme => _currentTheme;

  bool isLight = true;
  bool isDark = false;

  void changeValue(AppThemes theme) {
    if (theme == AppThemes.LIGHT) {
      _currentTheme = AppThemeLight.instance.theme;

      isLight = true;
      isDark = false;
    } else if (theme == AppThemes.DARK) {
      _currentTheme = AppThemeDark.instance.theme;
      isLight = false;
      isDark = true;
    }
    notifyListeners();
  }
}
