import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hos_sports/service/controller/goalie_controller.dart';
import 'package:hos_sports/service/controller/permission.dart';
import 'package:hos_sports/widgets/widgets.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../widgets/other_widgets.dart';
import 'check_in_details_screen.dart';

class CheckInScreen extends StatefulWidget {
  const CheckInScreen({super.key});

  @override
  State<CheckInScreen> createState() => _CheckInScreenState();
}

class _CheckInScreenState extends State<CheckInScreen> {
//

  bool haveFunRun = false;

  late bool locationPermission = false; // Default value

  checkPermission() async {
    locationPermission =
        await CheckLocationPermission().checkLocationPermission();
    if (locationPermission) {
      log('Location permission is granted. Proceeding...');
    } else {
      log('Location permission is not granted. Location services will be disabled.');
    }
    haveFunRun = true;
    setState(() {});
  }

//

  @override
  void initState() {
    checkPermission();
    super.initState();
  }

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
                              Get.to(() => CheckInDetailsScreen(
                                    data: data,
                                  ));
                            },
                            child: Container(
                              decoration: dec,
                              child: GameCardWidget(
                                  date: formattedDate,
                                  teamName: data.teamName.toString(),
                                  caliber: data.caliber.toString(),
                                  format: data.format.toString(),
                                  gameDuration: data.gameDuration.toString()),
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
              return Container(
                width: screenWidth(context),
                height: screenHeight(context),
                decoration: decoration(),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Card(
                          color: Colors.black.withOpacity(.3),
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              "You currently have no scheduled games",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        if (haveFunRun) SizedBox(height: 20),
                        if (haveFunRun)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                  child: locationPermission == false
                                      ? ElevatedButton(
                                          onPressed: () async {
                                            await openAppSettings();
                                            // await checkPermission();
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                              "Please enable the location and GPS"))
                                      : SizedBox()),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              );
              // return   centerHeadingText(
              //     context, "You currently have no scheduled games");
            }
            return const Center(
                child: CircularProgressIndicator.adaptive(
                    backgroundColor: Colors.red));
            // return ListView.builder(
            //   shrinkWrap: true,
            //   physics: const ClampingScrollPhysics(),
            //   itemCount: 5,
            //   itemBuilder: (BuildContext context, int index) {
            //     return Skeletonizer(
            //       enabled: true,
            //       textBoneBorderRadius:
            //           TextBoneBorderRadius(BorderRadius.circular(3)),
            //       effect: PulseEffect(
            //           from: Colors.black.withOpacity(.5),
            //           duration: const Duration(seconds: 2),
            //           to: Colors.white.withOpacity(.5)),
            //       child: Padding(
            //         padding: const EdgeInsets.symmetric(
            //             horizontal: 13, vertical: 7.5),
            //         child: Container(
            //           decoration: BoxDecoration(
            //               color: Colors.black.withOpacity(.2),
            //               border: Border.all(
            //                   color: const Color(0xffDCD4D4).withOpacity(.5)),
            //               borderRadius: BorderRadius.circular(10)),
            //           child: const Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               SizedBox(
            //                 height: 11,
            //               ),
            //               Padding(
            //                 padding: EdgeInsets.symmetric(horizontal: 10),
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                   children: [
            //                     Bone.text(
            //                       words: 1,
            //                     ),
            //                     Bone.text(
            //                       words: 1,
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               SizedBox(
            //                 height: 5,
            //               ),
            //               Padding(
            //                 padding: EdgeInsets.symmetric(horizontal: 10),
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                   children: [
            //                     Bone.text(
            //                       words: 2,
            //                     ),
            //                     Bone.text(
            //                       words: 1,
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //               Padding(
            //                 padding: EdgeInsets.symmetric(horizontal: 10),
            //                 child: Divider(),
            //               ),
            //               SizedBox(
            //                 height: 5,
            //               ),
            //               Bone.text(
            //                 words: 2,
            //               ),
            //               SizedBox(
            //                 height: 5,
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //     );
            //   },
            // );
          },
        ),
      ),
    );
  }
}
