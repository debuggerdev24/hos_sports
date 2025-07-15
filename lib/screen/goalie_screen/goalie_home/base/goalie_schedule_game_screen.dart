import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hos_sports/screen/goalie_screen/goalie_home/base/scheduled_game_details.dart';
import 'package:hos_sports/service/controller/goalie_controller.dart';
import 'package:hos_sports/widgets/widgets.dart';
import 'package:intl/intl.dart';

import '../../../../widgets/other_widgets.dart';

class GoalieScheduledGameScreen extends StatefulWidget {
  const GoalieScheduledGameScreen({super.key});

  @override
  State<GoalieScheduledGameScreen> createState() =>
      _GoalieScheduledGameScreenState();
}

class _GoalieScheduledGameScreenState extends State<GoalieScheduledGameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Game Scheduled"),
      ),
      body: Container(
        width: screenWidth(context),
        height: screenHeight(context),
        decoration: decoration(),
        child: GetBuilder<GoalieController>(
          initState: (_) {
            Future.microtask(
                () => _.controller!.selectGoaliesScheduleListApi());
          },
          builder: (GoalieController controller) {
            if (controller.gameScheduledModel != null &&
                controller.gameScheduledModel!.success == "1") {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.gameScheduledModel!.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        var data = controller.gameScheduledModel!.data![index];
                        DateTime initialDate =
                            DateTime.parse(data.gameDatetime.toString());
                        String formattedDate =
                            DateFormat("EEEE MMM dd, yyyy 'at' hh:mm a")
                                .format(initialDate);

                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() => ScheduledGameDetailsScreen(
                                    data: data,
                                  ));
                            },
                            child: Container(
                              decoration: dec,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: GameCardWidget(
                                    date: formattedDate,
                                    teamName: data.teamName.toString(),
                                    caliber: data.caliber.toString(),
                                    format: data.format.toString(),
                                    gameDuration: data.gameDuration.toString()),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else if (controller.gameScheduledModel != null &&
                controller.gameScheduledModel!.success == "0") {
              return centerHeadingText(context,
                  "You currently do not have any upcoming games scheduled.");
              // return const Center(
              //     child: Text(
              //   "You currently do not have any upcoming games scheduled.",
              //   textAlign: TextAlign.center,
              // ));
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
