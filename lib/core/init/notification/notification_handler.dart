import 'package:backtolife/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHandler {
  static final flutterNotificationPlugin = FlutterLocalNotificationsPlugin();
  static late BuildContext myContext;

  static void initNotification(BuildContext context) {
    myContext = context;
    var initAndroid = AndroidInitializationSettings("@mipmap/ic_launcher");
    /*  var initIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification); */
    var initSettings = InitializationSettings(android: initAndroid);
    flutterNotificationPlugin.initialize(initSettings);
  }

// yukardaki yere root ekleyebiliriz.  onSelectNotification: onSelectNotification()
  static Future onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    await showDialog(
      context: myContext,
      builder: (context) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(body),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text('ok'),
            onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
          )
        ],
      ),
    );
  }

//  static Future onSelectNotification(String navigationRoot) {
//   Navigator.of(context).push(navigationRoot);
// }
}
