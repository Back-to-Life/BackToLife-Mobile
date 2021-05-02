import '../../../core/extension/string_extension.dart';

class SVGImagePaths {
  static SVGImagePaths? _instace;
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
  final scanBarcode = 'scanbarcode'.toSVG;
  final profile = 'profile'.toSVG;
  final heroes = 'heroes'.toSVG;
  final settings = 'settings'.toSVG;
  final pencil = 'pencil'.toSVG;
  final konfeti = 'konfeti'.toSVG;
  final settingsHeader = 'settingsheader'.toSVG;
  final accountSettings = 'account'.toSVG;
  final languagesettings = 'languagesettings'.toSVG;
  final notificationsettings = 'notificationsettings'.toSVG;
  final permissionssettings = 'permissionssettings'.toSVG;
  final themesettings = 'themesettings'.toSVG;
  final aboutsettings = 'aboutsettings'.toSVG;
  final logoutsettings = 'logoutsettings'.toSVG;
  final englishSettingsLanguage = 'englishlanguage'.toSVG;
  final turkishSettingsLanguage = 'turkishlanguage'.toSVG;
  final selectedLanguage = 'selectedlanguage'.toSVG;
}
