import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:hos_sports/screen/dashboard_screen/customer_favourite_screen.dart';
import 'package:hos_sports/screen/dashboard_screen/home_screen.dart';
import 'package:hos_sports/screen/profile/profile_screen.dart';
import 'package:hos_sports/screen/settings/settings_screen.dart';
import 'package:hos_sports/service/controller/auth_controller.dart';
import 'package:hos_sports/service/controller/location_controller.dart';
import 'package:hos_sports/widgets/widgets.dart';

import '../../service/controller/fcm_helper.dart';
import '../../widgets/constants.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;
  bool pops = false;

  List<Widget> screen = [
    const HomeScreen(),
    const CustomerFavouriteScreen(),
    const ProfileScreen(),
    const SettingsScreen(),
  ];

  callInit() {
    Future.microtask(() => Get.find<AuthController>().forceUpdate(context));
    Future.microtask(() => Get.find<LocationController>().setPosition(context))
        .then((value) {
      Future.microtask(
              () => Get.find<LocationController>().determinePosition(context))
          .then((val) {
        Future.microtask(() => Get.find<LocationController>()
            .getTimeZone(lat: val.latitude, long: val.longitude)).then((_) {
          FCM().setNotifications(context);
          Get.find<AuthController>().updateDeviceTokenApi();
        });
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
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
                    rating: 5,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 16.0,
                    direction: Axis.horizontal,
                  ),
                ),
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
          decoration: decoration(),
          child: screen.elementAt(currentIndex),
        ),
      ),
      bottomNavigationBar: Card(
        color: Colors.grey.shade900,
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          backgroundColor: Colors.black,
          selectedItemColor: AppColor.primary,
          unselectedItemColor: Colors.grey,
          onTap: (value) {
            currentIndex = value;
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.games), label: "Dashboard"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favourites"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 30,
                ),
                label: "Profile"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Setting"),
          ],
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
