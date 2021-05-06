import '../../../../../core/base/model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'permissions_setting_view_model.g.dart';

class PermissonsSettingsViewModel = _PermissonsSettingsViewModelBase
    with _$PermissonsSettingsViewModel;

abstract class _PermissonsSettingsViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {}
}
