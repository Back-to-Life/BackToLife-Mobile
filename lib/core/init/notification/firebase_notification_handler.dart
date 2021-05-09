import 'dart:io';

import 'package:backtolife/core/init/navigation/INavigation_service.dart';
import 'package:backtolife/core/init/navigation/navigation_route.dart';
import 'package:backtolife/core/init/navigation/navigation_service.dart';
import 'package:backtolife/core/init/notification/notification_handler.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseNotifications {
  late NavigationService navigationRoute = NavigationService.instance;
  late FirebaseMessaging _messaging;
  late BuildContext myContext;
  static final flutterNotificationPlugin = FlutterLocalNotificationsPlugin();

  void setupFirebase(BuildContext context) {
    _messaging = FirebaseMessaging.instance;
    firebaseCloudMessageListener(context);
    var initAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    var initSettings = InitializationSettings(android: initAndroid);
    flutterNotificationPlugin.initialize(initSettings);
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
      flutterNotificationPlugin.show(
          remoteMessage.notification.hashCode,
          remoteMessage.notification!.title,
          remoteMessage.notification!.body,
          NotificationDetails(
              android: AndroidNotificationDetails(
                  'com.amazingengineerskt.backtolife',
                  'Back To Life',
                  'Geri Dönüşüm Uygulamsı',
                  autoCancel: true,
                  // icon: 'launch_background',
                  ongoing: true,
                  importance: Importance.max,
                  priority: Priority.high)));
      var gelenMesaj = remoteMessage.data;
      print(gelenMesaj);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((remoteMessage) async {
      await navigationRoute.navigateToPage(
          path: remoteMessage.data['navigation']);

      /* showDialog(
        context: myContext,
        builder: (context) => CupertinoAlertDialog(
          title: Text(remoteMessage.notification!.title!),
          content: Text(remoteMessage.notification!.body!),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text('ok'),
              onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
            )
          ],
        ),
      ); */
    });
  }

  /*  static void showNotification(RemoteMessage remoteMessage) async {
    flutterNotificationPlugin.show(
        remoteMessage.notification.hashCode,
        remoteMessage.notification!.title,
        remoteMessage.notification!.body,
        NotificationDetails(
            android: AndroidNotificationDetails(
                'com.amazingengineerskt.backtolife',
                'Back To Life',
                'Geri Dönüşüm Uygulamsı',
                // autoCancel: true,
                icon: 'launch_background',
                ongoing: true,
                importance: Importance.max,
                priority: Priority.high))); */
  /*  var androidChannel = AndroidNotificationDetails(
        'com.amazingengineerskt.backtolife',
        'Back To Life',
        'Geri Dönüşüm Uygulamsı',
        // autoCancel: true,
        ongoing: true,
        color: Colors.blue,
        fullScreenIntent: true,
        importance: Importance.max,
        priority: Priority.high); */

  // var platForm = NotificationDetails(android: androidChannel, iOS: ios);
  /*   await NotificationHandler.flutterNotificationPlugin
        .show(0, title, body, platForm, payload: '$body'); */
}
