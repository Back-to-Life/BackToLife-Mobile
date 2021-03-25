import '../../../core/extension/string_extension.dart';

class SVGImagePaths {
  static SVGImagePaths _instace;
  static SVGImagePaths get instance {
    return _instace ??= SVGImagePaths._init();
  }

  SVGImagePaths._init();

  final onboarding1 = 'onboarding1'.toSVG;
  final onboarding2 = 'onboarding2'.toSVG;
  final onboarding3 = 'onboarding3'.toSVG;
  final arrowRight = 'arrowRight'.toSVG;
  final arrowRightLogin = 'arrowRightLogin'.toSVG;
  final facebookIcon = 'facebook'.toSVG;
  final googleIcon = 'google'.toSVG;
  final loginpage = 'loginpage'.toSVG;
  final world = 'world'.toSVG;
  final changedBack = 'changedBack'.toSVG;
}
