import '../../../core/base/model/base_view_model.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/init/language/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../core/init/svgPath/image_path_svg.dart';
import '../model/setting_model.dart';
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
        title: LocaleKeys.settings_account.tr(),
        imagePath: SVGImagePaths.instance.accountSettings));
    settingArgumans.add(SettingArgumansModel(
        title: LocaleKeys.settings_language.tr(),
        imagePath: SVGImagePaths.instance.languagesettings));
    settingArgumans.add(SettingArgumansModel(
        title: LocaleKeys.settings_notifications.tr(),
        imagePath: SVGImagePaths.instance.notificationsettings));
    settingArgumans.add(SettingArgumansModel(
        title: LocaleKeys.settings_permissions.tr(),
        imagePath: SVGImagePaths.instance.permissionssettings));
    settingArgumans.add(SettingArgumansModel(
        title: LocaleKeys.settings_theme.tr(),
        imagePath: SVGImagePaths.instance.themesettings));
    settingArgumans.add(SettingArgumansModel(
        title: LocaleKeys.settings_about.tr(),
        imagePath: SVGImagePaths.instance.aboutsettings));
    settingArgumans.add(SettingArgumansModel(
        title: LocaleKeys.settings_logout.tr(),
        imagePath: SVGImagePaths.instance.logoutsettings));
  }

  selectedItem(int index) {
    print('$index');
    switch (index) {
      case 1:
        navigation.navigateToPage(path: NavigationConstants.LANGUAGE_SETTINGS);
        break;
      case 2:
        navigation.navigateToPage(
            path: NavigationConstants.NOTIFICATION_SETTINGS);
        break;
      case 3:
        navigation.navigateToPage(
            path: NavigationConstants.PERMISSIONS_SETTINGS);
        break;
      case 4:
        navigation.navigateToPage(path: NavigationConstants.THEMEMODE_SETTINGS);
        break;
      case 5:
        navigation.navigateToPage(path: NavigationConstants.ABOUT_SETTINGS);
        break;
      case 6:
        navigation.navigateToPage(path: NavigationConstants.LOGOUT_SETTINGS);
        break;
      default:
    }
  }

  void backButtonLanguage() {
    navigation.navigateToPage(path: NavigationConstants.HOME_VIEW);
  }
}
