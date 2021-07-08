import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../../../../core/base/model/base_view_model.dart';
import '../../../../../core/constants/enum/locale_keys_enum.dart';
import '../../../../../core/init/notifier/settings_notifier.dart';
import '../../../../../core/init/svgPath/lottie_path.dart';
import '../../../../widgets/showAlertDialog/alert_dialog.dart';

part 'notification_view_model.g.dart';

class NotificationsViewModel = _NotificationsViewModelBase
    with _$NotificationsViewModel;

abstract class _NotificationsViewModelBase with Store, BaseViewModel {
  late FirebaseMessaging _messaging;
  @override
  void setContext(BuildContext context) => this.context = context;
  @override
  void init() {
    _changeToggleButtonInit();
    _messaging = FirebaseMessaging.instance;

    isNotificationChange = context.watch<SettingsNotifier>().isPushNotifcation;
  }

  void subscribeToNotification() {
    _messaging
        .subscribeToTopic('fallowers')
        .whenComplete(() => print('subscripeSuccess'));
  }

  @observable
  bool isNotificationChange = false;

  @action
  void changeNotificationButton() {
    isNotificationChange = !isNotificationChange;
    if (isNotificationChange) {
      context.read<SettingsNotifier>().changedPushNotification();
      _messaging.subscribeToTopic('fallowers').whenComplete(() {
        _successTopic();
        print('tamamlandı');
      });
    } else {
      context.read<SettingsNotifier>().changedPushNotification();
      _messaging
          .unsubscribeFromTopic('fallowers')
          .whenComplete(() => _sorrySuccess());
    }
  }

  void _successTopic() {
    showDialog(
        context: context,
        builder: (context) => CustomConfirmDialog(
            title: 'Notification Başarılı',
            description: 'Bizden ileti Aldığınız için Teşekkürler',
            jsonPath: LottiePaths.instance.pushNotificationSuccess));
  }

  void _sorrySuccess() {
    showDialog(
        context: context,
        builder: (context) => CustomConfirmDialog(
            title: 'Notification Ayırılımı',
            description: 'Bizden ileti Aldığınız almayacaksınız teşekkürler..',
            jsonPath: LottiePaths.instance.pushNotificationSuccess));
  }

  @action
  void _changeToggleButtonInit() {
    var isPushNotificationLocale =
        localeManager.getPushNotifation(PreferencesKeys.PUSHNOTIFICATION);
    if (isPushNotificationLocale) {
      isNotificationChange = true;
    } else {
      isNotificationChange = false;
    }
  }
}
