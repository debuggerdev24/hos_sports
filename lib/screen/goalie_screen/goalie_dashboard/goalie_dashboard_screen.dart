import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:hos_sports/screen/goalie_screen/goalie_home/goalie_home_screen.dart';
import 'package:hos_sports/screen/goalie_screen/goalie_ladder/goalie_ladder_screen.dart';
import 'package:hos_sports/screen/profile/profile_screen.dart';
import 'package:hos_sports/screen/settings/settings_screen.dart';
import 'package:hos_sports/service/controller/common_controller.dart';
import 'package:hos_sports/widgets/widgets.dart';
import '../../../service/controller/auth_controller.dart';
import '../../../service/controller/fcm_helper.dart';
import '../../../service/controller/location_controller.dart';
import '../../../widgets/constants.dart';
import '../goalie_home/base/goalie_game_rating_screen.dart';

class GoalieDashboardScreen extends StatefulWidget {
  const GoalieDashboardScreen({super.key});

  @override
  State<GoalieDashboardScreen> createState() => _GoalieDashboardScreenState();
}

class _GoalieDashboardScreenState extends State<GoalieDashboardScreen> {
  int currentIndex = 0;
  bool pops = false;
  List<Widget> screen = [
    const GoalieHomeScreen(),
    // const GoalieLadderScreen(),
    const ProfileScreen(),
    const SettingsScreen(),
  ];

  callInit() {
    log("here it started");
    Future.microtask(() => Get.find<AuthController>().forceUpdate(context));
    Future.microtask(
            () => Get.find<LocationController>().determinePosition(context))
        .then((value) {
      Future.microtask(() => Get.find<LocationController>()
          .getTimeZone(lat: value.latitude, long: value.longitude)).then((v) {
        Future.microtask(
                () => Get.find<LocationController>().setPosition(context))
            .then((v) {
          Future.microtask(() => Get.find<CommonController>()
              .goalieAllRatingApi(filed: "goalie")).then((value) {
            Future.microtask(
                () => Get.find<AuthController>().updateDeviceTokenApi());
            FCM().setNotifications(context);
            Get.find<AuthController>().getUsersDetailsApi();
          });
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();
    callInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Image.asset(ImageConst.logo),
        ),
        title: Image.asset(
          ImageConst.topBackImage,
          scale: 5,
        ),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GetBuilder<CommonController>(
                builder: (CommonController controller) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => GoalieGameRatingScreen());
                    },
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: Text(
                              'Rating',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 18),
                          child: Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: RatingBarIndicator(
                              rating: controller.goalieRatingModel != null
                                  ? double.parse(controller
                                      .goalieRatingModel!.data!.avgRating
                                      .toString())
                                  : 0,
                              itemBuilder: (context, index) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              itemCount: 5,
                              itemSize: 14.0,
                              unratedColor: Colors.grey,
                              direction: Axis.horizontal,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
          // IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
        ],
      ),
      body: PopScope(
        canPop: pops,
        onPopInvoked: (pop) {
          showDialog(
              barrierColor: const Color.fromARGB(200, 0, 0, 0),
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor:
                      Colors.black, // Set the background to a blue color
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.all(
                        Radius.circular(20)), // Rounded corners
                  ),
                  title: const Text("Are you really want to exit ?",
                      style: TextStyle(color: Colors.white)),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        // Close the app
                        if (Platform.isAndroid) {
                          SystemNavigator.pop();
                        } else if (Platform.isIOS) {
                          exit(0);
                        }
                      },
                      child: const Text("Yes"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text("No"),
                    ),
                  ],
                );
              });
        },
        child: Container(
            width: screenWidth(context),
            height: screenHeight(context),
            decoration: decoration(),
            child: screen.elementAt(currentIndex)),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: Colors.black,
        selectedItemColor: AppColor.primary,
        unselectedItemColor: Colors.grey,
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.games), label: "Games"),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.area_chart_rounded), label: "Ladder"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
