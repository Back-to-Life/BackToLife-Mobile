import 'package:backtolife/core/base/model/base_view_model.dart';
import 'package:backtolife/core/constants/navigation/navigation_constants.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'forgot_password_view_model.g.dart';

class ForgotPasswordViewModel = _ForgotPasswordViewModelBase
    with _$ForgotPasswordViewModel;

abstract class _ForgotPasswordViewModelBase with Store, BaseViewModel {
  late TextEditingController email = TextEditingController();
  late TextEditingController token = TextEditingController();
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {}

  @observable
  double opacityValue = 0;

  @observable
  bool visible = false;

  @action
  void changedOpacity() {
    opacityValue = 1;
    visible = true;
  }

  @action
  void firstEmailGetToken() {
    changedOpacity();
  }

  void navigate() {
    navigation.navigateToPage(path: NavigationConstants.PASSOWRD_CHANGE);
  }
}
