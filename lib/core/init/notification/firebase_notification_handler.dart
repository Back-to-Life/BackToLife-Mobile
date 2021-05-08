import 'dart:io';

import 'package:backtolife/core/init/notification/notification_handler.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseNotifications {
  late FirebaseMessaging _messaging;
  late BuildContext myContext;

  void setupFirebase(BuildContext context) {
    _messaging = FirebaseMessaging.instance;
    NotificationHandler.initNotification(context);
    firebaseCloudMessageListener(context);
    myContext = context;
  }

  void firebaseCloudMessageListener(BuildContext context) async {
    NotificationSettings settigs = await _messaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true);
    print('setting ${settigs.authorizationStatus}');
    //this is getting token from device
    await _messaging.getToken().then((token) => print('MyToken : $token'));
    await _messaging
        .subscribeToTopic('all')
        .whenComplete(() => print('subscribe ok'));

    FirebaseMessaging.onMessage.listen((remoteMessage) {
      print('Recieve $remoteMessage');
      if (Platform.isAndroid) {
        showNotification(
            remoteMessage.data['title'], remoteMessage.data['body']);
      } else if (Platform.isIOS) {
        showNotification(remoteMessage.notification!.title,
            remoteMessage.notification!.body);
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((remoteMessage) {
      if (Platform.isIOS) {
        showDialog(
          context: myContext,
          builder: (context) => CupertinoAlertDialog(
            title: Text(remoteMessage.notification!.title!),
            content: Text(remoteMessage.notification!.body!),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Text('ok'),
                onPressed: () =>
                    Navigator.of(context, rootNavigator: true).pop(),
              )
            ],
          ),
        );
      }
    });
  }

  static void showNotification(title, body) async {
    var androidChannel = AndroidNotificationDetails(
        'com.amazingengineerskt.backtolife', 'My Channel', 'Description',
        // autoCancel: true,
        ongoing: true,
        importance: Importance.max,
        priority: Priority.high);
    var ios = IOSNotificationDetails();

    var platForm = NotificationDetails(android: androidChannel, iOS: ios);
    await NotificationHandler.flutterNotificationPlugin
        .show(0, title, body, platForm, payload: 'My Payload');
  }
}
