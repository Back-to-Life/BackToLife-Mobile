import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../navigation/navigation_service.dart';

class FirebaseNotifications {
  late NavigationService navigationRoute = NavigationService.instance;
  late FirebaseMessaging _messaging;
  late BuildContext myContext;
  static final flutterNotificationPlugin = FlutterLocalNotificationsPlugin();

  void setupFirebase(BuildContext context) {
    _messaging = FirebaseMessaging.instance;
    firebaseCloudMessageListener(context);
    var initAndroid = AndroidInitializationSettings('@mipmap/ic_notification');
    var initSettings = InitializationSettings(android: initAndroid);
    flutterNotificationPlugin.initialize(initSettings);
    myContext = context;
  }

  void firebaseCloudMessageListener(BuildContext context) async {
    // ignore: omit_local_variable_types
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
                  icon: 'icon_notification',
                  color: Color(0xFF72A863),
                  playSound: true,
                  largeIcon: DrawableResourceAndroidBitmap('icon_notification'),
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
