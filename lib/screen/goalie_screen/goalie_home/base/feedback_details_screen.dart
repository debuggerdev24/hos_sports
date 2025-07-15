import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hos_sports/screen/dashboard_screen/dashboard_screen.dart';
import 'package:hos_sports/screen/goalie_screen/goalie_dashboard/goalie_dashboard_screen.dart';
import 'package:hos_sports/service/controller/common_controller.dart';
import 'package:hos_sports/service/model/GoaliePendingFeedbackModel.dart';
import 'package:hos_sports/widgets/toast.dart';
import 'package:hos_sports/widgets/widgets.dart';
import 'package:intl/intl.dart';

class FeedbackDetailsScreen extends StatefulWidget {
  final Data data;

  const FeedbackDetailsScreen({super.key, required this.data});

  @override
  State<FeedbackDetailsScreen> createState() => _FeedbackDetailsScreenState();
}

class _FeedbackDetailsScreenState extends State<FeedbackDetailsScreen> {
  Decoration dec = BoxDecoration(
      color: Colors.black.withOpacity(.5),
      border: Border.all(color: Colors.white),
      borderRadius: BorderRadiusDirectional.circular(10));
  TextEditingController feedbackController = TextEditingController();
  int? firstOption;
  int? secondOption;
  int? thirdOption;

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    var data = widget.data;
    DateTime initialDate = DateTime.parse(data.totalTime.toString());
    String formattedDate =
        DateFormat("EEEE MMM dd, yyyy 'at' hh:mm a").format(initialDate);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Outstanding Feedback"),
      ),
      body: Container(
        width: screenWidth(context),
        height: screenHeight(context),
        decoration: decoration(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                Container(
                    decoration: dec,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Rate Customer Experience"),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    decoration: dec,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(formattedDate.toString()),
                          Row(
                            children: [
                              Expanded(child: Text("Team: ${data.teamName}")),
                              Text("${data.gameDuration} Minutes"),
                            ],
                          ),
                        ],
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    decoration: dec,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Please be honest and respectful, as this will be reflected on the customer's on-going history",
                        textAlign: TextAlign.center,
                      ),
                    )),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: dec,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(
                        height: 5,
                      ),
                      const Text("Room Atmosphere"),
                      const SizedBox(
                        height: 2,
                      ),
                      const Text("(welcoming and inclusive)"),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            5,
                            (index) => TextButton(
                                  style: ButtonStyle(
                                      foregroundColor: WidgetStateProperty.all(
                                          Colors.white)),
                                  onPressed: () {
                                    firstOption = index;
                                    setState(() {});
                                  },
                                  child: Container(
                                    decoration:
                                        index == firstOption ? dec : null,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("${index + 1}"),
                                    ),
                                  ),
                                )).toList(),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: dec,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(
                        height: 5,
                      ),
                      const Text("On-Ice Support"),
                      const SizedBox(
                        height: 2,
                      ),
                      const Text("(physical and verbal)"),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            5,
                            (index) => TextButton(
                                  style: ButtonStyle(
                                      foregroundColor: WidgetStateProperty.all(
                                          Colors.white)),
                                  onPressed: () {
                                    secondOption = index;
                                    setState(() {});
                                  },
                                  child: Container(
                                    decoration:
                                        index == secondOption ? dec : null,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("${index + 1}"),
                                    ),
                                  ),
                                )).toList(),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: dec,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(
                        height: 5,
                      ),
                      const Text("Prompt Payment in Full"),
                      const SizedBox(
                        height: 2,
                      ),
                      const Text("(before or after game)"),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            5,
                            (index) => TextButton(
                                  style: ButtonStyle(
                                      foregroundColor: WidgetStateProperty.all(
                                          Colors.white)),
                                  onPressed: () {
                                    thirdOption = index;
                                    setState(() {});
                                  },
                                  child: Container(
                                    decoration:
                                        index == thirdOption ? dec : null,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("${index + 1}"),
                                    ),
                                  ),
                                )).toList(),
                      )
                    ],
                  ),
                ),
                CustomTextFormField(
                  labelText: "Comment",
                  controller: feedbackController,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (firstOption == null ||
                              secondOption == null ||
                              thirdOption == null ||
                              feedbackController.text.isEmpty) {
                            showToast(
                                "Please complete all fields before submitting",
                                false,
                                context);
                          } else {
                            setState(() {
                              loading = true;
                            });
                            Future.microtask(() => Get.find<CommonController>()
                                .insertFeedbackApi(context,
                                    scheduleId: data.scheduleId.toString(),
                                    customerId: data.userId.toString(),
                                    feedback: feedbackController.text,
                                    goalieOnTime: (firstOption! + 1).toString(),
                                    goalieFitInTeam:
                                        (thirdOption! + 1).toString(),
                                    goalieCaliber: (secondOption! + 1)
                                        .toString())).then((v) {
                              setState(() {
                                loading = false;
                              });
                              Get.offAll(const GoalieDashboardScreen());
                            });
                          }
                        },
                        child: loading
                            ? const Padding(
                                padding: EdgeInsets.all(1.0),
                                child: CircularProgressIndicator.adaptive(
                                  backgroundColor: Colors.white,
                                ),
                              )
                            : Text("Submit"),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
