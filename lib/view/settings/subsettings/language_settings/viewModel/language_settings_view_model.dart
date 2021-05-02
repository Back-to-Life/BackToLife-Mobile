import 'package:backtolife/core/constants/navigation/navigation_constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/base/model/base_view_model.dart';

part 'language_settings_view_model.g.dart';

class LanguageViewModel = _LanguageViewModelBase with _$LanguageViewModel;

abstract class _LanguageViewModelBase with Store, BaseViewModel {
  @observable
  bool isTurkishLanguage = false;

  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {}

  @action
  void changeLanguage(int index) {
    if (index == 0) {
      context.setLocale(Locale('en', 'US'));
      isTurkishLanguage = false;
    }
    if (index == 1) {
      context.setLocale(Locale('tr', 'TR'));
      isTurkishLanguage = true;
    }
  }

  void backButtonLanguage() {
    navigation.navigateToPage(path: NavigationConstants.SETTINGS);
  }
}
