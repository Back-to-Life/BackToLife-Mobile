import '../../constants/app/app_constants.dart';

import 'app_theme.dart';
import 'package:flutter/material.dart';

import 'light/light_theme_interface.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    _instance ??= AppThemeLight._init();

    return _instance!;
  }

  AppThemeLight._init();

  //burda themedata koyup doldurmamız gerek

  @override
  ThemeData get theme => ThemeData(
      scaffoldBackgroundColor: Color(0xffFCFCEC),
      colorScheme: _appColorScheme(),
      fontFamily: ApplicationConstants.FONT_FAMILY,
      appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.transparent)
      // textTheme: TextTheme(headline1: textThemeLight.headline1,
      );
  ColorScheme _appColorScheme() {
    return ColorScheme(
      primary: Color(0xffFCFCEC),
      onSecondary: colorSchemeLight.kSecendoryLight,
      primaryVariant: Color(0xFF72A863), //container glassmorpihsm for
      secondaryVariant: colorSchemeLight.purpleLight,
      onBackground: colorSchemeLight.greyOnboard,
      error: Colors.red,
      surface: Color(0xff578B49), //yeşil yazı
      onSurface: colorSchemeLight.grey,
      onPrimary: colorSchemeLight.buttonOnboard,
      background: Color(0xFF72A863),
      brightness: Brightness.light,
      secondary: Color(0xFF4E5F49),
      onError: colorSchemeLight.darkGreen,
    );
  }
}
