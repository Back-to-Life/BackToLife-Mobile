import 'package:backtolife/core/base/model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'account_settings_view_model.g.dart';

class AccountSettingsViewModel = _AccountSettingsViewModelBase
    with _$AccountSettingsViewModel;

abstract class _AccountSettingsViewModelBase with Store, BaseViewModel {
  GlobalKey<FormState> formState = GlobalKey();
  late TextEditingController userName = TextEditingController();
  late TextEditingController email = TextEditingController();
  late TextEditingController password = TextEditingController();
  late FocusNode myFocusNode1 = FocusNode();
  late FocusNode myFocusNode2 = FocusNode();
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {}
}
