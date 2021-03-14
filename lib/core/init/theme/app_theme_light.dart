import 'package:backtolife/core/constants/app/app_constants.dart';

import 'app_theme.dart';
import 'package:flutter/material.dart';

import 'light/light_theme_interface.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  static AppThemeLight _instance;
  static AppThemeLight get instance {
    if (_instance == null) {
      _instance = AppThemeLight._init();
    }
    return _instance;
  }

  AppThemeLight._init();

  //burda themedata koyup doldurmamız gerek

  ThemeData get theme => ThemeData(
      colorScheme: _appColorScheme(),
      fontFamily: ApplicationConstants.FONT_FAMILY,
      textTheme: TextTheme(headline1: textThemeLight.headline1));

  ColorScheme _appColorScheme() {
    return ColorScheme(
      primary: colorSchemeLight.black,
      onSecondary: colorSchemeLight.brown,
      primaryVariant: Colors.green,
      secondaryVariant: Colors.amberAccent,
      onBackground: Colors.blueAccent,
      error: Colors.red,
      surface: Colors.yellow,
      onSurface: Colors.yellowAccent,
      onPrimary: Colors.grey,
      background: Colors.blue,
      brightness: Brightness.light,
      secondary: Colors.black12,
      onError: Colors.redAccent,
    );
  }
}
