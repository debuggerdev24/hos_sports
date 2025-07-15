import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hos_sports/screen/dashboard_screen/dashboard_screen.dart';
import 'package:hos_sports/service/controller/common_controller.dart';
import 'package:hos_sports/widgets/toast.dart';
import 'package:hos_sports/widgets/widgets.dart';
import 'package:intl/intl.dart';

import '../../../../service/model/AllGoalieInterestedModel.dart' as goalie;
import '../../../../service/model/CustomerScheduleGoalieModel.dart' as game;
import '../../../../widgets/other_widgets.dart';

class CustomerFeedbackDetailsScreen extends StatefulWidget {
  final goalie.Data data;
  final game.Data games;

  const CustomerFeedbackDetailsScreen(
      {super.key, required this.data, required this.games});

  @override
  State<CustomerFeedbackDetailsScreen> createState() =>
      _CustomerFeedbackDetailsScreenState();
}

class _CustomerFeedbackDetailsScreenState
    extends State<CustomerFeedbackDetailsScreen> {
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
    var games = widget.games;
    DateTime initialDate = DateTime.parse(games.gameDatetime.toString());
    String formattedDate =
        DateFormat("EEEE MMM dd, yyyy 'at' hh:mm a").format(initialDate);
    return Scaffold(
      appBar: AppBar(
        // title: const Text("Customer Feedbacks"),
        title: const Text("Customer Feedback"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              // Container(
              //   decoration: dec,
              //   child: ListTile(
              //     leading: SizedBox(
              //         width: 50,
              //         height: 50,
              //         child: CustomImage(
              //           url: data.profilePic.toString(),
              //           radius: 5,
              //         )),
              //     title: Row(
              //       children: [
              //         Expanded(
              //           child: Text("${data.firstname} ${data.lastname}"),
              //         ),
              //         Text(data.ashlRegister == "1" ? "ASHL Register" : ""),
              //       ],
              //     ),
              //     subtitle: Padding(
              //       padding: const EdgeInsets.symmetric(vertical: 5),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceAround,
              //         children: [
              //           Column(
              //             children: <Widget>[
              //               const Text(
              //                 "Rating",
              //                 style: TextStyle(color: Colors.white),
              //               ),
              //               Text(
              //                 "${data.rating}",
              //                 style: const TextStyle(color: Colors.white),
              //               )
              //             ],
              //           ),
              //           Column(
              //             children: <Widget>[
              //               const Text(
              //                 "Caliber",
              //                 style: TextStyle(color: Colors.white),
              //               ),
              //               Text(
              //                 "${data.calibre}",
              //                 style: const TextStyle(color: Colors.white),
              //               )
              //             ],
              //           ),
              //           Column(
              //             children: <Widget>[
              //               const Text(
              //                 "Games",
              //                 style: TextStyle(color: Colors.white),
              //               ),
              //               Text(
              //                 "${data.totalgame}",
              //                 style: const TextStyle(color: Colors.white),
              //               )
              //             ],
              //           ),
              //         ],
              //       ),
              //     ),
              //     trailing: Text("${data.ashlRegister}"),
              //   ),
              // ),
              // const SizedBox(height: 10),
              // Container(
              //     decoration: dec,
              //     child: const Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Padding(
              //             padding: EdgeInsets.all(8.0),
              //             child: Text("Goalie Profile")),
              //       ],
              //     )),
              const SizedBox(height: 10),
              Container(
                  decoration: dec,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GameCardWidget(
                        date: formattedDate,
                        teamName: games.teamName.toString(),
                        caliber: data.calibre.toString(),
                        format: games.format.toString(),
                        gameDuration: games.gameDuration.toString()),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 5,
                    ),
                    const Text("Was the goalie on time"),
                    const SizedBox(
                      height: 2,
                    ),
                    const Text("(15 min before rental time)"),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          5,
                          (index) => TextButton(
                                onPressed: () {
                                  firstOption = index;
                                  setState(() {});
                                },
                                style: ButtonStyle(
                                    foregroundColor:
                                        WidgetStateProperty.all(Colors.white)),
                                child: Container(
                                  decoration: index == firstOption ? dec : null,
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
                    const Text("Did the goalie fit in with team/room"),
                    const SizedBox(
                      height: 2,
                    ),
                    const Text("(reasonable efforts to be part of the room)"),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          5,
                          (index) => TextButton(
                                onPressed: () {
                                  secondOption = index;
                                  setState(() {});
                                },
                                style: ButtonStyle(
                                    foregroundColor:
                                        WidgetStateProperty.all(Colors.white)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration:
                                        index == secondOption ? dec : null,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("${index + 1}"),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 5,
                    ),
                    const Text("Was the goalie appropriate caliber"),
                    const SizedBox(
                      height: 2,
                    ),
                    const Text("(Min 4, if there was only 1 goalie available)"),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          5,
                          (index) => TextButton(
                                onPressed: () {
                                  thirdOption = index;
                                  setState(() {});
                                },
                                style: ButtonStyle(
                                    foregroundColor:
                                        WidgetStateProperty.all(Colors.white)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration:
                                        index == thirdOption ? dec : null,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("${index + 1}"),
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
                      value: fav,
                      onChanged: (value) {
                        fav = value!;
                        setState(() {});
                      }),
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
                            feedbackController.text.isEmpty) {
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
                              Get.find<CommonController>().insertFeedbackApi(
                                context,
                                scheduleId: data.scheduleId.toString(),
                                customerId: data.customerId.toString(),
                                feedback: feedbackController.text,
                                goalieOnTime: (firstOption! + 1).toString(),
                                goalieFitInTeam: (thirdOption! + 1).toString(),
                                goalieCaliber: (secondOption! + 1).toString(),
                                rating: "0",
                                isFav: fav ? "1" : "0",
                              )).then((v) {
                            setState(() {
                              loading = false;
                            });
                            Get.offAll(const DashboardScreen());
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
        ),
      ),
    );
  }
}
