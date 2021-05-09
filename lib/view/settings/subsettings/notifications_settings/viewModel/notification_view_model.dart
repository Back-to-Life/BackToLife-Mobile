import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../../../core/base/model/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'notification_view_model.g.dart';

class NotificationsViewModel = _NotificationsViewModelBase
    with _$NotificationsViewModel;

abstract class _NotificationsViewModelBase with Store, BaseViewModel {
  late FirebaseMessaging _messaging;
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    _messaging = FirebaseMessaging.instance;
  }

  void subscribeToNotification() {
    _messaging
        .subscribeToTopic('fallowers')
        .whenComplete(() => print('subscripeSuccess'));
  }
}
