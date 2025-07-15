import 'dart:developer';

import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hos_sports/screen/dashboard_screen/dashboard_screen.dart';
import 'package:hos_sports/service/controller/common_controller.dart';
import 'package:hos_sports/service/controller/customer_controller.dart';
import 'package:hos_sports/widgets/widgets.dart';
import 'package:intl/intl.dart';

import '../../../service/model/CustomerScheduleGameModel.dart';
import '../../../widgets/other_widgets.dart';
import 'customer_single_goalie_detail_screen.dart';

class CustomerGoalieInterestedScreen extends StatefulWidget {
  final String scheduleId;
  final Data data;

  const CustomerGoalieInterestedScreen(
      {super.key, required this.scheduleId, required this.data});

  @override
  State<CustomerGoalieInterestedScreen> createState() =>
      _CustomerGoalieInterestedScreenState();
}

class _CustomerGoalieInterestedScreenState
    extends State<CustomerGoalieInterestedScreen> {
  //

  bool loading = false;
  //
  Decoration dec = BoxDecoration(
      color: Colors.black.withOpacity(.5),
      border: Border.all(color: Colors.white),
      borderRadius: BorderRadiusDirectional.circular(10));

  //
  @override
  void dispose() {
    Future.microtask(() =>
        Get.find<CommonController>().goalieAllRatingApi(filed: "customer"));
    Future.microtask(
        () => Get.find<CustomerController>().goaliesAvailableRinkGameApi());
    super.dispose();
  }

  //

  @override
  Widget build(BuildContext context) {
    var data = widget.data;
    return BlurryModalProgressHUD(
      inAsyncCall: loading,
      blurEffectIntensity: 4,
      progressIndicator: CircularProgressIndicator.adaptive(
        backgroundColor: Colors.red,
      ),
      dismissible: false,
      opacity: 0.4,
      color: Colors.black,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Select Goalie"),
        ),
        body: Container(
          width: screenWidth(context),
          height: screenHeight(context),
          decoration: decoration(),
          child: GetBuilder<CustomerController>(
            initState: (_) {
              Future.microtask(() => _.controller!
                  .allGoalieInterestedApi(scheduleId: widget.scheduleId));
            },
            builder: (CustomerController controller) {
              if (controller.loadingSubmitted) {
                log("checking from widget");
                return const Center(
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor: Colors.red,
                  ),
                );
              } else if (controller.allGoalieInterestedModel != null &&
                  controller.allGoalieInterestedModel!.data != null) {
                var list = controller.allGoalieInterestedModel!.data!;
                DateTime initialDate =
                    DateTime.parse(data.gameDatetime.toString());
                String formattedDate =
                    DateFormat("EEEE MMM dd, yyyy 'at' hh:mm a")
                        .format(initialDate);
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          decoration: dec,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GameCardWidget(
                                date: formattedDate,
                                teamName: data.teamName.toString(),
                                caliber: data.caliber.toString(),
                                format: data.format.toString(),
                                gameDuration: data.gameDuration.toString()),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: dec,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                "Special Instructions: ${data.instruction}"),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Center(child: Text("Available Goalies")),
                        const SizedBox(
                          height: 5,
                        ),
                        ListView.builder(
                          itemCount: list.length,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            var goalieData = list[index];
                            log(goalieData.toJson().toString());
                            int? ageData = int.tryParse(goalieData.age!);
                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              decoration: dec,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 80,
                                          height: 80,
                                          child: CustomImage(
                                            url: goalieData.profilePic
                                                .toString(),
                                            radius: 10,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    textAlign: TextAlign.start,
                                                    "${goalieData.firstname} ${goalieData.lastname![0]}",
                                                    style: const TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  Spacer(),
                                                  if (ageData! >= 40)
                                                    Text(
                                                      textAlign: TextAlign.end,
                                                      "Over 40",
                                                      style: const TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  if (goalieData.isFavorite !=
                                                      "0")
                                                    Text(","),
                                                  if (goalieData.isFavorite !=
                                                      "0")
                                                    const SizedBox(width: 10),
                                                  if (goalieData.isFavorite !=
                                                      "0")
                                                    Icon(Icons.favorite_rounded,
                                                        color: Colors.red,
                                                        size: 18)
                                                ],
                                              ),
                                              const SizedBox(height: 10),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    children: <Widget>[
                                                      const Text(
                                                        "Rating",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      Text(
                                                        "${goalieData.rating}",
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.white),
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    children: <Widget>[
                                                      const Text(
                                                        "Caliber",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      Text(
                                                        "${goalieData.calibre}",
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.white),
                                                      )
                                                    ],
                                                  ),
                                                  Column(
                                                    children: <Widget>[
                                                      const Text(
                                                        "Games",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      Text(
                                                        "${goalieData.totalgame}",
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.white),
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
                                        const SizedBox(height: 7),
                                        const Text(
                                          "Select This Goalie",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        const SizedBox(height: 5),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            OutlinedButton(
                                                onPressed: () async {
                                                  setState(() {
                                                    loading = true;
                                                  });

                                                  await Future.microtask(() => Get
                                                          .find<
                                                              CustomerController>()
                                                      .goaliesAvailableNextGameCustomerSelectionApi(
                                                          context,
                                                          scheduleId:
                                                              '${widget.scheduleId ?? goalieData.scheduleId}',
                                                          goalieId:
                                                              '${goalieData.userId}',
                                                          approvalStatus:
                                                              '1')).then(
                                                      (value) {
                                                    setState(() {
                                                      loading = false;
                                                    });
                                                    Get.offAll(() =>
                                                        const DashboardScreen());
                                                  });
                                                },
                                                child: const Text("Yes")),
                                            OutlinedButton(
                                                onPressed: () async {
                                                  setState(() {
                                                    loading = true;
                                                  });
                                                  await Future.microtask(() => Get
                                                          .find<
                                                              CustomerController>()
                                                      .goaliesAvailableNextGameCustomerSelectionApi(
                                                          context,
                                                          scheduleId:
                                                              '${widget.scheduleId ?? goalieData.scheduleId}',
                                                          goalieId:
                                                              '${goalieData.userId}',
                                                          approvalStatus:
                                                              '0')).then(
                                                      (value) {
                                                    setState(() {
                                                      loading = false;
                                                    });
                                                    Get.offAll(() =>
                                                        const DashboardScreen());
                                                  });
                                                },
                                                child: const Text("No")),
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
                  ),
                );
              } else if (controller.allGoalieInterestedModel != null &&
                  controller.allGoalieInterestedModel!.data == null) {
                // return const Center(child: Text("No Goalie"));
                return centerHeadingText(context,
                    "Please text (416) 807-3138, if there is less than 4 hours until your game time and you need assistance");
              }

              return const Center(
                  child: CircularProgressIndicator.adaptive(
                      backgroundColor: Colors.red));
            },
          ),
        ),
      ),
    );
  }
}
