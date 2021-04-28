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
      scaffoldBackgroundColor: colorSchemeLight.kPrimaryLight,
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
      primary: colorSchemeLight.kPrimaryLight,
      onSecondary: colorSchemeLight.kSecendoryLight,
      primaryVariant: colorSchemeLight.kThirdLight,
      secondaryVariant: colorSchemeLight.purpleLight,
      onBackground: colorSchemeLight.greyOnboard,
      error: Colors.red,
      surface: colorSchemeLight.whiteText, //beyaz
      onSurface: colorSchemeLight.grey,
      onPrimary: colorSchemeLight.buttonOnboard,
      background: Colors.blue,
      brightness: Brightness.light,
      secondary: colorSchemeLight.starColor,
      onError: colorSchemeLight.darkGreen,
    );
  }
}
