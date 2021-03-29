import 'package:backtolife/core/base/model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'profile_view_model.g.dart';

class ProfileViewModel = _ProfileViewModelBase with _$ProfileViewModel;

abstract class _ProfileViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  void init() {}
}
