import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  var isNotificationAllowed = false.obs;

  Future<void> notificationRequest() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized ||
        settings.authorizationStatus == AuthorizationStatus.provisional) {
      isNotificationAllowed.value = true;
      print('Notifications are allowed');
    } else {
      isNotificationAllowed.value = false;
      print('Notifications are not allowed');
    }
  }
}
