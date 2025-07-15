import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hos_sports/screen/dashboard_screen/base/customer_interested_goalie_screen.dart';
import 'package:hos_sports/service/controller/common_controller.dart';
import 'package:hos_sports/service/controller/customer_controller.dart';
import 'package:intl/intl.dart';
import '../../../../service/model/AllGoalieInterestedModel.dart';
import '../../../../service/model/CustomerScheduleGoalieModel.dart' as game;
import '../../../../widgets/other_widgets.dart';
import '../../../../widgets/widgets.dart';
import '../../../schedule_game/schedule_form.dart';

class CustomerSubmittedGameScreen extends StatefulWidget {
  const CustomerSubmittedGameScreen({super.key});

  @override
  State<CustomerSubmittedGameScreen> createState() =>
      _CustomerSubmittedGameScreenState();
}

class _CustomerSubmittedGameScreenState
    extends State<CustomerSubmittedGameScreen> with WidgetsBindingObserver {
  //

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    Future.microtask(() =>
        Get.find<CommonController>().goalieAllRatingApi(filed: "customer"));
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // Reload the screen when the app resumes (screen is visible again)
      Get.find<CustomerController>().customerScheduleGoalieApi();
    }
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Game Submitted"),
      ),
      body: Container(
        width: screenWidth(context),
        height: screenHeight(context),
        decoration: decoration(),
        child: GetBuilder<CustomerController>(
          initState: (_) {
            Future.microtask(() => _.controller!.allCustomerScheduleApi());
          },
          builder: (CustomerController controller) {
            if (controller.loading) {
              return const Center(
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.red,
                ),
              );
            } else if (controller.customerScheduleGameModel != null &&
                controller.customerScheduleGameModel!.success == "1") {
              return Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      itemCount:
                          controller.customerScheduleGameModel!.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        var data =
                            controller.customerScheduleGameModel!.data![index];
                        DateTime initialDate =
                            DateTime.parse(data.gameDatetime.toString());
                        String formattedDate =
                            DateFormat("EEEE MMM dd, yyyy 'at' hh:mm a")
                                .format(initialDate);

                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 7.5),
                          child: Container(
                            decoration: dec,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      GetBuilder<CustomerController>(
                                        initState: (_) {
                                          Future.microtask(() =>
                                              controller.allGoalieInterestedApi(
                                                  scheduleId: data.scheduleId
                                                      .toString()));
                                        },
                                        builder:
                                            (CustomerController controller) {
                                          if (controller
                                                  .allGoalieInterestedModel !=
                                              null) {
                                            return CircleAvatar(
                                              radius: 10,
                                              backgroundColor: controller
                                                          .allGoalieInterestedModel!
                                                          .data !=
                                                      null
                                                  ? Colors.green
                                                  : Colors.red,
                                            );
                                          } else {
                                            return const CircleAvatar(
                                              radius: 10,
                                              backgroundColor: Colors.red,
                                            );
                                          }
                                        },
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: GameCardWidget(
                                            date: formattedDate,
                                            teamName: data.teamName.toString(),
                                            caliber: data.caliber.toString(),
                                            format: data.format.toString(),
                                            gameDuration:
                                                data.gameDuration.toString()),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      OutlinedButton(
                                          onPressed: () {
                                            Get.to(() =>
                                                CustomerGoalieInterestedScreen(
                                                  scheduleId: data.scheduleId
                                                      .toString(),
                                                  data: data,
                                                ));
                                          },
                                          child: const Text("Select Goalie")),
                                      OutlinedButton(
                                          onPressed: () {
                                            log(data.toJson().toString());
                                            // var d = game
                                            //         .CustomerScheduleGoalieModel
                                            //     .fromJson(controller
                                            //         .customerScheduleGameModel!
                                            //         .toJson());

                                            Get.to(() => ScheduleGameForm(
                                                  data: data,
                                                ));
                                          },
                                          child: const Text("Edit Game")),
                                    ],
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
            } else if (controller.customerScheduleGameModel != null &&
                controller.customerScheduleGameModel!.success == "0") {
              return centerHeadingText(
                  context, "You currently have no games submitted");
              // return const Center(child: Text("No Game Available"));
            }
            return const Center(
                child: CircularProgressIndicator.adaptive(
                    backgroundColor: Colors.red));
          },
        ),
      ),
    );
  }
}
