import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hos_sports/screen/dashboard_screen/base/pending_review/customer_feedback_details_screen.dart';
import 'package:hos_sports/screen/goalie_screen/goalie_home/base/feedback_details_screen.dart';
import 'package:hos_sports/service/controller/customer_controller.dart';
import 'package:hos_sports/service/controller/goalie_controller.dart';
import 'package:hos_sports/service/model/CustomerScheduleGoalieModel.dart';
import 'package:hos_sports/widgets/widgets.dart';
import 'package:intl/intl.dart';
import '../../../../widgets/other_widgets.dart';
import 'customer_pending_game_review_screen.dart';
import '../customer_selected_interest_goalie_screen.dart';

class CustomerPendingFeedbackListScreen extends StatefulWidget {
  const CustomerPendingFeedbackListScreen({super.key});

  @override
  State<CustomerPendingFeedbackListScreen> createState() =>
      _CustomerPendingFeedbackListScreenState();
}

class _CustomerPendingFeedbackListScreenState
    extends State<CustomerPendingFeedbackListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Outstanding Feedback"),
        // title: const Text("Customer Feedbacks"),
      ),
      body: Container(
        width: screenWidth(context),
        height: screenHeight(context),
        decoration: decoration(),
        child: GetBuilder<CustomerController>(
          initState: (_) {
            Future.microtask(
                () => _.controller!.customerPendingFeedbackListApi());
          },
          builder: (CustomerController controller) {
            if (controller.customerPendingFeedbackModel != null &&
                controller.customerPendingFeedbackModel!.success == "1") {
              return Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      itemCount:
                          controller.customerPendingFeedbackModel!.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        var data = controller
                            .customerPendingFeedbackModel!.data![index];
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
                              var a = CustomerScheduleGoalieModel.fromJson(
                                  controller.customerPendingFeedbackModel!
                                      .toJson());
                              Get.to(() => CustomerPendingGameReviewScreen(
                                    data: a.data![index],
                                    scheduleId: '${data.scheduleId}',
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
                                  GameCardWidget(
                                      date: formattedDate,
                                      teamName: data.teamName.toString(),
                                      caliber: data.caliber.toString(),
                                      format: data.format.toString(),
                                      gameDuration:
                                          data.gameDuration.toString()),
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
            } else if (controller.customerPendingFeedbackModel != null &&
                controller.customerPendingFeedbackModel!.success == "0") {
              return centerHeadingText(
                  context, "Currently no outstanding feedback found");
              // return const Center(
              //     child: Text("Currently no outstanding feedback found."));
            }
            return const Center(
                child: CircularProgressIndicator.adaptive(
                    backgroundColor: Colors.red));
          },
        ),
      ),
    );
  }
}
