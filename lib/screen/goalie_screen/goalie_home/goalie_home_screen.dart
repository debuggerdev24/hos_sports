import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hos_sports/screen/goalie_screen/goalie_home/base/check_in_screen.dart';
import 'package:hos_sports/screen/goalie_screen/goalie_home/base/gaolie_pending_feedback_screen.dart';
import 'package:hos_sports/screen/goalie_screen/goalie_home/base/gaolie_unpaid_game_screen.dart';
import 'package:hos_sports/screen/goalie_screen/goalie_home/base/goalie_available_game_screen.dart';
import 'package:hos_sports/screen/goalie_screen/goalie_home/base/goalie_cancel_game_screen.dart';
import 'package:hos_sports/screen/goalie_screen/goalie_home/base/goalie_earning_history_screen.dart';
import 'package:hos_sports/screen/goalie_screen/goalie_home/base/goalie_history_game_screen.dart';
import 'package:hos_sports/screen/goalie_screen/goalie_home/base/goalie_schedule_game_screen.dart';
import 'package:hos_sports/screen/promotion_screen.dart';
import 'package:hos_sports/service/controller/common_controller.dart';
import 'package:hos_sports/widgets/widgets.dart';

import '../../../service/controller/auth_controller.dart';
import '../../../service/controller/location_controller.dart';
import '../../../widgets/constants.dart';

class GoalieHomeScreen extends StatefulWidget {
  const GoalieHomeScreen({super.key});

  @override
  State<GoalieHomeScreen> createState() => _GoalieHomeScreenState();
}

class _GoalieHomeScreenState extends State<GoalieHomeScreen> {
  //

  Future<void> _refreshData() async {
    Future.microtask(() => Get.find<AuthController>().getUsersDetailsApi())
        .then((v) {
      Future.microtask(() =>
              Get.find<CommonController>().goalieAllRatingApi(filed: "goalie"))
          .then((value) {
        Future.microtask(
            () => Get.find<AuthController>().updateDeviceTokenApi());
      });
      setState(() {
        log("Refreshing data");
      });
    });
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: decoration(),
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white12,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.to(() => const PromotionScreen());
                    },
                    child: const Text(
                      'Promotions',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.find<CommonController>().shareSms();
                    },
                    child: const Text(
                      'Easy Share',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.find<CommonController>().share();
                    },
                    child: const Text(
                      'Social Share',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: RefreshIndicator(
                  onRefresh: _refreshData,
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 250,
                          height: 80,
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() => const CheckInScreen());
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  border: Border.all(
                                      color: const Color(0xffDCD4D4)),
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("Rink Check In"),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GetBuilder<CommonController>(
                          initState: (_) {
                            Future.microtask(() => _.controller!
                                    .goalieAllRatingApi(filed: "goalie"))
                                .then((value) {
                              setState(() {});
                            });
                          },
                          builder: (CommonController controller) {
                            if (controller.goalieRatingModel != null) {
                              var data = controller.goalieRatingModel!.data;
                              return GridView.count(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                shrinkWrap: true,
                                physics: const ClampingScrollPhysics(),
                                childAspectRatio: 2.5,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                crossAxisCount: 2,
                                children: [
                                  HomeCard(
                                    count: "${data!.availabel}",
                                    title: "Available",
                                    color: data.availabel != "0"
                                        ? Colors.green
                                        : null,
                                    onTap: () {
                                      Get.to(() =>
                                          const GoalieAvailableGameScreen());
                                    },
                                  ),
                                  HomeCard(
                                      onTap: () {
                                        Get.to(() =>
                                            const GoalieScheduledGameScreen());
                                      },
                                      color: data.schedule != "0"
                                          ? Colors.green
                                          : null,
                                      count: "${data.schedule}",
                                      title: "Scheduled"),
                                  HomeCard(
                                      onTap: () {
                                        Get.to(() =>
                                            const GoalieHistoryGameScreen());
                                      },
                                      count: "${data.history}",
                                      title: "History"),
                                  HomeCard(
                                      onTap: () {
                                        Get.to(() =>
                                            const GoalieCancelGameScreen());
                                      },
                                      count: "${data.cancel}",
                                      color: data.cancelColor == "red"
                                          ? Colors.red
                                          : Colors.white,
                                      title: "Cancelled"),
                                  HomeCard(
                                      onTap: () {
                                        Get.to(() =>
                                            const GoalieUnpaidGameScreen());
                                      },
                                      count: "${data.unpaid}",
                                      color: data.unpaid != "0"
                                          ? AppColor.primary
                                          : null,
                                      title: "Outstanding Payment"),
                                  HomeCard(
                                      onTap: () {
                                        Get.to(() =>
                                            const GoaliePendingFeedbackScreen());
                                      },
                                      count: "${data.feedback}",
                                      color: data.feedback != "0"
                                          ? AppColor.primary
                                          : null,
                                      title: "Outstanding Feedback"),
                                ],
                              );
                            }
                            return const Center(
                                child: CircularProgressIndicator.adaptive(
                                    backgroundColor: Colors.red));
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const GoalieEarningHistoryScreen());
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                border:
                                    Border.all(color: const Color(0xffDCD4D4)),
                                borderRadius: BorderRadius.circular(15)),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 15),
                              child: Center(child: Text("Earning History")),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              border:
                                  Border.all(color: const Color(0xffDCD4D4)),
                              borderRadius: BorderRadius.circular(15)),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            child: Center(
                                child: Text(
                              "Reminder - In fairness to our customers, games are not to be canceled.\n\nPlease do not accept games that potentially cannot fulfill.",
                              textAlign: TextAlign.center,
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  final String count;
  final Function()? onTap;
  final String title;
  final Color? color;

  const HomeCard(
      {super.key,
      required this.count,
      required this.title,
      this.onTap,
      this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(.65),
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '($count)',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: color ?? Colors.white),
            ),
            FittedBox(
              child: Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
