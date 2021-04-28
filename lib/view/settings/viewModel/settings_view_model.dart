import 'package:backtolife/core/base/model/base_view_model.dart';
import 'package:backtolife/core/init/language/locale_keys.g.dart';
import 'package:backtolife/core/init/svgPath/image_path_svg.dart';
import 'package:backtolife/view/settings/model/setting_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'settings_view_model.g.dart';

class SettingsViewModel = _SettingsViewModelBase with _$SettingsViewModel;

abstract class _SettingsViewModelBase with Store, BaseViewModel {
  List<SettingArgumansModel> settingArgumans = [];

  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    settingArgumans.add(SettingArgumansModel(
        title: LocaleKeys.onBoard_page1_title.tr(),
        imagePath: SVGImagePaths.instance.onboarding1));
    settingArgumans.add(SettingArgumansModel(
        title: LocaleKeys.onBoard_page2_title.tr(),
        imagePath: SVGImagePaths.instance.onboarding2));
    settingArgumans.add(SettingArgumansModel(
        title: LocaleKeys.onBoard_page3_title.tr(),
        imagePath: SVGImagePaths.instance.onboarding3));
  }
}
