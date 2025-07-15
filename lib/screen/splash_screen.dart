import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hos_sports/screen/authentication/login_screen.dart';
import 'package:hos_sports/screen/dashboard_screen/dashboard_screen.dart';
import 'package:hos_sports/screen/goalie_screen/goalie_dashboard/goalie_dashboard_screen.dart';
import 'package:hos_sports/service/controller/NotificationController.dart';
import 'package:hos_sports/service/controller/auth_controller.dart';
import 'package:hos_sports/widgets/widgets.dart';

import '../service/controller/location_controller.dart';
import '../widgets/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animationOpacity;
  late Animation<double> _animationScale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _animationOpacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);

    _animationScale = Tween<double>(
      begin: 0.0,
      end: 0.6,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<List<String>>(
          future: Future.delayed(const Duration(seconds: 3)).then((value) {
            Future.microtask(
                () => Get.find<NotificationController>().notificationRequest());
            Future.microtask(() =>
                Get.find<LocationController>().determinePosition(context));
            return Get.find<AuthController>().userLogged();
          }),
          builder:
              (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.first.toString().isEmpty) {
                return const LoginScreen();
              } else {
                if (snapshot.data!.last.toString() == '1') {
                  return const DashboardScreen();
                } else {
                  return const GoalieDashboardScreen();
                }
              }
            } else if (snapshot.hasError) {
              return const Icon(Icons.error_outline);
            } else {
              return Container(
                width: screenHeight(context),
                height: screenHeight(context),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Colors.black.withOpacity(.1),
                      AppColor.primary.withOpacity(.15),
                    ])),
                child: Center(
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Opacity(
                        opacity: _animationOpacity.value,
                        child: Transform.scale(
                          scale: _animationScale.value,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                ImageConst.logo,
                              ),
                              Image.asset(
                                ImageConst.topBackImage,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            }
          }),
    );
  }
}
