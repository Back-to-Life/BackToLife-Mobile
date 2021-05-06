import 'package:backtolife/core/base/model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'notification_view_model.g.dart';

class NotificationsViewModel = _NotificationsViewModelBase
    with _$NotificationsViewModel;

abstract class _NotificationsViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {}
}