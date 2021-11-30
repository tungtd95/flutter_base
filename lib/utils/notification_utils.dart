import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

final BehaviorSubject<String?> selectNotificationSubject =
    BehaviorSubject<String?>();

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class NotificationUtils {
  static const String GENERAL_CHANNEL_ID = "GENERAL_NOTIFICATION_CHANNEL_ID";
  static const String GENERAL_CHANNEL_NAME =
      "GENERAL_NOTIFICATION_CHANNEL_NAME";

  static void showGeneralNotification(RemoteMessage message) {
    flutterLocalNotificationsPlugin.initialize(
      InitializationSettings(
        android: AndroidInitializationSettings("ic_launcher"),
      ),
      onSelectNotification: (String? payload) {
        selectNotificationSubject.add(payload);
      },
    );

    String title = message.data["title"] ?? '';
    String content = message.data["content"] ?? '';
    String deepLink = message.data["deep_link"] ?? '';
    flutterLocalNotificationsPlugin.show(
      message.hashCode,
      title,
      content,
      NotificationDetails(
        android: AndroidNotificationDetails(
          GENERAL_CHANNEL_ID,
          GENERAL_CHANNEL_NAME,
        ),
      ),
      payload: deepLink,
    );
  }

  static void handleNotificationAppLaunch() async {
    final NotificationAppLaunchDetails? data =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
    selectNotificationSubject.add(data?.payload);
  }

  static void subscribePayload(BuildContext context) {
    selectNotificationSubject.listen((value) {
      if (value != null) {
        if (value.isNotEmpty) {
          Navigator.of(context).pushNamed(value);
        }
        selectNotificationSubject.add(null);
      }
    });
  }

  static void clear() {
    selectNotificationSubject.close();
  }
}
