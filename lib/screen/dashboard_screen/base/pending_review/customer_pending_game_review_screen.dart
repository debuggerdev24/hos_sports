import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hos_sports/screen/dashboard_screen/dashboard_screen.dart';
import 'package:hos_sports/service/controller/common_controller.dart';
import 'package:hos_sports/service/controller/customer_controller.dart';
import 'package:hos_sports/widgets/toast.dart';
import 'package:hos_sports/widgets/widgets.dart';
import 'package:intl/intl.dart';
import '../../../../service/model/CustomerScheduleGoalieModel.dart';
import '../../../../widgets/other_widgets.dart';
import '../customer_single_goalie_detail_screen.dart';
import 'customer_feedback_details_screen.dart';
import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';

class CustomerPendingGameReviewScreen extends StatefulWidget {
  final String scheduleId;
  final Data data;

  const CustomerPendingGameReviewScreen(
      {super.key, required this.scheduleId, required this.data});

  @override
  State<CustomerPendingGameReviewScreen> createState() =>
      _CustomerPendingGameReviewScreenState();
}

class _CustomerPendingGameReviewScreenState
    extends State<CustomerPendingGameReviewScreen> {
  Decoration dec = BoxDecoration(
      color: Colors.black.withOpacity(.5),
      border: Border.all(color: Colors.white),
      borderRadius: BorderRadiusDirectional.circular(10));
  TextEditingController feedbackController = TextEditingController();
  int? firstOption;
  int? secondOption;
  int? thirdOption;
  // int? rating;
  bool fav = false;

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    var data = widget.data;
    return Scaffold(
      appBar: AppBar(
        // title: Text("Customer Feedbacks"),
        title: const Text("Outstanding Feedback"),
      ),
      body: GetBuilder<CustomerController>(
        initState: (_) {
          Future.microtask(() => _.controller!
              .customerSelectedGoalieApi(scheduleId: widget.scheduleId));
        },
        builder: (CustomerController controller) {
          if (controller.allGoalieInterestedModel != null &&
              controller.allGoalieInterestedModel!.data != null) {
            var list = controller.allGoalieInterestedModel!.data!;
            DateTime initialDate = DateTime.parse(data.gameDatetime.toString());
            String formattedDate = DateFormat("EEEE MMM dd, yyyy 'at' hh:mm a")
                .format(initialDate);

            return BlurryModalProgressHUD(
              inAsyncCall: loading,
              blurEffectIntensity: 4,
              dismissible: false,
              opacity: 0.4,
              color: Colors.black,
              progressIndicator: const Center(
                  child: CircularProgressIndicator.adaptive(
                      backgroundColor: Colors.red)),
              child: Container(
                decoration: decoration(),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: <Widget>[
                        // Container(
                        //   // decoration: dec,
                        //   child: const Padding(
                        //     padding: EdgeInsets.all(8.0),
                        //     child: Column(
                        //       children: [
                        //         SizedBox(height: 5),
                        //         // GameCardWidget(
                        //         //     date: formattedDate,
                        //         //     teamName: data.teamName.toString(),
                        //         //     caliber: data.caliber.toString(),
                        //         //     format: data.format.toString(),
                        //         //     gameDuration: data.gameDuration.toString()),
                        //         // const SizedBox(
                        //         //   height: 5,
                        //         // ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        const SizedBox(height: 5),
                        // const Text("Available Goalie"),
                        // const SizedBox(height: 5),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: list.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            var goalieData = list[index];
                            return Container(
                              // decoration: dec,
                              child: Column(
                                children: [
                                  Container(
                                    decoration: dec,
                                    child: ListTile(
                                      onTap: () {
                                        // Get.to(
                                        //     () => CustomerFeedbackDetailsScreen(
                                        //           data: goalieData,
                                        //           games: data,
                                        //         ));
                                      },
                                      leading: SizedBox(
                                          width: 50,
                                          height: 55,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5),
                                            child: CustomImage(
                                              url: goalieData.profilePic
                                                  .toString(),
                                              radius: 10,
                                            ),
                                          )),
                                      title: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "${goalieData.firstname} ${goalieData.lastname!.substring(0, 1).toUpperCase()}",
                                            ),
                                          ),

                                          // Text(goalieData.ashlRegister == "1"
                                          //     ? "ASHL Register"
                                          //     : ""),
                                        ],
                                      ),
                                      // subtitle: Padding(
                                      //   padding:
                                      //       const EdgeInsets.symmetric(vertical: 5),
                                      //   child: Row(
                                      //     mainAxisAlignment:
                                      //         MainAxisAlignment.spaceAround,
                                      //     children: [
                                      //       Column(
                                      //         children: <Widget>[
                                      //           const Text(
                                      //             "Rating",
                                      //             style: TextStyle(
                                      //                 color: Colors.white),
                                      //           ),
                                      //           Text(
                                      //             "${goalieData.rating}",
                                      //             style: const TextStyle(
                                      //                 color: Colors.white),
                                      //           )
                                      //         ],
                                      //       ),
                                      //       Column(
                                      //         children: <Widget>[
                                      //           const Text(
                                      //             "Caliber",
                                      //             style: TextStyle(
                                      //                 color: Colors.white),
                                      //           ),
                                      //           Text(
                                      //             "${goalieData.calibre}",
                                      //             style: const TextStyle(
                                      //                 color: Colors.white),
                                      //           )
                                      //         ],
                                      //       ),
                                      //       Column(
                                      //         children: <Widget>[
                                      //           const Text(
                                      //             "Games",
                                      //             style: TextStyle(
                                      //                 color: Colors.white),
                                      //           ),
                                      //           Text(
                                      //             "${goalieData.totalgame}",
                                      //             style: const TextStyle(
                                      //                 color: Colors.white),
                                      //           )
                                      //         ],
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Container(
                                      decoration: dec,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GameCardWidget(
                                            date: formattedDate,
                                            teamName: data.teamName.toString(),
                                            caliber: data.caliber.toString(),
                                            format: data.format.toString(),
                                            gameDuration:
                                                data.gameDuration.toString()),
                                      )),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                      decoration: dec,
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          "Please be honest and respectful, as this will be reflected on the goalie's on-going history",
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    decoration: dec,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Text("Was the goalie on time"),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        const Text(
                                            "(15 min before rental time)"),
                                        const Divider(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: List.generate(
                                              5,
                                              (index) => TextButton(
                                                    onPressed: () {
                                                      firstOption = index;
                                                      setState(() {});
                                                    },
                                                    style: ButtonStyle(
                                                        foregroundColor:
                                                            WidgetStateProperty
                                                                .all(Colors
                                                                    .white)),
                                                    child: Container(
                                                      decoration:
                                                          index == firstOption
                                                              ? dec
                                                              : null,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                            "${index + 1}"),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Text(
                                            "Did the goalie fit in with team/room"),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        const Text(
                                            "(reasonable efforts to be part of the room)"),
                                        const Divider(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: List.generate(
                                              5,
                                              (index) => TextButton(
                                                    onPressed: () {
                                                      secondOption = index;
                                                      setState(() {});
                                                    },
                                                    style: ButtonStyle(
                                                        foregroundColor:
                                                            WidgetStateProperty
                                                                .all(Colors
                                                                    .white)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Container(
                                                        decoration: index ==
                                                                secondOption
                                                            ? dec
                                                            : null,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                              "${index + 1}"),
                                                        ),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Text(
                                            "Was the goalie appropriate caliber"),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        const Text(
                                            "(Min 4, if there was only 1 goalie available)"),
                                        const Divider(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: List.generate(
                                              5,
                                              (index) => TextButton(
                                                    onPressed: () {
                                                      thirdOption = index;
                                                      setState(() {});
                                                    },
                                                    style: ButtonStyle(
                                                        foregroundColor:
                                                            WidgetStateProperty
                                                                .all(Colors
                                                                    .white)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Container(
                                                        decoration:
                                                            index == thirdOption
                                                                ? dec
                                                                : null,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                              "${index + 1}"),
                                                        ),
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
                                  CustomTextFormField(
                                    labelText: "Comment",
                                    controller: feedbackController,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Checkbox(
                                        activeColor: Colors
                                            .red, // Fill color when checked
                                        checkColor: Colors.white, // Tick color
                                        side: BorderSide(
                                            color: Colors.red,
                                            width: 2), // Outline color
                                        value: fav,
                                        onChanged: (value) {
                                          setState(() {
                                            fav = value!;
                                          });
                                        },
                                      ),
                                      const Text("Save as Favorite Goalie")
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            // Check if any of the options is null
                                            if (firstOption == null ||
                                                secondOption == null ||
                                                thirdOption == null ||
                                                feedbackController
                                                    .text.isEmpty) {
                                              showToast(
                                                  "Please complete all fields before submitting",
                                                  false,
                                                  context);
                                            } else {
                                              setState(() {
                                                loading = true;
                                              });
                                              // Proceed with the API call if all fields are filled
                                              Future.microtask(() =>
                                                  Get.find<CommonController>()
                                                      .insertFeedbackApi(
                                                    context,
                                                    scheduleId: data.scheduleId
                                                        .toString(),
                                                    customerId: goalieData
                                                        .customerId
                                                        .toString(),
                                                    userID: goalieData.userId,
                                                    feedback:
                                                        feedbackController.text,
                                                    goalieOnTime:
                                                        (firstOption! + 1)
                                                            .toString(),
                                                    goalieFitInTeam:
                                                        (thirdOption! + 1)
                                                            .toString(),
                                                    goalieCaliber:
                                                        (secondOption! + 1)
                                                            .toString(),
                                                    rating: "0",
                                                    isFav: fav ? "1" : "0",
                                                  )).then((v) {
                                                setState(() {
                                                  loading = false;
                                                });
                                                Get.offAll(() =>
                                                    const DashboardScreen());
                                              });
                                            }
                                          },
                                          child: loading
                                              ? const Padding(
                                                  padding: EdgeInsets.all(1.0),
                                                  child:
                                                      CircularProgressIndicator
                                                          .adaptive(
                                                    backgroundColor:
                                                        Colors.white,
                                                  ),
                                                )
                                              : const Text("Submit"),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else if (controller.allGoalieInterestedModel != null &&
              controller.allGoalieInterestedModel!.data == null) {
            return centerHeadingText(context,
                "Nice work, you're all caught up on your post-game reviews");
          }

          return const Center(
              child: CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.red));
        },
      ),
    );
  }
}
