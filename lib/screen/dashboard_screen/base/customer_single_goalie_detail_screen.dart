import 'dart:async';
import 'dart:developer';
import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hos_sports/screen/dashboard_screen/dashboard_screen.dart';
import 'package:hos_sports/service/controller/customer_controller.dart';
import 'package:hos_sports/widgets/widgets.dart';

import '../../../service/model/AllGoalieInterestedModel.dart';

class CustomerSingleGoalieDetailScreen extends StatefulWidget {
  final dynamic goalieData;
  final String? scheduleId;

  const CustomerSingleGoalieDetailScreen(
      {super.key, required this.goalieData, this.scheduleId});

  @override
  State<CustomerSingleGoalieDetailScreen> createState() =>
      _CustomerSingleGoalieDetailScreenState();
}

class _CustomerSingleGoalieDetailScreenState
    extends State<CustomerSingleGoalieDetailScreen> {
  //
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    var goalieData = widget.goalieData;
    print(goalieData.feedback);
    return BlurryModalProgressHUD(
      inAsyncCall: loading,
      blurEffectIntensity: 4,
      // progressIndicator: SpinKitFadingCircle(
      //   color: Colors.red,
      //   size: 90.0,
      // ),
      dismissible: false,
      opacity: 0.4,
      color: Colors.black,
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                Container(
                  decoration: dec,
                  child: ListTile(
                    onTap: () {},
                    leading: SizedBox(
                        width: 50,
                        height: 50,
                        child: CustomImage(
                          url: goalieData.profilePic.toString(),
                          radius: 10,
                        )),
                    title: Text(
                        "${goalieData.firstname} ${goalieData.lastname![0]}"),
                    subtitle: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // if(goalieData.interestId != null)

                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Select This Goalie"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        OutlinedButton(
                            onPressed: () async {
                              setState(() {
                                loading = true; 
                                
                              });

                              await Future.microtask(() => Get.find<
                                      CustomerController>()
                                  .goaliesAvailableNextGameCustomerSelectionApi(
                                      context,
                                      scheduleId:
                                          '${widget.scheduleId ?? goalieData.scheduleId}',
                                      goalieId: '${goalieData.userId}',
                                      approvalStatus: '1')).then((value) {
                                setState(() {
                                  loading = false;
                                });
                                Get.offAll(() => const DashboardScreen());
                              });
                            },
                            child: const Text("Yes")),
                        OutlinedButton(
                            onPressed: () async {
                              setState(() {
                                loading = true;
                              });
                              await Future.microtask(() => Get.find<
                                      CustomerController>()
                                  .goaliesAvailableNextGameCustomerSelectionApi(
                                      context,
                                      scheduleId:
                                          '${widget.scheduleId ?? goalieData.scheduleId}',
                                      goalieId: '${goalieData.userId}',
                                      approvalStatus: '0')).then((value) {
                                setState(() {
                                  loading = false;
                                });
                                Get.offAll(() => const DashboardScreen());
                              });
                            },
                            child: const Text("No")),
                      ],
                    ),
                  ],
                ),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.stretch,
                //   children: [
                //     const SizedBox(
                //       height: 10,
                //     ),
                //     OutlinedButton(
                //         onPressed: () {}, child: const Text("Selected")),
                //     const SizedBox(
                //       height: 10,
                //     ),
                //   ],
                // ),
                if (goalieData.feedback.toString() != "Feedback not found.")
                  Column(
                    children: [
                      const Text("Goalie Feedback"),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: dec,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: goalieData.feedback!
                              .split("|")
                              .map<Widget>((e) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("•  " + e),
                                  ))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
