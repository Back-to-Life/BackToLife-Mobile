import 'package:flutter/material.dart';

class TextThemeLight {
  static TextThemeLight _instace;
  static TextThemeLight get instance {
    _instace ??= TextThemeLight._init();
    return _instace;
  }

  TextThemeLight._init();

  final TextStyle headline1 =
      TextStyle(fontSize: 96, fontWeight: FontWeight.w300, letterSpacing: -1.5);
  final TextStyle headline2 =
      TextStyle(fontSize: 96, fontWeight: FontWeight.w300, letterSpacing: -1.5);
  final TextStyle headline3 =
      TextStyle(fontSize: 96, fontWeight: FontWeight.w300, letterSpacing: -1.5);
  final TextStyle headline4 =
      TextStyle(fontSize: 96, fontWeight: FontWeight.w300, letterSpacing: -1.5);
}
