import '../../../../../core/constants/navigation/navigation_constants.dart';
import '../../../../../core/init/notifier/language_notifier.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../../../../core/base/model/base_view_model.dart';

part 'language_settings_view_model.g.dart';

class LanguageViewModel = _LanguageViewModelBase with _$LanguageViewModel;

abstract class _LanguageViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {}

  @action
  void changeLanguage(int index) {
    if (index == 0) {
      context.setLocale(Locale('en', 'US'));
      Provider.of<LanguageNotifier>(context, listen: false).changeLanguage(0);
    }
    if (index == 1) {
      context.setLocale(Locale('tr', 'TR'));
      Provider.of<LanguageNotifier>(context, listen: false).changeLanguage(1);
    }
  }
}
