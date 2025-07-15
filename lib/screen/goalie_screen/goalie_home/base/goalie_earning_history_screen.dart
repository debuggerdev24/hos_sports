import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hos_sports/service/controller/common_controller.dart';
import 'package:hos_sports/widgets/widgets.dart';
import 'package:intl/intl.dart';

class GoalieEarningHistoryScreen extends StatefulWidget {
  const GoalieEarningHistoryScreen({super.key});

  @override
  State<GoalieEarningHistoryScreen> createState() =>
      _GoalieEarningHistoryScreenState();
}

class _GoalieEarningHistoryScreenState
    extends State<GoalieEarningHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Earning History"),
      ),
      body: Container(
        width: screenWidth(context),
        height: screenHeight(context),
        decoration: decoration(),
        child: GetBuilder<CommonController>(
          initState: (_) {
            Future.microtask(
                () => _.controller!.gamePaymentApi(filter: "goalie"));
          },
          builder: (CommonController controller) {
            if (controller.gamePaymentModel != null) {
              return Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        "Total : ${priceConverter(amount: controller.gamePaymentModel!.totalGoalieCut ?? "0")}"),
                  ),
                  if (controller.gamePaymentModel!.data != null)
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller.gamePaymentModel!.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          var data = controller.gamePaymentModel!.data![index];
                          DateTime initialDate =
                              DateTime.parse(data.gameDatetime.toString());
                          String formattedDate =
                              DateFormat("EEEE MMM dd, yyyy 'at' hh:mm a")
                                  .format(initialDate);

                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 13, vertical: 7.5),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  border: Border.all(
                                      color: const Color(0xffDCD4D4)),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 11,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            formattedDate,
                                          ),
                                        ),
                                        Text(
                                          "${data.caliber} Caliber",
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                            child: Text(
                                                "Team : ${data.teamName}")),
                                        Text("${data.gameDuration} min"),
                                      ],
                                    ),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Divider(),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                      "Earning Amount : ${priceConverter(amount: data.amount.toString())}"),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                ],
              );
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
