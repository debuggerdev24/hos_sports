import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hos_sports/screen/dashboard_screen/base/customer_interested_goalie_screen.dart';
import 'package:hos_sports/screen/goalie_screen/goalie_home/base/scheduled_game_details.dart';
import 'package:hos_sports/service/controller/common_controller.dart';
import 'package:hos_sports/service/controller/customer_controller.dart';
import 'package:intl/intl.dart';
import '../../../../widgets/widgets.dart';
import '../../../schedule_game/schedule_form.dart';
import '../customer_selected_interest_goalie_screen.dart';

class CustomerCancelGameScreen extends StatefulWidget {
  const CustomerCancelGameScreen({super.key});

  @override
  State<CustomerCancelGameScreen> createState() =>
      _CustomerCancelGameScreenState();
}

class _CustomerCancelGameScreenState extends State<CustomerCancelGameScreen> {
//

  @override
  void dispose() {
    Future.microtask(() =>
        Get.find<CommonController>().goalieAllRatingApi(filed: "customer"));

    super.dispose();
  }

//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Game Cancel"),
      ),
      body: Container(
        width: screenWidth(context),
        height: screenHeight(context),
        decoration: decoration(),
        child: GetBuilder<CustomerController>(
          initState: (_) {
            Future.microtask(() => _.controller!.customerCancelGameListApi());
          },
          builder: (CustomerController controller) {
            if (controller.customerCancelGameModel != null &&
                controller.customerCancelGameModel!.success == "1") {
              // **Filter data: Only include items where cancelGoalieId == "0"**
              var cancelledGames = controller.customerCancelGameModel!.data
                  ?.where((data) => data.cancelGoalieId == "0")
                  .toList();

              // **If all games are cancelled, show a message**
              if (cancelledGames == null || cancelledGames.isEmpty) {
                return centerHeadingText(
                  context,
                  "Thank you for following through with all game commitments",
                );
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
                              horizontal: 20, vertical: 7.5),
                          child: GestureDetector(
                            onTap: () {
                              // Navigate to details screen
                              // Get.to(
                              //     () => ScheduledGameDetailsScreen(data: data));
                            },
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
                                  const SizedBox(height: 5),
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
            } else if (controller.customerCancelGameModel != null &&
                controller.customerCancelGameModel!.success == "0") {
              return centerHeadingText(
                context,
                "Thank you for following through with all game commitments",
              );
            } else {
              return const Center(
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
