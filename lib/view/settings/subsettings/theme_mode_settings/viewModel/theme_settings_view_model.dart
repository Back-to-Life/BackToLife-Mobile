import '../../../../../core/base/model/base_view_model.dart';
import '../../../../../core/constants/enum/app_theme_enum.dart';
import '../../../../../core/init/notifier/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
part 'theme_settings_view_model.g.dart';

class ThemeSettingsViewModel = _ThemeSettingsViewModelBase
    with _$ThemeSettingsViewModel;

abstract class _ThemeSettingsViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {}

  void changeToLight() {
    Provider.of<ThemeNotifier>(context, listen: false)
        .changeValue(AppThemes.LIGHT);
  }

  void changeToDark() {
    Provider.of<ThemeNotifier>(context, listen: false)
        .changeValue(AppThemes.DARK);
  }
}
