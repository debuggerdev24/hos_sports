import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hos_sports/firebase_options.dart';

import 'package:hos_sports/screen/settings/base/goalie_signup_screen.dart';
import 'package:hos_sports/service/controller/NotificationController.dart';
import 'package:hos_sports/service/controller/auth_controller.dart';
import 'package:hos_sports/service/controller/common_controller.dart';
import 'package:hos_sports/service/controller/customer_controller.dart';
import 'package:hos_sports/service/controller/goalie_controller.dart';
import 'package:hos_sports/service/controller/location_controller.dart';
import 'package:hos_sports/service/controller/opt_count_down.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'screen/splash_screen.dart';
import 'service/controller/fcm_helper.dart';
import 'widgets/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);

  tz.initializeTimeZones();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Hos Sports',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.black,
            elevation: 0,
            centerTitle: true,
            iconTheme: const IconThemeData(color: Colors.white),
            titleTextStyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Colors.white)),
        progressIndicatorTheme:
            const ProgressIndicatorThemeData(color: AppColor.primary),
        textTheme: const TextTheme(
          titleLarge: TextStyle(color: Colors.white),
          titleMedium: TextStyle(color: Colors.white),
          titleSmall: TextStyle(color: Colors.white),
          displaySmall: TextStyle(color: Colors.white),
          displayMedium: TextStyle(color: Colors.white),
          displayLarge: TextStyle(color: Colors.white),
          bodyLarge: TextStyle(color: Colors.white),
          headlineLarge: TextStyle(color: Colors.white),
          bodySmall: TextStyle(color: Colors.white),
          labelMedium: TextStyle(color: Colors.white),
          labelLarge: TextStyle(color: Colors.white),
          labelSmall: TextStyle(color: Colors.white),
          headlineMedium: TextStyle(color: Colors.white),
          headlineSmall: TextStyle(color: Colors.white),

          // Set default text color to white
          bodyMedium: TextStyle(
              color:
                  Colors.white), // If you want to set other text styles as well
        ),
        listTileTheme: const ListTileThemeData(
            titleTextStyle: TextStyle(color: Colors.white)),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primary),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            backgroundColor: WidgetStateProperty.all(
              Colors.black,
            ),
            foregroundColor: WidgetStateProperty.all(
              Colors.white,
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                backgroundColor: WidgetStateProperty.all(AppColor.primary),
                foregroundColor: WidgetStateProperty.all(Colors.white))),
        bottomSheetTheme:
            const BottomSheetThemeData(backgroundColor: Colors.transparent),
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
                foregroundColor: WidgetStateProperty.all(AppColor.primary))),
        useMaterial3: true,
      ),
      initialBinding: BindingsBuilder(() {
        Get.put(AuthController());
        Get.put(CommonController());
        Get.put(CustomerController());
        Get.put(GoalieController());
        Get.put(LocationController());
        Get.put(NotificationController());
        Get.put(CountdownController());
      }),
      // home: const GoalieSignupScreen(),
      home: const SplashScreen(),
    );
  }
}
