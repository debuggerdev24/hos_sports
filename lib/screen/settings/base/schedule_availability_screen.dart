import 'dart:developer';

import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hos_sports/service/controller/common_controller.dart';
import 'package:hos_sports/widgets/constants.dart';
import 'package:hos_sports/widgets/toast.dart';
import 'package:hos_sports/widgets/widgets.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';

class ScheduleAvailabilityScreen extends StatefulWidget {
  const ScheduleAvailabilityScreen({super.key});

  @override
  State<ScheduleAvailabilityScreen> createState() =>
      _ScheduleAvailabilityScreenState();
}

class _ScheduleAvailabilityScreenState
    extends State<ScheduleAvailabilityScreen> {
  showTime({required int index, required String value}) async {
    DateTime? select = await showOmniDateTimePicker(
      context: context,
      initialDate: DateTime(DateTime.now().year, 1, 1, 18, 0),
      type: OmniDateTimePickerType.time,
      minutesInterval: 5,
    );
    // TimeOfDay? time = await showTimePicker(
    //     context: context, initialTime: const TimeOfDay(hour: 18, minute: 00) , );
    if (select != null) {
      TimeOfDay? time = TimeOfDay(hour: select.hour, minute: select.minute);
      if (value.contains("am") && time.period.name.toLowerCase() == "am") {
        String local = "local_$value";
        switchStates[index][value] = formatTimeOfDay(time);
        switchStates[index][local] = formatTimeOfDay(time);
      } else if (value.contains("pm") &&
          time.period.name.toLowerCase() == "pm") {
        String local = "local_$value";
        switchStates[index][value] = formatTimeOfDay(time);
        switchStates[index][local] = formatTimeOfDay(time);
      } else {
        if (value.contains("am")) {
          showToast("Select AM", false, context);
        } else {
          showToast("Select Pm", false, context);
        }
      }
      setState(() {});
    }
  }

  List<Map> switchStates = [];

  bool Loading = false;

  @override
  Widget build(BuildContext context) {
    return BlurryModalProgressHUD(
      inAsyncCall: Loading,
      blurEffectIntensity: 4,
      dismissible: false,
      opacity: 0.4,
      color: Colors.black,
      progressIndicator: Center(
          child:
              CircularProgressIndicator.adaptive(backgroundColor: Colors.red)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Schedule"),
          actions: [
            TextButton(
                onPressed: () async {
                  // setState(() {
                  //   Loading = true;
                  // });
                  List<Map> slot = switchStates;

                  for (int i = 0; i < 7; i++) {
                    slot[i].remove("added_on");
                    slot[i]['day_type'] = daysOfWeek[i];
                  }
                  // await Get.find<CommonController>()
                  //     .updateNotificationScheduleApi(context, slot);
                  await Get.find<CommonController>()
                      .updateNotificationScheduleApiHttp(context, slot);

                  log("slot $slot");
                },
                child: const Text("Save"))
          ],
        ),
        body: Container(
          height: screenHeight(context),
          decoration: decoration(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("I am UNAVAILABLE to play during these times."),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Text(
                      "You will not be notified of games that take place during these times blocks to reduce app noice"),
                ),
                GetBuilder<CommonController>(
                  initState: (_) {
                    Future.microtask(
                            () => _.controller!.getNotificationScheduleApi())
                        .then((value) {
                      if (value!.success != "1") {
                        switchStates = [
                          {
                            "status": "1",
                            "start_time_am": "12:00:00 AM",
                            "end_time_am": "11:59:00 AM",
                            "start_time_pm": "12:00:00 PM",
                            "end_time_pm": "11:59:00 PM",
                            "local_start_time_am": "12:00:00",
                            "local_end_time_am": "11:59:00",
                            "local_start_time_pm": "12:00:00",
                            "local_end_time_pm": "11:59:00",
                            "added_on": "2019-05-01 02:18:28"
                          },
                          {
                            "status": "1",
                            "start_time_am": "12:00:00 AM",
                            "end_time_am": "11:59:00 AM",
                            "start_time_pm": "12:00:00 PM",
                            "end_time_pm": "11:55:00 PM",
                            "local_start_time_am": "12:00:00",
                            "local_end_time_am": "11:59:00",
                            "local_start_time_pm": "12:00:00",
                            "local_end_time_pm": "11:55:00",
                            "added_on": "2019-05-01 02:18:28"
                          },
                          {
                            "status": "1",
                            "start_time_am": "12:00:00 AM",
                            "end_time_am": "11:59:00 AM",
                            "start_time_pm": "12:00:00 PM",
                            "end_time_pm": "11:59:00 PM",
                            "local_start_time_am": "12:00:00",
                            "local_end_time_am": "11:59:00",
                            "local_start_time_pm": "12:00:00",
                            "local_end_time_pm": "11:59:00",
                            "added_on": "2019-05-01 02:18:28"
                          },
                          {
                            "status": "1",
                            "start_time_am": "12:00:00 AM",
                            "end_time_am": "11:59:00 AM",
                            "start_time_pm": "12:00:00 PM",
                            "end_time_pm": "11:59:00 PM",
                            "local_start_time_am": "12:00:00",
                            "local_end_time_am": "11:59:00",
                            "local_start_time_pm": "12:00:00",
                            "local_end_time_pm": "11:59:00",
                            "added_on": "2019-05-01 02:18:28"
                          },
                          {
                            "status": "1",
                            "start_time_am": "12:00:00 AM",
                            "end_time_am": "11:59:00 AM",
                            "start_time_pm": "12:00:00 PM",
                            "end_time_pm": "11:59:00 PM",
                            "local_start_time_am": "12:00:00",
                            "local_end_time_am": "11:59:00",
                            "local_start_time_pm": "12:00:00",
                            "local_end_time_pm": "11:59:00",
                            "added_on": "2019-05-01 02:18:28"
                          },
                          {
                            "status": "1",
                            "start_time_am": "12:00:00 AM",
                            "end_time_am": "11:59:00 AM",
                            "start_time_pm": "12:00:00 PM",
                            "end_time_pm": "11:59:00 PM",
                            "local_start_time_am": "12:00:00",
                            "local_end_time_am": "11:59:00",
                            "local_start_time_pm": "12:00:00",
                            "local_end_time_pm": "11:59:00",
                            "added_on": "2019-05-01 02:18:28"
                          },
                          {
                            "status": "1",
                            "start_time_am": "12:00:00 AM",
                            "end_time_am": "11:59:00 AM",
                            "start_time_pm": "12:00:00 PM",
                            "end_time_pm": "11:59:00 PM",
                            "local_start_time_am": "12:00:00",
                            "local_end_time_am": "11:59:00",
                            "local_start_time_pm": "12:00:00",
                            "local_end_time_pm": "11:59:00",
                            "added_on": "2019-05-01 02:18:28"
                          }
                        ];
                      } else {
                        switchStates.clear();
                        for (var element
                            in _.controller!.scheduleAvailabilityModel!.data!) {
                          switchStates.add(element.toJson());
                        }
                      }
                    });
                  },
                  builder: (CommonController controller) {
                    if (controller.scheduleAvailabilityModel != null) {
                      if (controller.scheduleAvailabilityModel!.success ==
                          "1") {
                        return ListView.builder(
                          itemCount: controller
                              .scheduleAvailabilityModel!.data!.length,
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            // var day;
                            // if (daysOfWeek.isNotEmpty) {
                            var data = daysOfWeek[index];
                            //   // day = data["day_type"].toString();
                            // }
                            return switchStates.isNotEmpty
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    child: Container(
                                      decoration: dec,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: <Widget>[
                                            Row(
                                              children: [
                                                Text(data),
                                                const Spacer(),
                                                Switch(
                                                  activeColor: Colors.green,
                                                  value: switchStates[index]
                                                          ["status"] ==
                                                      "1",
                                                  onChanged: (bool value) {
                                                    setState(() {
                                                      switchStates[index]
                                                              ["status"] =
                                                          value ? "1" : "0";
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                GestureDetector(
                                                    onTap: () {
                                                      showTime(
                                                          index: index,
                                                          value:
                                                              "start_time_am");
                                                    },
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      child: Text(
                                                        "${switchStates[index]["start_time_am"]}",
                                                        style: const TextStyle(
                                                            color:
                                                                AppColor.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    )),
                                                const Text(" - "),
                                                GestureDetector(
                                                    onTap: () {
                                                      showTime(
                                                          index: index,
                                                          value: "end_time_am");
                                                    },
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      child: Text(
                                                        "${switchStates[index]["end_time_am"]}",
                                                        style: const TextStyle(
                                                            color:
                                                                AppColor.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    )),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                GestureDetector(
                                                    onTap: () {
                                                      showTime(
                                                          index: index,
                                                          value:
                                                              "start_time_pm");
                                                    },
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      child: Text(
                                                        "${switchStates[index]["start_time_pm"]}",
                                                        style: const TextStyle(
                                                            color:
                                                                AppColor.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    )),
                                                const Text(" - "),
                                                GestureDetector(
                                                    onTap: () {
                                                      showTime(
                                                          index: index,
                                                          value: "end_time_pm");
                                                    },
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      child: Text(
                                                        "${switchStates[index]["end_time_pm"]}",
                                                        style: const TextStyle(
                                                            color:
                                                                AppColor.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    )),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                : Container();
                          },
                        );
                      } else {
                        return ListView.builder(
                          itemCount: 7,
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            // if (switchStates.isNotEmpty) {
                            //   var data = switchStates[index];
                            //   day = int.parse(data["ns_id"].toString());
                            // }
                            var data = daysOfWeek[index];
                            return data.isNotEmpty
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    child: Container(
                                      decoration: dec,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: <Widget>[
                                            Row(
                                              children: [
                                                Text(data),
                                                const Spacer(),
                                                Switch(
                                                  activeColor: AppColor.primary,
                                                  value: switchStates[index]
                                                          ["status"] ==
                                                      "1",
                                                  onChanged: (bool value) {
                                                    setState(() {
                                                      switchStates[index]
                                                              ["status"] =
                                                          value ? "1" : "0";
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                GestureDetector(
                                                    onTap: () {
                                                      showTime(
                                                          index: index,
                                                          value:
                                                              "start_time_am");
                                                    },
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      child: Text(
                                                        "${switchStates[index]["start_time_am"]}",
                                                        style: const TextStyle(
                                                            color: AppColor
                                                                .primary,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    )),
                                                GestureDetector(
                                                    onTap: () {
                                                      showTime(
                                                          index: index,
                                                          value: "end_time_am");
                                                    },
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      child: Text(
                                                        "${switchStates[index]["end_time_am"]}",
                                                        style: const TextStyle(
                                                            color: AppColor
                                                                .primary,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    )),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                GestureDetector(
                                                    onTap: () {
                                                      showTime(
                                                          index: index,
                                                          value:
                                                              "start_time_pm");
                                                    },
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      child: Text(
                                                        "${switchStates[index]["start_time_pm"]}",
                                                        style: const TextStyle(
                                                            color: AppColor
                                                                .primary,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    )),
                                                GestureDetector(
                                                    onTap: () {
                                                      showTime(
                                                          index: index,
                                                          value: "end_time_pm");
                                                    },
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      child: Text(
                                                        "${switchStates[index]["end_time_pm"]}",
                                                        style: const TextStyle(
                                                            color: AppColor
                                                                .primary,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    )),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                : Container();
                          },
                        );
                      }
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List daysOfWeek = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday'
];

String getDayOfWeek(dynamic dayNumber) {
  switch (dayNumber) {
    case "Monday":
      return 'Monday';
    case "Tuesday":
      return 'Tuesday';
    case "Wednesday":
      return 'Wednesday';
    case "Thursday":
      return 'Thursday';
    case "Friday":
      return 'Friday';
    case "Saturday":
      return 'Saturday';
    case "Sunday":
      return 'Sunday';
    default:
      return 'Invalid day';
  }
}

String formatTimeOfDay(TimeOfDay timeOfDay) {
  final hour = timeOfDay.hourOfPeriod == 0 ? 12 : timeOfDay.hourOfPeriod;
  final period = timeOfDay.period == DayPeriod.am ? 'AM' : 'PM';
  final minute = timeOfDay.minute.toString().padLeft(2, '0');
  return '$hour:$minute:00 $period';
}
