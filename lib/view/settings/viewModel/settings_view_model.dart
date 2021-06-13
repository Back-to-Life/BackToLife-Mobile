import 'package:backtolife/core/constants/enum/app_theme_enum.dart';
import 'package:backtolife/core/constants/enum/locale_keys_enum.dart';
import 'package:backtolife/core/extension/context_extension.dart';
import 'package:backtolife/core/extension/string_extension.dart';
import 'package:backtolife/core/init/notifier/theme_notifier.dart';
import 'package:backtolife/core/init/svgPath/lottie_path.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../subsettings/language_settings/view/language_settings_view.dart';
import 'package:flutter/cupertino.dart';
import '../../../core/base/model/base_view_model.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/init/lang/locale_keys.g.dart';
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
    addName();
  }

  void selectedItem(int index) async {
    switch (index) {
      case 0:
        await navigation.navigateToPage(
            path: NavigationConstants.ACCOUNT_SETTING);
        break;
      case 1:
        settingArgumans.clear();
        String received = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => LanguageSettingsView(string: 'foo')));
        if (received == 'bar') {
          addName();
        }
        break;
      case 2:
        await navigation.navigateToPage(
            path: NavigationConstants.NOTIFICATION_SETTINGS);
        break;
      case 3:
        await navigation.navigateToPage(
            path: NavigationConstants.PERMISSIONS_SETTINGS);
        break;
      case 4:
        await navigation.navigateToPage(
            path: NavigationConstants.THEMEMODE_SETTINGS);
        break;
      case 5:
        await navigation.navigateToPage(
            path: NavigationConstants.ABOUT_SETTINGS);
        break;
      case 6:
        _reallyLogout();
        break;
      default:
    }
  }

  void backButtonLanguage() {
    navigation.navigateToPage(path: NavigationConstants.HOME_VIEW);
  }

  void _reallyLogout() {
    Widget yesButton = ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color(0xFF72A863)),
      ),
      child: Text(LocaleKeys.settings_dialogLogout_yes.locale,
          style: context.textTheme.headline6!.copyWith(color: Colors.red)),
      onPressed: () async {
        await _logout();
      },
    );
    Widget noButton = ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color(0xFF72A863)),
      ),
      child: Text(LocaleKeys.settings_dialogLogout_no.locale,
          style: context.textTheme.headline6!.copyWith(color: Colors.white)),
      onPressed: () {
        navigation.pop();
      },
    );

    // set up the AlertDialog
    var alert = AlertDialog(
      elevation: 10,
      title: Text(LocaleKeys.settings_dialogLogout_logout.locale,
          textAlign: TextAlign.center),
      content: Container(
        height: context.height * 0.3,
        child: Column(
          children: [
            Expanded(flex: 6, child: Lottie.asset(LottiePaths.instance.logout)),
            Spacer(),
            Expanded(
              flex: 2,
              child: Text(LocaleKeys.settings_dialogLogout_description.locale,
                  textAlign: TextAlign.center),
            )
          ],
        ),
      ),
      actions: <Widget>[
        Row(
          children: [
            // Spacer(),
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(left: context.width * 0.09),
              child: noButton,
            )),
            Spacer(),
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(right: context.width * 0.09),
              child: yesButton,
            )),
            // Spacer(),
          ],
        )
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<void> _logout() async {
    Provider.of<ThemeNotifier>(context, listen: false)
        .changeValue(AppThemes.LIGHT);
    await localeManager.clearOnly(PreferencesKeys.THEME);
    await localeManager.clearOnly(PreferencesKeys.ID);
    await localeManager.clearOnly(PreferencesKeys.TOKEN);
    await navigation.navigateToPageClear(
        path: NavigationConstants.AUTHENTICATION_VIEW);
  }

  void addName() {
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
}
