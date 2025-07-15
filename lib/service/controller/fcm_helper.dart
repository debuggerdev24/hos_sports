import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FCM {
  RemoteMessage? _messages;
  BuildContext? _context;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> _showLocalNotification(String? title, String? body) async {
    // Initialization settings for Android and iOS
    var android = const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsDarwin = DarwinInitializationSettings(
       onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );

    flutterLocalNotificationsPlugin.initialize(
      InitializationSettings(
          android: android, iOS: initializationSettingsDarwin),
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );

    // Notification details for Android
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      "hos_sports",
      "hos_sports",
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      showProgress: true,
      ticker: 'test ticker',
    );

    // Notification details for iOS
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: const DarwinNotificationDetails(categoryIdentifier: "plainCategory"),
    );

    // Show the local notification
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: 'test',
    );
  }

  void setNotifications(BuildContext context) {
    _context = context;

    // Request permissions
    if (Platform.isAndroid) {
      flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()!
          .requestNotificationsPermission();
    } else if (Platform.isIOS) {
      flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()!
          .requestPermissions();
    }

    // Disable Firebase's default notification display in the foreground
    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, // Prevent double notifications
      badge: true,
      sound: true,
    );

    // Background message handler
    FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);

    // Handle notification clicks when the app is in the background or terminated
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      handleClick(context, message);
    });

    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        handleClick(context, message);
      }
    });

    // Handle notifications when the app is in the foreground
    FirebaseMessaging.onMessage.listen((message) async {
      _messages = message;

      // Manually show the notification

      if (Platform.isAndroid) {
        _showLocalNotification(
          message.notification?.title,
          message.notification?.body,
        );
      }
    });
  }

  Future<bool?> permissionCheck() async {
    if (Platform.isAndroid) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()!
          .requestNotificationsPermission();
      return await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()!
          .areNotificationsEnabled();
    } else if (Platform.isIOS) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()!
          .requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
      return true;
    }
    return null;
  }

  void onDidReceiveLocalNotification(
      int? id, String? title, String? body, String? payload) async {
    debugPrint('Local notification received: $payload');
    handleClick(_context!, _messages!);
  }

  void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    if (payload != null) {
      debugPrint('Notification payload: $payload');
      handleClick(_context!, _messages!);
    }
  }

  void handleClick(BuildContext context, RemoteMessage message) async {
    print("Notification Clicked: $message");
    // Add custom logic to handle notification click
  }
}

// Background message handler
Future<void> onBackgroundMessage(RemoteMessage message) async {
  print("Handling background message: ${message.messageId}");
}
