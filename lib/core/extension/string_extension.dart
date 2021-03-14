import 'package:backtolife/core/constants/app/app_constants.dart';
import 'package:easy_localization/easy_localization.dart';

extension StringLocalization on String {
  String get locale => this.tr();

  String get isValidEmail =>
      this.contains(RegExp(ApplicationConstants.EMAIL_REGIEX))
          ? null
          : "Email does not valid";
}
