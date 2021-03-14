import 'package:flutter/widgets.dart';

class ColorSchemeLight {
  static ColorSchemeLight _instace;
  static ColorSchemeLight get instance {
    if (_instace == null) _instace = ColorSchemeLight._init();
    return _instace;
  }

  ColorSchemeLight._init();

  final Color brown = Color(0xffa87e6f);
  final Color red = Color(0xFFE25C2B);
  final Color white = Color(0xFFFFFFFF);
  final Color lightGrey = Color(0xFFA72D2D);
  final Color black = Color(0xFF000000);
}
