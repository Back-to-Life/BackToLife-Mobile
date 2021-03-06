import 'package:flutter/widgets.dart';

import '../../constants/enum/locale_keys_enum.dart';
import '../cache/locale_manager.dart';

class LanguageNotifier extends ChangeNotifier {
  bool? _isLanguageTurkish;
  bool? _isLanguageEnglish;

  bool? get isLanguageTurkis => _isLanguageTurkish;
  bool? get isLanguageEnglish => _isLanguageEnglish;

  LanguageNotifier() {
    var isLocaleCheck =
        LocaleManager.instance.getLnaguageManager(PreferencesKeys.LANGUAGE);
    if (isLocaleCheck) {
      _isLanguageTurkish = true;
      _isLanguageEnglish = false;
    } else {
      _isLanguageEnglish = true;
      _isLanguageTurkish = false;
    }
    notifyListeners();
  }

  void changeLanguage(int index) {
    if (index == 0) {
      _isLanguageTurkish = false;
      _isLanguageEnglish = true;
      LocaleManager.instance
          .setLanguageManager(PreferencesKeys.LANGUAGE, false);
    }
    if (index == 1) {
      _isLanguageEnglish = false;
      _isLanguageTurkish = true;
      LocaleManager.instance.setLanguageManager(PreferencesKeys.LANGUAGE, true);
    }
    notifyListeners();
  }
}
