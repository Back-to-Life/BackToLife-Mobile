import '../../constants/app/app_constants.dart';

import 'app_theme.dart';
import 'package:flutter/material.dart';

class AppThemeDark extends AppTheme {
  static AppThemeDark? _instance;
  static AppThemeDark? get instance {
    _instance ??= AppThemeDark._init();

    return _instance;
  }

  AppThemeDark._init();

  //burda themedata koyup doldurmamız gerek

  @override
  ThemeData get theme => ThemeData(
        scaffoldBackgroundColor: Colors.red,
        colorScheme: _appColorScheme(),
        fontFamily: ApplicationConstants.FONT_FAMILY,
        // textTheme: TextTheme(headline1: textThemeLight.headline1,
      );
  ColorScheme _appColorScheme() {
    return ColorScheme(
      primary: Colors.red,
      onSecondary: Colors.black,
      primaryVariant: Colors.white,
      secondaryVariant: Colors.white24,
      onBackground: Colors.yellow,
      error: Colors.red,
      surface: Colors.yellow,
      onSurface: Colors.yellow,
      onPrimary: Colors.yellow,
      background: Colors.blue,
      brightness: Brightness.light,
      secondary: Colors.black12,
      onError: Colors.redAccent,
    );
  }
}
