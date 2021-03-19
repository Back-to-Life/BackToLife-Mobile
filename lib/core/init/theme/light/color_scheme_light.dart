import 'package:flutter/widgets.dart';

class ColorSchemeLight {
  static ColorSchemeLight _instace;
  static ColorSchemeLight get instance {
    if (_instace == null) _instace = ColorSchemeLight._init();
    return _instace;
  }

  ColorSchemeLight._init();

  final Color kPrimaryLight = Color(0xffFCFCEC);
  final Color kSecendoryLight = Color(0xFFD0E07A);
  final Color kThirdLight = Color(0xFF72A863).withOpacity(0.7);
  final Color lightGrey = Color(0xFFA72D2D);
  final Color black = Color(0xFF000000);
  final Color grey = Color(0xFFD3D0D0);
  final Color purpleLight = Color(0xFFC4C0FF);
  final Color whiteText = Color(0xFFFFFFFF);
  final Color greyOnboard = Color(0xFF464343);
  final Color buttonOnboard = Color(0xFFD0E07A);
}
