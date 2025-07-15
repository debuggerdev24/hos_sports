import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hos_sports/screen/settings/notification/customer_notification_screen.dart';
import 'package:hos_sports/screen/settings/notification/goalie_notification_screen.dart';
import 'package:hos_sports/service/controller/NotificationController.dart';
import 'package:hos_sports/service/controller/auth_controller.dart';

import 'package:hos_sports/widgets/widgets.dart';
import 'package:app_settings/app_settings.dart';

class NotificationTypeScreen extends StatefulWidget {
  const NotificationTypeScreen({super.key});

  @override
  State<NotificationTypeScreen> createState() => _NotificationTypeScreenState();
}

class _NotificationTypeScreenState extends State<NotificationTypeScreen> {
  final notificationController = Get.put(NotificationController());

  @override
  void initState() {
    super.initState();
    // Check notification permissions
    notificationController.notificationRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(
        () => Container(
          decoration: decoration(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 10),
                if (!notificationController.isNotificationAllowed.value)
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        AppSettings.openAppSettings();
                      },
                      child: const Text("Enable Push Notifications"),
                    ),
                  ),
                Container(
                  decoration: dec,
                  child: ListTile(
                    onTap: () {
                      if (Get.find<AuthController>().userType == "1") {
                        Get.to(
                            () => const CustomerNotificationScreen(type: '1'));
                      } else {
                        Get.to(() => const GoalieNotificationScreen(type: "1"));
                      }
                    },
                    leading: const Icon(Icons.mail, color: Colors.white),
                    title: const Text("Email"),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: dec,
                  child: ListTile(
                    onTap: () {
                      if (Get.find<AuthController>().userType == "1") {
                        Get.to(
                            () => const CustomerNotificationScreen(type: '0'));
                      } else {
                        Get.to(() => const GoalieNotificationScreen(type: "0"));
                      }
                    },
                    leading:
                        const Icon(Icons.notifications, color: Colors.white),
                    title: const Text("Push Notification"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
