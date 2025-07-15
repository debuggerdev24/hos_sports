import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hos_sports/service/controller/common_controller.dart';
import 'package:hos_sports/service/controller/customer_controller.dart';
import 'package:intl/intl.dart';
import '../../../../widgets/other_widgets.dart';
import '../../../../widgets/widgets.dart';
import '../../../schedule_game/schedule_form.dart';
import '../customer_selected_interest_goalie_screen.dart';

class CustomerScheduleGameScreen extends StatefulWidget {
  const CustomerScheduleGameScreen({super.key});

  @override
  State<CustomerScheduleGameScreen> createState() =>
      _CustomerScheduleGameScreenState();
}

class _CustomerScheduleGameScreenState extends State<CustomerScheduleGameScreen>
    with WidgetsBindingObserver {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Game Schedule"),
      ),
      body: Container(
        width: screenWidth(context),
        height: screenHeight(context),
        decoration: decoration(),
        child: GetBuilder<CustomerController>(
          initState: (_) {
            Future.microtask(() => _.controller!.customerScheduleGoalieApi());
          },
          builder: (CustomerController controller) {
            if (controller.loadingSchedule) {
              return const Center(
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.red,
                ),
              );
            } else if (controller.customerScheduleGoalieModel != null &&
                controller.customerScheduleGoalieModel!.success == "1") {
              return Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      itemCount:
                          controller.customerScheduleGoalieModel!.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        var data = controller
                            .customerScheduleGoalieModel!.data![index];
                        DateTime initialDate =
                            DateTime.parse(data.gameDatetime.toString());
                        String formattedDate =
                            DateFormat("EEEE MMM dd, yyyy 'at' hh:mm a")
                                .format(initialDate);

                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Container(
                            decoration: dec,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GameCardWidget(
                                      date: formattedDate,
                                      teamName: data.teamName.toString(),
                                      caliber: data.caliber.toString(),
                                      format: data.format.toString(),
                                      gameDuration:
                                          data.gameDuration.toString()),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      OutlinedButton(
                                          onPressed: () {
                                            Get.to(() =>
                                                CustomerSelectedGoalieInterestedScreen(
                                                  scheduleId: data.scheduleId
                                                      .toString(),
                                                  data: data,
                                                ));
                                          },
                                          child: const Text("Goalie")),
                                      OutlinedButton(
                                          onPressed: () {
                                            log(data.toJson().toString());
                                            Get.to(() => ScheduleGameForm(
                                                  data: data,
                                                ))?.then((_) {
                                              // Reload the screen after coming back from Edit Game form
                                              Get.find<CustomerController>()
                                                  .customerScheduleGoalieApi();
                                            });
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
            } else if (controller.customerScheduleGoalieModel != null &&
                controller.customerScheduleGoalieModel!.success == "0") {
              return centerHeadingText(
                  context, "There are no upcoming games currently scheduled");
              // return const Center(
              //     child:
              //         Text("There are no upcoming games currently scheduled"));
            } else {
              return const Center(
                  child: CircularProgressIndicator.adaptive(
                      backgroundColor: Colors.red));
            }
          },
        ),
      ),
    );
  }
}
