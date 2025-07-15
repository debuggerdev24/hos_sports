import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hos_sports/service/controller/goalie_controller.dart';
import 'package:hos_sports/widgets/widgets.dart';
import 'package:intl/intl.dart';

class GoalieCancelGameScreen extends StatefulWidget {
  const GoalieCancelGameScreen({super.key});

  @override
  State<GoalieCancelGameScreen> createState() => _GoalieCancelGameScreenState();
}

class _GoalieCancelGameScreenState extends State<GoalieCancelGameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Game Cancelled"),
      ),
      body: Container(
        width: screenWidth(context),
        height: screenHeight(context),
        decoration: decoration(),
        child: GetBuilder<GoalieController>(
          initState: (_) {
            Future.microtask(() => _.controller!.goaliesCancelGameApi());
          },
          builder: (GoalieController controller) {
            if (controller.gameCancelModel != null) {
              if (controller.gameCancelModel!.success == "1") {
                // Filter the data to only include cancelled games
                var cancelledGames = controller.gameCancelModel!.data
                    ?.where((data) => data.icIsCancel == "1")
                    .toList();

                if (cancelledGames == null || cancelledGames.isEmpty) {
                  return centerHeadingText(context,
                      "Thank you for following through with all game commitments");
                }

                return Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView.builder(
                        itemCount: cancelledGames.length,
                        itemBuilder: (BuildContext context, int index) {
                          var data = cancelledGames[index];
                          DateTime initialDate =
                              DateTime.parse(data.gameDatetime.toString());
                          String formattedDate =
                              DateFormat("EEEE MMM dd, yyyy 'at' hh:mm a")
                                  .format(initialDate);

                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 13, vertical: 7.5),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                border:
                                    Border.all(color: const Color(0xffDCD4D4)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 11),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            formattedDate,
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                        Text(
                                          "${data.caliber} Caliber",
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "Team: ${data.teamName}",
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                        Text(
                                          "${data.gameDuration} min",
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              } else {
                return centerHeadingText(context,
                    "Thank you for following through with all game commitments");
              }
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
