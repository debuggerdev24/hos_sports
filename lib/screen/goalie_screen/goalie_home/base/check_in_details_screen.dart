import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hos_sports/service/controller/location_controller.dart';
import 'package:hos_sports/service/model/GameScheduledModel.dart';
import 'package:hos_sports/widgets/widgets.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../service/controller/goalie_controller.dart';
import '../../../../widgets/other_widgets.dart';
import '../../../../widgets/toast.dart';

class CheckInDetailsScreen extends StatefulWidget {
  final Data data;

  const CheckInDetailsScreen({super.key, required this.data});

  @override
  State<CheckInDetailsScreen> createState() => _CheckInDetailsScreenState();
}

class _CheckInDetailsScreenState extends State<CheckInDetailsScreen> {
//
  bool isWithinOneHour() {
    DateTime gameDateTime = DateTime.parse(widget.data.gameDatetime.toString());
    DateTime currentTime = DateTime.now();

    // Calculate the difference in time between the current time and the game time
    Duration difference = gameDateTime.difference(currentTime);

    // Return true if the game is within one hour or has already passed
    return difference.inMinutes <= 120 || difference.isNegative;
  }

  bool rickCheck = false;

  @override
  void dispose() {
    // Access the controller directly using Get.find()
    Future.microtask(() {
      final goalieController = Get.find<GoalieController>();
      goalieController.selectGoaliesScheduleListApi();
    });

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DateTime initialDate = DateTime.parse(widget.data.gameDatetime.toString());
    String formattedDate =
        DateFormat("EEEE MMM dd, yyyy 'at' hh:mm a").format(initialDate);
    var data = widget.data;
    return BlurryModalProgressHUD(
      inAsyncCall: rickCheck,
      blurEffectIntensity: 4,
      progressIndicator:
          CircularProgressIndicator.adaptive(backgroundColor: Colors.red),
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
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Card(
                  color: Colors.black.withOpacity(.5),
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  child: GameCardWidget(
                      date: formattedDate,
                      teamName: data.teamName.toString(),
                      caliber: data.caliber.toString(),
                      format: data.format.toString(),
                      gameDuration: data.gameDuration.toString()),
                ),
              ),
              // if (isWithinOneHour())
              if (data.checkIn == "0")
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Card(
                        color: Colors.black.withOpacity(.5),
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Center(child: Text("Team: ${data.teamName}")),
                              const Divider(),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "Are you available for more games at this location?",
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Expanded(
                              child: OutlinedButton(
                                  style: ButtonStyle(
                                      side: WidgetStateProperty.all(
                                        const BorderSide(color: Colors.red),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.black)),
                                  onPressed: () async {
                                    setState(() {
                                      rickCheck = true;
                                    });
                                    await Get.find<GoalieController>()
                                        .checkInGameApi(context,
                                            scheduleId: '${data.scheduleId}',
                                            status: '1');

                                    setState(() {
                                      rickCheck = false;
                                    });
                                  },
                                  child: const Text(
                                    "Yes",
                                    style: TextStyle(color: Colors.red),
                                  ))),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: OutlinedButton(
                                  style: ButtonStyle(
                                      side: WidgetStateProperty.all(
                                        const BorderSide(color: Colors.red),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.black)),
                                  onPressed: () async {
                                    // Get.back();

                                    setState(() {
                                      rickCheck = true;
                                    });
                                    await Get.find<GoalieController>()
                                        .checkInGameApi(context,
                                            scheduleId: '${data.scheduleId}',
                                            status: '0');
                                    setState(() {
                                      rickCheck = false;
                                    });
                                  },
                                  child: const Text(
                                    "No",
                                    style: TextStyle(color: Colors.red),
                                  ))),
                          // const SizedBox(
                          //   width: 10,
                          // ),
                          // Expanded(
                          //     child: OutlinedButton(
                          //         style: ButtonStyle(
                          //             side: MaterialStateProperty.all(
                          //               const BorderSide(color: Colors.white),
                          //             ),
                          //             backgroundColor:
                          //                 MaterialStateProperty.all(Colors.black)),
                          //         onPressed: () {
                          //           Get.find<GoalieController>()
                          //               .goaliesCancelToPlayGameApi(
                          //               context,
                          //                   scheduleId: '${data.scheduleId}');
                          //         },
                          //         child: const Text(
                          //           "No",
                          //           style: TextStyle(color: Colors.white),
                          //         ))),
                        ],
                      ),
                    ),
                    if (isWithinOneHour() == false) SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Card(
                        color: Colors.black.withOpacity(.5),
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "By clicking Yes Potential clients will know that you are available for additional games on short notice at this location.",
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Container(
                    width: screenWidth(context),
                    decoration: dec,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      child: Text("Special Instructions: ${data.instruction}"),
                    )),
              ),
              // Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 15),
              //     child: Row(children: [
              //       Expanded(
              //           child: OutlinedButton(
              //               style: ButtonStyle(
              //                   side: WidgetStateProperty.all(
              //                     const BorderSide(color: Colors.red),
              //                   ),
              //                   backgroundColor:
              //                       MaterialStateProperty.all(Colors.black)),
              //               onPressed: () => openMap(
              //                     double.parse(data.latitude!),
              //                     double.parse(data.longitude!),
              //                   ),
              //               child: const Text(
              //                 "Follow the location",
              //                 style: TextStyle(color: Colors.white),
              //               ))),
              //     ])),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
