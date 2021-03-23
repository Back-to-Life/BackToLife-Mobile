import '../constants/app/app_constants.dart';
import 'package:easy_localization/easy_localization.dart';

extension StringLocalization on String {
  String get locale => this.tr();

  String get isValidEmail => this.contains(
          RegExp(ApplicationConstants.EMAIL_REGIEX, caseSensitive: false))
      ? null
      : "Email does not valid";
}

extension ImagePathExtension on String {
  String get toSVG => 'asset/svg/$this.svg';
}

extension LottieExtension on String {
  String get toLottie => 'asset/lottie/$this.json';
}
