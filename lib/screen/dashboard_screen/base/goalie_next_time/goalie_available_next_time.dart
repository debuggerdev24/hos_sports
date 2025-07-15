import 'dart:developer';

import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hos_sports/screen/dashboard_screen/dashboard_screen.dart';
import 'package:hos_sports/service/controller/customer_controller.dart';
import 'package:hos_sports/service/model/CheckRickWithoutGoalie.dart';
import 'package:hos_sports/widgets/other_widgets.dart';
import 'package:intl/intl.dart';
import '../../../../service/model/AllGoalieInterestedModel.dart';
import '../../../../widgets/widgets.dart';
import '../customer_single_goalie_detail_screen.dart';

class GoalieAvailableNextTime extends StatefulWidget {
  const GoalieAvailableNextTime({super.key});

  @override
  State<GoalieAvailableNextTime> createState() =>
      _GoalieAvailableNextTimeState();
}

class _GoalieAvailableNextTimeState extends State<GoalieAvailableNextTime> {
  //
  bool loading = false;
  //

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Goalies available for your next time"),
      ),
      body: BlurryModalProgressHUD(
        inAsyncCall: loading,
        blurEffectIntensity: 4,
        progressIndicator:
            CircularProgressIndicator.adaptive(backgroundColor: Colors.red),
        dismissible: false,
        opacity: 0.4,
        color: Colors.black,
        child: Container(
          width: screenWidth(context),
          height: screenHeight(context),
          decoration: decoration(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: GetBuilder<CustomerController>(
              initState: (_) {
                Future.microtask(
                    () => _.controller!.goaliesAvailableRinkGameApi());
                // Future.microtask(
                //     () => _.controller!.customerScheduleGoalieApi());
              },
              builder: (CustomerController controller) {
                if (controller.loadingNewGame) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(
                      backgroundColor: Colors.red,
                    ),
                  );
                } else if (controller.goalieAvailableRickTime != null) {
                  if (controller.goalieAvailableRickTime!.success == "1") {
                    return ListView.builder(
                      itemCount:
                          controller.goalieAvailableRickTime!.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        var data =
                            controller.goalieAvailableRickTime!.data![index];
                        DateTime initialDate = DateTime.parse(controller
                            .goalieAvailableRickTime!.data![index].gameDatetime
                            .toString());

                        String formattedDate =
                            DateFormat("EEEE MMM dd, yyyy 'at' hh:mm a")
                                .format(initialDate);
                        // log("Json Data_______" + data.toJson().toString());
                        // log("initial Data_______" +
                        //     controller.goalieAvailableRickTime!.gameDetails!
                        //         .gameDatetime
                        //         .toString());

                        return Container(
                          decoration: dec,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                SizedBox(height: 10),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        const SizedBox(width: 10),
                                        if (controller.goalieAvailableRickTime!
                                            .lastInterestId!.isEmpty)
                                          Expanded(
                                            child: GameCardWidget(
                                              date: formattedDate.toString(),
                                              teamName: controller
                                                  .goalieAvailableRickTime!
                                                  .data![index]
                                                  .teamName
                                                  .toString(),
                                              format: controller
                                                  .goalieAvailableRickTime!
                                                  .data![index]
                                                  .format
                                                  .toString(),
                                              caliber: controller
                                                  .goalieAvailableRickTime!
                                                  .data![index]
                                                  .caliber
                                                  .toString(),
                                              gameDuration: controller
                                                  .goalieAvailableRickTime!
                                                  .data![index]
                                                  .gameDuration
                                                  .toString(),
                                            ),
                                          ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    if (controller.goalieAvailableRickTime!
                                        .lastInterestId!.isNotEmpty)
                                      Container(
                                        // width: screenWidth(context),
                                        // height: screenHeight(context) / 2.2,
                                        child: GetBuilder<CustomerController>(
                                          initState: (_) {
                                            Future.microtask(() => _.controller!
                                                .allGoalieInterestedApi(
                                                    scheduleId: controller
                                                        .goalieAvailableRickTime!
                                                        .data!
                                                        .first
                                                        .scheduleId
                                                        .toString()));
                                          },
                                          builder:
                                              (CustomerController controller) {
                                            if (controller
                                                        .allGoalieInterestedModel !=
                                                    null &&
                                                controller
                                                        .allGoalieInterestedModel!
                                                        .data !=
                                                    null) {
                                              var list = controller
                                                  .allGoalieInterestedModel!
                                                  .data!;
                                              DateTime initialDate =
                                                  DateTime.parse(data
                                                      .gameDatetime
                                                      .toString());
                                              String formattedDate = DateFormat(
                                                      "EEEE MMM dd, yyyy 'at' hh:mm a")
                                                  .format(initialDate);

                                              return Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: <Widget>[
                                                    Container(
                                                      decoration: dec,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: GameCardWidget(
                                                            date: formattedDate,
                                                            teamName: data
                                                                .teamName
                                                                .toString(),
                                                            caliber: data
                                                                .caliber
                                                                .toString(),
                                                            format: data.format
                                                                .toString(),
                                                            gameDuration: data
                                                                .gameDuration
                                                                .toString()),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Container(
                                                      decoration: dec,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                            "Special Instructions: ${data.instruction}"),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    const Center(
                                                        child: Text(
                                                            "Available Goalies")),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    ListView.builder(
                                                      physics:
                                                          NeverScrollableScrollPhysics(),
                                                      itemCount: list.length,
                                                      shrinkWrap: true,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        var goalieData =
                                                            list[index];
                                                        int? ageData =
                                                            int.tryParse(
                                                                goalieData
                                                                    .age!);
                                                        return Container(
                                                          decoration: dec,
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 7),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        10,
                                                                    horizontal:
                                                                        10),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .stretch,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Container(
                                                                      width: 80,
                                                                      height:
                                                                          80,
                                                                      child:
                                                                          CustomImage(
                                                                        url: goalieData
                                                                            .profilePic
                                                                            .toString(),
                                                                        radius:
                                                                            10,
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                      width: 10,
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          Row(
                                                                            children: [
                                                                              Text(
                                                                                textAlign: TextAlign.start,
                                                                                "${goalieData.firstname} ${goalieData.lastname![0]}",
                                                                                style: const TextStyle(color: Colors.white),
                                                                              ),
                                                                              Spacer(),
                                                                              if (ageData! >= 40)
                                                                                Text(
                                                                                  textAlign: TextAlign.end,
                                                                                  "Over 40",
                                                                                  style: const TextStyle(color: Colors.white),
                                                                                ),
                                                                              if (goalieData.isFavorite != "0")
                                                                                Text(","),
                                                                              if (goalieData.isFavorite != "0")
                                                                                const SizedBox(width: 5),
                                                                              if (goalieData.isFavorite != "0")
                                                                                Icon(
                                                                                  Icons.favorite_rounded,
                                                                                  color: Colors.red,
                                                                                  size: 18,
                                                                                )
                                                                            ],
                                                                          ),
                                                                          const SizedBox(
                                                                              height: 10),
                                                                          Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Column(
                                                                                children: <Widget>[
                                                                                  const Text(
                                                                                    "Rating",
                                                                                    style: TextStyle(color: Colors.white),
                                                                                  ),
                                                                                  Text(
                                                                                    "${goalieData.rating}",
                                                                                    style: const TextStyle(color: Colors.white),
                                                                                  )
                                                                                ],
                                                                              ),
                                                                              Column(
                                                                                children: <Widget>[
                                                                                  const Text(
                                                                                    "Caliber",
                                                                                    style: TextStyle(color: Colors.white),
                                                                                  ),
                                                                                  Text(
                                                                                    "${goalieData.calibre}",
                                                                                    style: const TextStyle(color: Colors.white),
                                                                                  )
                                                                                ],
                                                                              ),
                                                                              Column(
                                                                                children: <Widget>[
                                                                                  const Text(
                                                                                    "Games",
                                                                                    style: TextStyle(color: Colors.white),
                                                                                  ),
                                                                                  Text(
                                                                                    "${goalieData.totalgame}",
                                                                                    style: const TextStyle(color: Colors.white),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                                Column(
                                                                  children: [
                                                                    const SizedBox(
                                                                        height:
                                                                            7),
                                                                    const Text(
                                                                      "Select This Goalie",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                    const SizedBox(
                                                                        height:
                                                                            5),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceAround,
                                                                      children: [
                                                                        OutlinedButton(
                                                                            onPressed:
                                                                                () async {
                                                                              setState(() {
                                                                                loading = true;
                                                                              });

                                                                              await Future.microtask(() => Get.find<CustomerController>().goaliesAvailableNextGameCustomerSelectionApi(context, scheduleId: '${goalieData.scheduleId}', goalieId: '${goalieData.userId}', approvalStatus: '1')).then((value) {
                                                                                setState(() {
                                                                                  loading = false;
                                                                                });
                                                                                Get.offAll(() => const DashboardScreen());
                                                                              });
                                                                            },
                                                                            child:
                                                                                const Text("Yes")),
                                                                        OutlinedButton(
                                                                            onPressed:
                                                                                () async {
                                                                              setState(() {
                                                                                loading = true;
                                                                              });
                                                                              await Future.microtask(() => Get.find<CustomerController>().goaliesAvailableNextGameCustomerSelectionApi(context, scheduleId: '${goalieData.scheduleId}', goalieId: '${goalieData.userId}', approvalStatus: '0')).then((value) {
                                                                                setState(() {
                                                                                  loading = false;
                                                                                });
                                                                                Get.offAll(() => const DashboardScreen());
                                                                              });
                                                                            },
                                                                            child:
                                                                                const Text("No")),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              );
                                            } else if (controller
                                                        .allGoalieInterestedModel !=
                                                    null &&
                                                controller
                                                        .allGoalieInterestedModel!
                                                        .data ==
                                                    null) {
                                              // return const Center(child: Text("No Goalie"));
                                              return centerHeadingText(context,
                                                  "Please text (416) 807-3138, if there is less than 4 hours until your game time and you need assistance");
                                            }

                                            return const Center(
                                                child: CircularProgressIndicator
                                                    .adaptive(
                                                        backgroundColor:
                                                            Colors.red));
                                          },
                                        ),
                                      ),
                                    if (data.selectedGoalie != null)
                                      Container(
                                          decoration: dec,
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: SizedBox(
                                                    width: 60,
                                                    height: 60,
                                                    child: CustomImage(
                                                      url: data.selectedGoalie!
                                                          .profilePic
                                                          .toString(),
                                                      radius: 5,
                                                    )),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                            "${data.selectedGoalie!.firstname} ${data.selectedGoalie!.lastname![0].toString()}"),
                                                        const Spacer(),
                                                        if (data.selectedGoalie!
                                                                .ashlRegister ==
                                                            "1")
                                                          const Text(
                                                              "ASHL REGISTERED")
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          children: [
                                                            const Text(
                                                                "Rating"),
                                                            Text(
                                                                "${data.selectedGoalie!.rating}"),
                                                          ],
                                                        ),
                                                        Column(
                                                          children: [
                                                            const Text(
                                                                "Caliber"),
                                                            Text(
                                                                "${data.selectedGoalie!.calibre}"),
                                                          ],
                                                        ),
                                                        Column(
                                                          children: [
                                                            const Text("Games"),
                                                            Text(
                                                                "${data.selectedGoalie!.totalGame}"),
                                                          ],
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                            ],
                                          )),
                                    SizedBox(height: 7),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Container(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 50),
                          child: Card(
                            color: Colors.black.withOpacity(.5),
                            shape: RoundedRectangleBorder(
                                side: const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(10)),
                            child: const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                "Please text (416) 807-3138, if there is less than 4 hours until your game time and you need assistance",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                } else {
                  return const Center(
                      child: CircularProgressIndicator.adaptive(
                          backgroundColor: Colors.red));
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
