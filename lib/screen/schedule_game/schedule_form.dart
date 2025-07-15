import 'dart:async';
import 'dart:developer';

import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hos_sports/screen/dashboard_screen/dashboard_screen.dart';
import 'package:hos_sports/screen/schedule_game/game_location_screen.dart';
import 'package:hos_sports/service/api_const.dart';
import 'package:hos_sports/service/controller/permission.dart';
import 'package:hos_sports/widgets/custom_dropdown.dart';
import 'package:hos_sports/widgets/temp.dart';
import 'package:hos_sports/widgets/toast.dart';
import 'package:hos_sports/widgets/validator.dart';
import 'package:hos_sports/widgets/widgets.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../service/controller/customer_controller.dart';
import '../../service/model/CustomerScheduleGoalieModel.dart';
import '../../widgets/constants.dart';

class ScheduleGameForm extends StatefulWidget {
  final data;

  const ScheduleGameForm({super.key, this.data});

  @override
  State<ScheduleGameForm> createState() => _ScheduleGameFormState();
}

class _ScheduleGameFormState extends State<ScheduleGameForm> {
  bool loading = false;

  String caliber = 'A';
  String goalie = '1';
  String format = 'Game - 5 vs 5';
  String duration = '';
  String gender = '';
  String playoff = 'No';
  String? timeZone;
  DateTime? selectedDate;

  var playoffValue = 0;

  // String preference = '';
  PlaceSaveModel? place;
  final date = TextEditingController();
  final time = TextEditingController();

  final teamName = TextEditingController();
  final location = TextEditingController();
  final address = TextEditingController();
  final instructions = TextEditingController();

  callInit() {
    var data = widget.data;
    caliber = data!.caliber!;
    goalie = data.goalies!;
    format = data.format!;
    duration = "${data.gameDuration!} Min";
    gender = data.gender!;
    playoff = data.playoff == "1" ? "Yes" : "No";
    date.text = data.date!;
    time.text = data.time!;
    teamName.text = data.teamName!;
    location.text = data.rink!;
    address.text = data.address!;
    instructions.text = data.instruction!;
    place = PlaceSaveModel(
        rink: data.rink!,
        address: data.address!,
        latLng:
            LatLng(double.parse(data.latitude!), double.parse(data.longitude!)),
        placeId: data.placeId!);
    Future.microtask(() => Get.find<CustomerController>()..loadTeamName());
    setState(() {});
  }

  @override
  void initState() {
    checkPermission();
    super.initState();
    if (widget.data != null) {
      callInit();
    }
  }

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
    setState(() {}); // Update UI based on permission status
  }

//

  @override
  void dispose() {
    Future.microtask(
        () => Get.find<CustomerController>().goaliesAvailableRinkGameApi());
    Future.microtask(
        () => Get.find<CustomerController>().allCustomerScheduleApi());

    // Future.microtask(() => Get.find<CustomerController>()..loadTeamName());

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        // backgroundColor: Colors.white12,
        appBar: AppBar(
          title: Image.asset(
            ImageConst.topBackImage,
            scale: 5,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Card(
                color: Colors.black,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  color: Colors.black,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: CustomTextFormField(
                                controller: date,
                                enabled: false,
                                onTap: () async {
                                  DateTime? selected = await showDatePicker(
                                    context: context,
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.now().add(
                                      const Duration(days: 30),
                                    ),
                                  );
                                  if (selected != null) {
                                    selectedDate = selected;
                                    date.text =
                                        "${selected.year} - ${selected.month} - ${selected.day}";
                                    setState(() {});
                                  }
                                },
                                readOnly: true,
                                labelText: 'Date',
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              flex: 2,
                              child: CustomTextFormField(
                                controller: time,
                                enabled: false,
                                onTap: () async {
                                  log("Opening time picker...");

                                  // Show the time picker
                                  DateTime? dateTime =
                                      await showOmniDateTimePicker(
                                    context: context,
                                    type: OmniDateTimePickerType.time,
                                    minutesInterval: 5,
                                    is24HourMode: false,
                                  );

                                  if (dateTime != null) {
                                    TimeOfDay selected = TimeOfDay(
                                      hour: dateTime.hour,
                                      minute: dateTime.minute,
                                    );

                                    // Update the text field with the selected time
                                    setState(() {
                                      time.text = selected.format(context);
                                    });
                                  } else {
                                    // Show a toast if the time is in the past
                                    showToast("Invalid Time", false, context);
                                  }
                                },
                                labelText: 'Time',
                              ),
                            ),

                            // Expanded(
                            //   flex: 2,
                            //   child: CustomTextFormField(
                            //     controller: time,
                            //     enabled: false,
                            //     onTap: () async {
                            //       if (selectedDate != null) {
                            //         DateTime? dateTime =
                            //             await showOmniDateTimePicker(
                            //           context: context,
                            //           type: OmniDateTimePickerType.time,
                            //           minutesInterval: 5,
                            //           is24HourMode: false,
                            //         );
                            //         if (dateTime != null) {
                            //           if (selectedDate!.day ==
                            //               DateTime.now().day) {
                            //             if (!isTimeOfDayInThePast(
                            //                 TimeOfDay.fromDateTime(dateTime))) {
                            //               TimeOfDay selected = TimeOfDay(
                            //                   hour: dateTime.hour,
                            //                   minute: dateTime.minute);
                            //               setState(() {
                            //                 time.text =
                            //                     selected.format(context);
                            //               });
                            //             } else {
                            //               showToast(
                            //                 "Invalid Time",
                            //                 false,
                            //                 context,
                            //               );
                            //             }
                            //           } else {
                            //             TimeOfDay selected = TimeOfDay(
                            //                 hour: dateTime.hour,
                            //                 minute: dateTime.minute);
                            //             setState(() {
                            //               time.text = selected.format(context);
                            //             });
                            //           }
                            //         }
                            //       }
                            //     },
                            //     labelText: 'Time',
                            //   ),
                            // ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: DropDownList(
                                value: format,
                                label: "Format",
                                onChange: (val) {
                                  // Update the selected format only if it's not "Ball Hockey"
                                  setState(() {
                                    format = val!;

                                    // Set the new format
                                  });
                                },
                                items: const [
                                  'Game - 5 vs 5',
                                  'Game - 3 vs 3',
                                  'Shinny - 5 vs 5',
                                  'Shinny - 3 vs 3',
                                  'Ball Hockey', // This will be disabled
                                ],
                                disabledItem:
                                    "Ball Hockey", // Specify the item to disable
                              ),
                            ),

                            const SizedBox(width: 10),
                            Expanded(
                              child: DropDownList(
                                value: caliber,
                                label: "caliber",
                                onChange: (val) {
                                  caliber = val.toString();
                                  setState(() {});
                                },
                                items: const ['A', 'B', 'C', 'D', "E", 'Rec'],
                                // Specify the item to disable
                              ),
                            ),

                            // Expanded(
                            //   child: CustomDropdown(
                            //       value: caliber,
                            //       labelText: "Caliber",
                            //       onTap: (val) {
                            //         caliber = val.toString();
                            //         setState(() {});
                            //       },
                            //       items: ['A', 'B', 'C', 'D', "E"]
                            //           .map(
                            //             (option) => DropdownMenuItem(
                            //               value: option,
                            //               child: Center(child: Text(option)),
                            //             ),
                            //           )
                            //           .toList()),
                            // ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Duration',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TapBox(
                                onTap: () {
                                  duration = '60 Min';
                                  setState(() {});
                                },
                                text: '60 Min',
                                boxClr: duration == '60 Min'
                                    ? Colors.white
                                    : Colors.transparent,
                                txtClr: duration == '60 Min'
                                    ? Colors.black
                                    : Colors.white),
                            const SizedBox(width: 10),
                            TapBox(
                                onTap: () {
                                  duration = '90 Min';
                                  setState(() {});
                                },
                                text: '90 Min',
                                boxClr: duration == '90 Min'
                                    ? Colors.white
                                    : Colors.transparent,
                                txtClr: duration == '90 Min'
                                    ? Colors.black
                                    : Colors.white),
                            const SizedBox(width: 10),
                            TapBox(
                                onTap: () {
                                  duration = '120 Min';
                                  setState(() {});
                                },
                                text: '120 Min',
                                boxClr: duration == '120 Min'
                                    ? Colors.white
                                    : Colors.transparent,
                                txtClr: duration == '120 Min'
                                    ? Colors.black
                                    : Colors.white)
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Gender',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TapBox(
                                onTap: () {
                                  gender = 'Male';
                                  setState(() {});
                                },
                                text: 'Male',
                                boxClr: gender == 'Male'
                                    ? Colors.white
                                    : Colors.transparent,
                                txtClr: gender == 'Male'
                                    ? Colors.black
                                    : Colors.white),
                            const SizedBox(width: 5),
                            TapBox(
                                onTap: () {
                                  gender = 'Female';
                                  setState(() {});
                                },
                                text: 'Female',
                                boxClr: gender == 'Female'
                                    ? Colors.white
                                    : Colors.transparent,
                                txtClr: gender == 'Female'
                                    ? Colors.black
                                    : Colors.white),
                            const SizedBox(width: 5),
                            TapBox(
                                onTap: () {
                                  gender = 'No Preference';
                                  setState(() {});
                                },
                                text: 'No Preference',
                                boxClr: gender == 'No Preference'
                                    ? Colors.white
                                    : Colors.transparent,
                                txtClr: gender == 'No Preference'
                                    ? Colors.black
                                    : Colors.white),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'No. of Goalie',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TapBox(
                                onTap: () {
                                  goalie = '1';
                                  setState(() {});
                                },
                                text: '1',
                                boxClr: goalie == '1'
                                    ? Colors.white
                                    : Colors.transparent,
                                txtClr: goalie == '1'
                                    ? Colors.black
                                    : Colors.white),
                            const SizedBox(width: 10),
                            TapBox(
                                onTap: () {
                                  goalie = '2';
                                  setState(() {});
                                },
                                text: '2',
                                boxClr: goalie == '2'
                                    ? Colors.white
                                    : Colors.transparent,
                                txtClr: goalie == '2'
                                    ? Colors.black
                                    : Colors.white),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Is this a playoff game?',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TapBox(
                                onTap: () {
                                  playoff = 'Yes';
                                  playoffValue = 1;
                                  setState(() {});
                                },
                                text: 'Yes',
                                boxClr: playoff == 'Yes'
                                    ? Colors.white
                                    : Colors.transparent,
                                txtClr: playoff == 'Yes'
                                    ? Colors.black
                                    : Colors.white),
                            const SizedBox(width: 10),
                            TapBox(
                                onTap: () {
                                  playoff = 'No';
                                  playoffValue = 0;
                                  setState(() {});
                                },
                                text: 'No',
                                boxClr: playoff == 'No'
                                    ? Colors.white
                                    : Colors.transparent,
                                txtClr: playoff == 'No'
                                    ? Colors.black
                                    : Colors.white),
                          ],
                        ),
                        const SizedBox(height: 20),
                        CustomTextFormField(
                            controller: teamName, labelText: 'Team Name'),
                        GetBuilder<CustomerController>(
                          init: CustomerController()..loadTeamName(),
                          builder: (CustomerController controller) {
                            return Wrap(
                              children: controller.teamNames
                                  .map<Widget>((e) => GestureDetector(
                                        onTap: () {
                                          teamName.text = e.toString();
                                        },
                                        child: Chip(
                                          label: Text(e),
                                          onDeleted: () {
                                            controller.removeTeamName(
                                                e); // Remove only this chip
                                          },
                                          deleteIcon: Icon(Icons.close,
                                              size: 18, color: Colors.red),
                                        ),
                                      ))
                                  .toList(),
                            );
                          },
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  PlaceSaveModel? data = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const GameLocationScreen()));
                                  if (data != null) {
                                    place = data;
                                    location.text = data.rink;
                                    address.text = data.address;
                                    timeZone = getTimeZoneApi();
                                    setState(() {});
                                  }
                                },
                                child: CustomTextFormField(
                                    controller: location,
                                    labelText: 'Location',
                                    enabled: false),
                              ),
                            ),
                            // SizedBox(width: 5,),
                            // Expanded(
                            //   child: CustomTextFormField(
                            //       controller: address, labelText: 'Address'),
                            // ),
                          ],
                        ),
                        CustomTextFormField(
                            controller: instructions,
                            labelText: 'Special Instructions'),
                        const SizedBox(height: 10),
                        // if (haveFunRun)
                        //   Row(
                        //     children: [
                        //       Center(
                        //           child: locationPermission
                        //               ? Text('Location permission have [!')
                        //               : Text('Location permission denied!')),
                        //     ],
                        //   ),
                        if (haveFunRun)
                          Row(
                            children: [
                              Expanded(
                                child: locationPermission == false
                                    ? ElevatedButton(
                                        onPressed: () async {
                                          await openAppSettings();
                                          // await checkPermission();
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                            "Please enable the location and GPS"))
                                    : ElevatedButton(
                                        onPressed: () async {
                                          FocusScope.of(context).unfocus();
                                          if (date.text.isEmpty) {
                                            showToast("Please select the date",
                                                false, context);
                                            return;
                                          }
                                          if (time.text.isEmpty) {
                                            showToast("Please select the time",
                                                false, context);
                                            return;
                                          }
                                          if (duration == "") {
                                            showToast(
                                                "Please select the time game duration",
                                                false,
                                                context);
                                            return;
                                          }

                                          if (gender == "") {
                                            showToast(
                                                "Please select the gender",
                                                false,
                                                context);
                                            return;
                                          }

                                          if (teamName.text.isEmpty) {
                                            showToast(
                                                "Please enter the team name",
                                                false,
                                                context);
                                            return;
                                          }
                                          if (time.text.isEmpty) {
                                            showToast(
                                                "Please select the date & time ",
                                                false,
                                                context);
                                            return;
                                          }
                                          if (time.text.isEmpty) {
                                            showToast(
                                                "Please enter the instruction ",
                                                false,
                                                context);
                                            return;
                                          }
                                          if (widget.data == null) {
                                            if (place == null) {
                                              showToast("Pick Location", false,
                                                  context);
                                            } else {
                                              setState(() {
                                                loading = true;
                                              });

                                              await Get.find<
                                                      CustomerController>()
                                                  .createNewSchedule(context,
                                                      date: date.text.replaceAll(" ",
                                                          ""),
                                                      time: time.text,
                                                      caliber: caliber,
                                                      goalies: goalie,
                                                      format: format,
                                                      gender: gender,
                                                      playoff: playoffValue
                                                          .toString(),
                                                      // playoff: playoff,
                                                      teamName: teamName.text,
                                                      rink:
                                                          place!
                                                              .rink
                                                              .toString(),
                                                      latitude:
                                                          place!
                                                              .latLng.latitude
                                                              .toString(),
                                                      longitude:
                                                          place!.latLng.longitude
                                                              .toString(),
                                                      gameDuration:
                                                          duration.replaceAll(
                                                              " Min", ""),
                                                      instruction:
                                                          instructions.text,
                                                      address: address.text,
                                                      placeId: place!.placeId
                                                          .toString(),
                                                      timeZone:
                                                          timeZone.toString());

                                              setState(() {
                                                loading = false;
                                              });
                                            }
                                          } else {
                                            setState(() {
                                              loading = true;
                                            });

                                            log("$playoffValue");
                                            await Get.find<CustomerController>()
                                                .updateGameWithNotificationApi(
                                                    context,
                                                    date: date.text
                                                        .replaceAll(" ", ""),
                                                    time: time.text,
                                                    caliber: caliber,
                                                    goalies: goalie,
                                                    format: format,
                                                    gender: gender,
                                                    playoff:
                                                        playoffValue.toString(),
                                                    teamName: teamName.text,
                                                    rink: place!.rink,
                                                    latitude: place!
                                                        .latLng.latitude
                                                        .toString(),
                                                    longitude: place!
                                                        .latLng.longitude
                                                        .toString(),
                                                    gameDuration: duration
                                                        .replaceAll(" Min", ""),
                                                    instruction:
                                                        instructions.text,
                                                    address: address.text,
                                                    placeId: place!.placeId
                                                        .toString(),
                                                    scheduleId: widget
                                                        .data!.scheduleId
                                                        .toString());

                                            setState(() {
                                              loading = false;
                                            });
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColor.primary),
                                        child: SizedBox(
                                          width: screenWidth(context),
                                          height: 45,
                                          child: Center(
                                            child: Text(
                                              widget.data == null
                                                  ? 'Submit'
                                                  : "Update",
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                              ),
                              if (widget.data != null)
                                const SizedBox(
                                  width: 10,
                                ),
                              if (widget.data != null)
                                Expanded(
                                    child: ElevatedButton(
                                        onPressed: () {
                                          FocusScope.of(context).unfocus();

                                          Get.dialog(AlertDialog(
                                            backgroundColor: Colors.black,
                                            shape: const RoundedRectangleBorder(
                                                side: BorderSide(
                                                    color: Colors.white),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            title: const Text(
                                                "Please confirm you wish to cancel this game"),
                                            actions: [
                                              ElevatedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      loading = true;
                                                    });
                                                    Get.back();
                                                    Future.microtask(() => Get.find<
                                                            CustomerController>()
                                                        .cancelGameApi(context,
                                                            scheduleId: widget
                                                                .data!
                                                                .scheduleId
                                                                .toString())).then(
                                                        (val) {
                                                      setState(() {
                                                        loading = false;
                                                      });
                                                    });
                                                  },
                                                  child: const Text("Yes")),
                                              ElevatedButton(
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  child: const Text("No"))
                                            ],
                                          ));
                                        },
                                        child: const Text("Cancel")))
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///
///
class TapBox extends StatelessWidget {
  const TapBox(
      {super.key,
      required this.onTap,
      required this.boxClr,
      required this.txtClr,
      required this.text});

  final Function onTap;
  final Color boxClr;
  final Color txtClr;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          height: 35,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
              color: boxClr,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white)),
          child: Center(
            child: Text(
              text,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w400, color: txtClr),
            ),
          ),
        ),
      ),
    );
  }
}
