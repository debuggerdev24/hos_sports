import 'dart:developer';

import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hos_sports/screen/goalie_screen/goalie_dashboard/goalie_dashboard_screen.dart';
import 'package:hos_sports/service/controller/goalie_controller.dart';
import 'package:hos_sports/service/controller/location_controller.dart';
import 'package:hos_sports/service/model/GameScheduledModel.dart';
import 'package:hos_sports/widgets/constants.dart';
import 'package:hos_sports/widgets/toast.dart';
import 'package:hos_sports/widgets/widgets.dart';
import 'package:intl/intl.dart';

import '../../../../widgets/other_widgets.dart';

class ScheduledGameDetailsScreen extends StatefulWidget {
  final Data data;

  const ScheduledGameDetailsScreen({super.key, required this.data});

  @override
  State<ScheduledGameDetailsScreen> createState() =>
      _ScheduledGameDetailsScreenState();
}

class _ScheduledGameDetailsScreenState
    extends State<ScheduledGameDetailsScreen> {
  //

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    DateTime initialDate = DateTime.parse(widget.data.gameDatetime.toString());
    String formattedDate =
        DateFormat("EEEE MMM dd, yyyy 'at' hh:mm a").format(initialDate);
    var data = widget.data;
//

    // Function to check if game can be canceled
    void checkAndCancelGame() {
      String checkData = data.gameDatetime.toString().split(" ")[0];
      String checkTime = data.gameDatetime.toString().split(" ")[1];

      log(checkData); // Logs the selected date
      log(checkTime); // Logs the selected time

      if (checkData.isNotEmpty && checkTime.isNotEmpty) {
        // Extract hour and minute from time text
        int hour = int.parse(checkTime.split(":")[0]);
        int minute = int.parse(checkTime.split(":")[1].split(" ")[0]);

        // Check if PM is indicated and adjust the hour for 24-hour format
        if (checkTime.contains("PM") && hour < 12) {
          hour += 12; // Convert to 24-hour format for PM times
        }
        if (checkTime.contains("AM") && hour == 12) {
          hour = 0; // Handle midnight case for 12:00 AM
        }

        // Step 1: Parse the date from checkData (expected format 'YYYY-MM-DD')
        DateTime parsedDate = DateTime.parse(checkData);

        // Step 2: Check if the date is today's date
        DateTime now = DateTime.now();
        DateTime selectedDateTime = DateTime(
          parsedDate.year,
          parsedDate.month,
          parsedDate.day,
          hour,
          minute,
        );

        // Step 3: Calculate the difference between now and the selected date-time
        Duration difference = selectedDateTime.difference(now);

        // Step 4: Check if the date is today or a future date
        if (parsedDate.year == now.year &&
            parsedDate.month == now.month &&
            parsedDate.day == now.day) {
          // If the date is today, check the time difference
          if (difference.inHours < 4) {
            log("Please text (416) 807-3138, if you need to cancel within 4 hours of puck drop");
            showAutoCloseAlertDialog(context,
                "Please text (416) 807-3138, if you need to cancel within 4 hours of puck drop");
            return; // Prevent further execution
          }
        }

        // Proceed with update as time difference is valid
        log("The schedule can be updated, proceed with update");

        // Show confirmation dialog
        Get.dialog(AlertDialog(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(15)),
          // title: const Text("Alert"),
          title: const Text("Do you wish to cancel the game?"),
          actions: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    loading = true;
                  });
                  Get.back();
                  Future.microtask(() => Get.find<GoalieController>()
                      .goaliesCancelToPlayGameApi(context,
                          scheduleId: '${data.scheduleId}')).then((v) {
                    Get.offAll(const GoalieDashboardScreen());
                  });
                },
                child: const Text("Yes")),
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text(
                  "No",
                  style: TextStyle(color: Colors.white),
                )),
          ],
        ));
      }
    }

    return BlurryModalProgressHUD(
      inAsyncCall: loading,
      blurEffectIntensity: 4,
      dismissible: false,
      opacity: 0.4,
      color: Colors.black,
      progressIndicator: Center(
          child:
              CircularProgressIndicator.adaptive(backgroundColor: Colors.red)),
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
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: Card(
                  color: Colors.black.withOpacity(.5),
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GameCardWidget(
                            date: formattedDate,
                            teamName: data.teamName.toString(),
                            caliber: data.caliber.toString(),
                            format: data.format.toString(),
                            gameDuration: data.gameDuration.toString()),
                        const Divider(),
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
                                "${priceConverter(amount: "${int.parse(data.gamePayment.toString()) - int.parse(data.goalieCut.toString())}")}"),
                          ],
                        ),
                        const Divider(
                          color: Colors.white,
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                                "Special Instructions: ${data.instruction}")),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    // Expanded(
                    //     child: OutlinedButton(
                    //         style: ButtonStyle(
                    //             side: WidgetStateProperty.all(
                    //               const BorderSide(color: Colors.white),
                    //             ),
                    //             backgroundColor:
                    //                 WidgetStateProperty.all(Colors.black)),
                    //         onPressed: () {},
                    //         child: const Text(
                    //           "Selected",
                    //           style: TextStyle(color: Colors.white),
                    //         ))),
                    // const SizedBox(
                    //   width: 10,
                    // ),
                    Expanded(
                        child: OutlinedButton(
                            style: ButtonStyle(
                                side: WidgetStateProperty.all(
                                  const BorderSide(color: AppColor.primary),
                                ),
                                backgroundColor:
                                    WidgetStateProperty.all(Colors.black)),
                            onPressed: checkAndCancelGame,
                            child: const Text(
                              "Do you need to cancel ?",
                              style: TextStyle(color: AppColor.primary),
                            ))),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
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
              SizedBox(height: 5),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
            ],
          ),
        ),
      ),
    );
  }
}
