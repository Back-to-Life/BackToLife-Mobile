import '../../constants/app/app_constants.dart';

import 'app_theme.dart';
import 'package:flutter/material.dart';

class AppThemeDark extends AppTheme {
  static AppThemeDark? _instance;
  static AppThemeDark get instance {
    _instance ??= AppThemeDark._init();

    return _instance!;
  }

  AppThemeDark._init();

  //burda themedata koyup doldurmamız gerek

  @override
  ThemeData get theme => ThemeData(
      scaffoldBackgroundColor: Color(0xFF4E5F49),
      colorScheme: _appColorScheme(),
      fontFamily: ApplicationConstants.FONT_FAMILY,
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 0,
          backgroundColor: Colors.transparent)
      // textTheme: TextTheme(headline1: textThemeLight.headline1,
      );
  ColorScheme _appColorScheme() {
    return ColorScheme(
      primary: Color(0xFF4E5F49),
      onSecondary: Colors.black,
      primaryVariant: Colors.white.withOpacity(0.3),
      secondaryVariant: Colors.white,
      onBackground: Colors.white,
      error: Colors.red,
      surface: Colors.white,
      onSurface: Colors.yellow,
      onPrimary: Colors.yellow,
      background: Colors.blue,
      brightness: Brightness.light,
      secondary: Colors.black12,
      onError: Colors.redAccent,
    );
  }
}
