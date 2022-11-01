import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_base_config/utils/notification_utils.dart';

Future setupFirebase() async {
  FirebaseMessaging.onBackgroundMessage(_handleBackgroundFCM);
  FirebaseMessaging.onMessage.listen(_handleForegroundFCM);

  await Firebase.initializeApp();
  FirebaseMessaging.instance.getToken().then((value) {
    print("FCM token: $value");
  });
}

Future<void> _handleBackgroundFCM(RemoteMessage message) async {
  NotificationUtils.showGeneralNotification(message);
}

Future<void> _handleForegroundFCM(RemoteMessage message) async {
  NotificationUtils.showGeneralNotification(message);
}
