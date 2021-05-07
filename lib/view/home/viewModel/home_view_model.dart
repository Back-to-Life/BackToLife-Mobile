import '../../../core/constants/enum/locale_keys_enum.dart';
import '../../../core/init/cache/locale_manager.dart';

import '../../profile/view/profile_view.dart';

import '../../../core/constants/navigation/navigation_constants.dart';

import '../../../core/base/model/base_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/enum/app_theme_enum.dart';
import '../../../core/init/notifier/theme_notifier.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  @override
  void init() {
    changeToggleButtonInit();
  }

  @observable
  bool isSelectedToggle = false;

  @action
  void changedToggle() {
    isSelectedToggle = !isSelectedToggle;
    if (isSelectedToggle == true) {
      Provider.of<ThemeNotifier>(context, listen: false)
          .changeValue(AppThemes.DARK);
    } else if (isSelectedToggle == false) {
      Provider.of<ThemeNotifier>(context, listen: false)
          .changeValue(AppThemes.LIGHT);
    }
  }

  @observable
  bool isLoading = false;
  @observable
  int number = 0;

  @action
  void increment() {
    number++;
  }

  void changeToggleButtonInit() {
    var isThemeChange =
        LocaleManager.instance.getThemeManager(PreferencesKeys.THEME);
    if (isThemeChange) {
      isSelectedToggle = false;
    } else {
      isSelectedToggle = true;
    }
  }

  Future<void> goToProfile() async {
    await navigation.navigateToPage(path: NavigationConstants.PROFILE);
  }

  Future<void> goToProfileWave() async {
    await navigation.navigateWave(child: ProfileView());
  }

  Future<void> goToQrCode() async {
    await navigation.navigateToPage(path: NavigationConstants.QRCODE);
  } 
  
}
