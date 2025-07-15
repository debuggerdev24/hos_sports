import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hos_sports/screen/goalie_screen/goalie_home/base/available_game_details.dart';
import 'package:hos_sports/service/controller/goalie_controller.dart';
import 'package:hos_sports/widgets/widgets.dart';
import 'package:intl/intl.dart';

import '../../../../service/controller/common_controller.dart';
import '../../../../widgets/constants.dart';
import 'goalie_history_game_screen.dart';
import 'goalie_schedule_game_screen.dart';

class GoalieAvailableGameScreen extends StatefulWidget {
  const GoalieAvailableGameScreen({super.key});

  @override
  State<GoalieAvailableGameScreen> createState() =>
      _GoalieAvailableGameScreenState();
}

class _GoalieAvailableGameScreenState extends State<GoalieAvailableGameScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      log("running ");

      // Reload the screen when the app resumes (screen is visible again)
      await Get.find<GoalieController>().allGoalieScheduleApi();
      await Get.find<CommonController>().goalieAllRatingApi(filed: "goalie");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          ImageConst.topBackImage,
          scale: 5,
        ),
      ),
      body: Container(
        width: screenWidth(context),
        height: screenHeight(context),
        decoration: decoration(),
        child: GetBuilder<GoalieController>(
          initState: (_) {
            Future.microtask(() => _.controller!.allGoalieScheduleApi());
          },
          builder: (GoalieController controller) {
            if (controller.loadingAbiGame) {
              return const Center(
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.red,
                ),
              );
            } else if (controller.gameAvailableModel != null &&
                controller.gameAvailableModel!.success == "1") {
              return Column(
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  GetBuilder<CommonController>(
                    builder: (CommonController controller) {
                      if (controller.goalieRatingModel != null) {
                        var data = controller.goalieRatingModel!.data;
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            decoration: dec,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Column(
                                      children: <Widget>[
                                        const Text("Available"),
                                        Text(
                                          "(${data!.availabel})",
                                          style: TextStyle(
                                              color: data.availabel != "0"
                                                  ? Colors.green
                                                  : null),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.back();
                                      Get.to(() =>
                                          const GoalieScheduledGameScreen());
                                    },
                                    child: Column(
                                      children: <Widget>[
                                        const Text("Scheduled"),
                                        Text(
                                          "(${data.schedule})",
                                          style: TextStyle(
                                              color: data.schedule != "0"
                                                  ? Colors.green
                                                  : null),
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.back();
                                      Get.to(() =>
                                          const GoalieHistoryGameScreen());
                                    },
                                    child: Column(
                                      children: <Widget>[
                                        const Text("History"),
                                        Text("(${data.history})"),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("Available Games"),
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.gameAvailableModel!.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        var data = controller.gameAvailableModel!.data![index];
                        DateTime initialDate =
                            DateTime.parse(data.gameDatetime.toString());
                        String formattedDate =
                            DateFormat("EEEE MMM dd, yyyy 'at' hh:mm a")
                                .format(initialDate);

                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 7.5),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() => AvailableGameDetailsScreen(
                                    data: data,
                                  ));
                            },
                            child: Container(
                              decoration: dec,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ListTile(
                                    leading: CircleAvatar(
                                      radius: 10,
                                      backgroundColor: data.isInterested == "1"
                                          ? Colors.green
                                          : AppColor.primary,
                                    ),
                                    title: Text(
                                      formattedDate,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data.rink.toString(),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "${data.gameDuration} min",
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                            const Spacer(),
                                            Text(
                                              "${data.caliber} Caliber",
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else if (controller.gameAvailableModel != null &&
                controller.gameAvailableModel!.success == "0") {
              return centerHeadingText(context,
                  "There are no games currently available in your area.");
            }
            // return const Center(
            //     child: Text(
            //         "There are no games currently available in your area."));

            return const Center(
                child: CircularProgressIndicator.adaptive(
                    backgroundColor: Colors.red));
          },
        ),
      ),
    );
  }
}
