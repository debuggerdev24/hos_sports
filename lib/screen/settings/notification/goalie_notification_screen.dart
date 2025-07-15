import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hos_sports/service/controller/goalie_controller.dart';
import 'package:hos_sports/widgets/constants.dart';
import 'package:hos_sports/widgets/toast.dart';
import 'package:hos_sports/widgets/widgets.dart';

class GoalieNotificationScreen extends StatefulWidget {
  final String type;

  const GoalieNotificationScreen({super.key, required this.type});

  @override
  State<GoalieNotificationScreen> createState() =>
      _GoalieNotificationScreenState();
}

class _GoalieNotificationScreenState extends State<GoalieNotificationScreen> {
  bool isAvailableNewGame = false;
  bool isAvailableWasSelected = false;
  bool scheduleGameCanceled = false;
  bool scheduleChange = false;
  bool twoHoursScheduleGame = false;
  bool twentyMinutesBefore = false;
  bool isAvailableNewPromotion = false;
  bool feedback = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          ImageConst.topBackImage,
          scale: 5,
        ),
      ),
      body: GetBuilder<GoalieController>(
        initState: (_) {
          Future.microtask(() => _.controller!.userGoalieNotificationSettingApi(
              false,
              notification: widget.type)).then((v) {
            if (v.success == "1") {
              isAvailableNewGame = v.data!.isAvailabelNewGame == "1";
              isAvailableWasSelected = v.data!.isAvailabelWasSelected == "1";
              scheduleGameCanceled = v.data!.scheduleGameCanceled == "1";
              scheduleChange = v.data!.scheduleChange == "1";
              twoHoursScheduleGame = v.data!.HoursScheduleGame == "1";
              twentyMinutesBefore = v.data!.MinutesBefore == "1";
              isAvailableNewPromotion = v.data!.isAvailableNewPromotion == "1";
              feedback = v.data!.feedback == "1";
              setState(() {});
            }
          });
        },
        builder: (GoalieController controller) {
          return Container(
            decoration: decoration(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  NotificationTiles(
                    title: "A new game is available",
                    value: isAvailableNewGame,
                    onChanged: (val) {
                      isAvailableNewGame = !isAvailableNewGame;
                      setState(() {

                      });
                    },
                  ),
                  NotificationTiles(
                    title: "I was selected for an available game",
                    value: isAvailableWasSelected,
                    onChanged: (val) {
                      isAvailableWasSelected = !isAvailableWasSelected;
                      setState(() {

                      });
                    },
                  ),
                  NotificationTiles(
                    title: "A scheduled game was canceled",
                    value: scheduleGameCanceled,
                    onChanged: (val) {
                      scheduleGameCanceled = !scheduleGameCanceled;
                      setState(() {

                      });
                    },
                  ),
                  NotificationTiles(
                    title: "The value of a game I am scheduled for has changed",
                    value: scheduleChange,
                    onChanged: (val) {
                      scheduleChange = !scheduleChange;
                      setState(() {

                      });
                    },
                  ),
                  NotificationTiles(
                    title: "Reminder 2 hours prior to a scheduled game",
                    value: twoHoursScheduleGame,
                    onChanged: (val) {
                      twoHoursScheduleGame = !twoHoursScheduleGame;
                      setState(() {

                      });
                    },
                  ),
                  NotificationTiles(
                    title:
                        "Reminder 20 minutes before game time to 'check-in' at rink",
                    value: twentyMinutesBefore,
                    onChanged: (val) {
                      twentyMinutesBefore = !twentyMinutesBefore;
                      setState(() {

                      });
                    },
                  ),
                  NotificationTiles(
                    title: "A new promotion is available",
                    value: isAvailableNewPromotion,
                    onChanged: (val) {
                      isAvailableNewPromotion = !isAvailableNewPromotion;
                      setState(() {

                      });
                    },
                  ),
                  NotificationTiles(
                    title: "I have outstanding feedback",
                    value: feedback,
                    onChanged: (val) {
                      feedback = !feedback;
                      setState(() {

                      });
                    },
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Future.microtask(
                            () => controller.userGoalieNotificationSettingApi(
                                  true,
                                  notification: widget.type,
                                  isAvailableNewGame:
                                      isAvailableNewGame ? "1" : "0",
                                  isAvailableWasSelected:
                                      isAvailableWasSelected ? "1" : "0",
                                  scheduleGameCanceled:
                                      scheduleGameCanceled ? "1" : "0",
                                  scheduleChange: scheduleChange ? "1" : "0",
                                  twoHoursScheduleGame:
                                      twoHoursScheduleGame ? "1" : "0",
                                  twentyMinutesBefore:
                                      twentyMinutesBefore ? "1" : "0",
                                  isAvailableNewPromotion:
                                      isAvailableNewPromotion ? "1" : "0",
                                  feedback: feedback ? "1" : "0",
                                )).then((v) {
                          if (v.success == "1") {
                            showSnackBar(context, "Updated");
                            isAvailableNewGame =
                                v.data!.isAvailabelNewGame == "1";
                            isAvailableWasSelected =
                                v.data!.isAvailabelWasSelected == "1";
                            scheduleGameCanceled =
                                v.data!.scheduleGameCanceled == "1";
                            scheduleChange = v.data!.scheduleChange == "1";
                            twoHoursScheduleGame =
                                v.data!.HoursScheduleGame == "1";
                            twentyMinutesBefore = v.data!.MinutesBefore == "1";
                            isAvailableNewPromotion =
                                v.data!.isAvailableNewPromotion == "1";
                            feedback = v.data!.feedback == "1";
                            setState(() {});
                          }
                        });
                      },
                      child: const Text("Save"))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
