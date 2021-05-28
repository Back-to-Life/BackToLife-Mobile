import '../../constants/enum/locale_keys_enum.dart';
import '../cache/locale_manager.dart';
import 'package:flutter/cupertino.dart';

class SettingsNotifier extends ChangeNotifier {
  bool isPushNotifcation = false;

  SettingsNotifier() {
    var isLocaleCheck = LocaleManager.instance
        .getPushNotifation(PreferencesKeys.PUSHNOTIFICATION);
    if (isLocaleCheck) {
      isPushNotifcation = true;
    } else {
      isPushNotifcation = false;
    }
    notifyListeners();
  }

  void changedPushNotification() {
    isPushNotifcation = !isPushNotifcation;
    LocaleManager.instance.setPushNotification(
        PreferencesKeys.PUSHNOTIFICATION, isPushNotifcation);
    notifyListeners();
  }
}
