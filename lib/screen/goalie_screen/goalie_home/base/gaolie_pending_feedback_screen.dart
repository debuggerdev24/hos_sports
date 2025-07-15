import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hos_sports/screen/goalie_screen/goalie_home/base/feedback_details_screen.dart';
import 'package:hos_sports/service/controller/goalie_controller.dart';
import 'package:hos_sports/widgets/widgets.dart';
import 'package:intl/intl.dart';

class GoaliePendingFeedbackScreen extends StatefulWidget {
  const GoaliePendingFeedbackScreen({super.key});

  @override
  State<GoaliePendingFeedbackScreen> createState() =>
      _GoaliePendingFeedbackScreenState();
}

class _GoaliePendingFeedbackScreenState
    extends State<GoaliePendingFeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Outstanding Feedback"),
      ),
      body: Container(
        width: screenWidth(context),
        height: screenHeight(context),
        decoration: decoration(),
        child: GetBuilder<GoalieController>(
          initState: (_) {
            Future.microtask(
                () => _.controller!.goaliesPendingFeedbackListApi());
          },
          builder: (GoalieController controller) {
            if (controller.goaliePendingFeedbackModel != null &&
                controller.goaliePendingFeedbackModel!.success == "1") {
              return Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      itemCount:
                          controller.goaliePendingFeedbackModel!.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        var data =
                            controller.goaliePendingFeedbackModel!.data![index];
                        DateTime initialDate =
                            DateTime.parse(data.gameDatetime.toString());
                        String formattedDate =
                            DateFormat("EEEE MMM dd, yyyy 'at' hh:mm a")
                                .format(initialDate);

                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 7.5),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() => FeedbackDetailsScreen(
                                    data: data,
                                  ));
                            },
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
                                    child: Text(
                                      "${formattedDate}",
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
                                  const SizedBox(height: 5),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else if (controller.goaliePendingFeedbackModel != null &&
                controller.goaliePendingFeedbackModel!.success == "0") {
              return centerHeadingText(context,
                  "Nice work, you’re all caught up on your post-game reviews");
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
