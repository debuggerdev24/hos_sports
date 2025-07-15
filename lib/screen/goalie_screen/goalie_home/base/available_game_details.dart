import 'dart:async';

import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hos_sports/service/controller/common_controller.dart';
import 'package:hos_sports/service/controller/goalie_controller.dart';
import 'package:hos_sports/widgets/constants.dart';
import 'package:hos_sports/widgets/widgets.dart';
import 'package:intl/intl.dart';

import '../../../../service/model/GameAvailableModel.dart';

class AvailableGameDetailsScreen extends StatefulWidget {
  final Data data;

  const AvailableGameDetailsScreen({super.key, required this.data});

  @override
  State<AvailableGameDetailsScreen> createState() =>
      _AvailableGameDetailsScreenState();
}

class _AvailableGameDetailsScreenState
    extends State<AvailableGameDetailsScreen> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    DateTime initialDate = DateTime.parse(widget.data.gameDatetime.toString());
    String formattedDate =
        DateFormat("EEEE MMM dd, yyyy 'at' hh:mm a").format(initialDate);
    var data = widget.data;

    return BlurryModalProgressHUD(
      inAsyncCall: loading,
      blurEffectIntensity: 4,
      dismissible: false,
      opacity: 0.4,
      color: Colors.black,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Game Details"),
        ),
        body: Container(
          width: screenWidth(context),
          height: screenHeight(context),
          decoration: decoration(),
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Card(
                  color: Colors.black.withOpacity(.5),
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(child: Text(formattedDate)),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text("${data.caliber} Caliber"),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${data.format}"),
                            Text("${data.gameDuration} Minutes"),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Divider(),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Text("Collect From Client"),
                            const Spacer(),
                            Text(
                                "${priceConverter(amount: data.gamePayment.toString())}"),
                          ],
                        ),
                        Row(
                          children: [
                            const Text("Goalie's Cut"),
                            const Spacer(),
                            Text(
                                "${priceConverter(amount: "${int.parse(data.goalieCut.toString())}")}"),
                          ],
                        ),
                        // const Divider(
                        //   color: Colors.white,
                        // ),
                        // Text("Special Instructions: ${data.instruction}"),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    data.isInterested == "1"
                        ? SizedBox()
                        : Expanded(
                            child: OutlinedButton(
                                style: ButtonStyle(
                                    side: MaterialStateProperty.all(
                                      const BorderSide(color: Colors.white),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.black)),
                                onPressed: () async {
                                  setState(() {
                                    loading = true; // Start the loading state
                                  });

                                  // await Timer(Duration(seconds: 10), () {
                                  //   print(
                                  //       "Yeah, this line is printed after 10 seconds");

                                  //   // Set loading to false inside the timer callback
                                  //   setState(() {
                                  //     loading =
                                  //         false; // Stop the loading state after 10 seconds
                                  //   });
                                  // });

                                  await Future.microtask(() =>
                                      Get.find<GoalieController>()
                                          .goalieInterestedApi(context,
                                              scheduleId:
                                                  data.scheduleId.toString(),
                                              approvalStatus: "1",
                                              gameDateTime: data.gameDatetime
                                                  .toString())).then(
                                      (finalValue) async {
                                    await Future.microtask(() =>
                                            Get.find<GoalieController>()
                                                .allGoalieScheduleApi())
                                        .then((value) {
                                      Future.microtask(() =>
                                              Get.find<CommonController>()
                                                  .goalieAllRatingApi(
                                                      filed: "goalie"))
                                          .then((value) {
                                        setState(() {
                                          loading = false;
                                        });
                                        Get.back(result: true);
                                      });
                                    });
                                  });
                                },
                                child: Text(
                                  data.isInterested == "1"
                                      ? "YES"
                                      : "Interested",
                                  style: TextStyle(color: Colors.white),
                                ))),
                    SizedBox(
                      width: data.isInterested == "1" ? 0 : 10,
                    ),
                    Expanded(
                        child: OutlinedButton(
                            style: ButtonStyle(
                                side: MaterialStateProperty.all(
                                  BorderSide(
                                      color: data.isInterested == "1"
                                          ? AppColor.primary
                                          : Colors.white),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.black)),
                            onPressed: () async {
                              setState(() {
                                loading = true; // Start the loading state
                              });
                              await Future.microtask(() =>
                                  Get.find<GoalieController>()
                                      .goalieInterestedApi(context,
                                          scheduleId:
                                              data.scheduleId.toString(),
                                          approvalStatus: "0",
                                          gameDateTime: data.gameDatetime
                                              .toString())).then((value) async {
                                // Get.back();
                                await Future.microtask(() =>
                                    Get.find<GoalieController>()
                                        .allGoalieScheduleApi());
                                await Future.microtask(() =>
                                    Get.find<CommonController>()
                                        .goalieAllRatingApi(filed: "goalie"));
                                setState(() {
                                  loading = false;
                                });
                                Get.back(result: true);
                              });
                            },
                            child: Text(
                              data.isInterested == "1" ? "Remove" : "Remove",
                              style: TextStyle(
                                  color: data.isInterested == "1"
                                      ? AppColor.primary
                                      : Colors.white),
                            ))),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Card(
                  color: Colors.black.withOpacity(.5),
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text("Rink Details : ${data.rink}"),
                        Text("${data.address}"),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.white, width: 5)),
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        zoom: 15,
                        target: LatLng(
                          double.parse(data.latitude!),
                          double.parse(data.longitude!),
                        ),
                      ),
                      markers: {
                        Marker(
                            markerId: const MarkerId("1"),
                            position: LatLng(
                              double.parse(data.latitude!),
                              double.parse(data.longitude!),
                            )),
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
