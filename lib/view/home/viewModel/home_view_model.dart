import '../../../core/base/model/base_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/enum/app_theme_enum.dart';
import '../../../core/init/network/network_manager.dart';
import '../../../core/init/notifier/theme_notifier.dart';
import '../model/home_model.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  BuildContext context;

  void setContext(BuildContext context) {
    this.context = context;
  }

  void init() {}

  @observable
  bool isSelectedToggle = true;

  void changeTheme() {
    Provider.of<ThemeNotifier>(context, listen: false)
        .changeValue(AppThemes.DARK);
  }

  @observable
  bool isLoading = false;
  @observable
  int number = 0;

  @action
  void increment() {
    number++;
  }

  @action
  Future<void> getSampleRequest() async {
    isLoading = true;
    await NetworkManager.instance.dioGet<HomeModel>("x", HomeModel());
    isLoading = false;
  }
}
