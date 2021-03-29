import 'package:backtolife/core/constants/navigation/navigation_constants.dart';

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
  void init() {}

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

  Future<void> goToProfile() async {
    await navigation.navigateToPage(path: NavigationConstants.PROFILE);
  }
}
