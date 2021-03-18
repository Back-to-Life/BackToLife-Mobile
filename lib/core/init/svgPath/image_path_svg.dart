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
  final arrowRight = 'arrow-right'.toSVG;
}
