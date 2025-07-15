import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hos_sports/screen/dashboard_screen/base/history/customer_history_game_screen.dart';
import 'package:hos_sports/screen/dashboard_screen/base/pending_review/customer_pending_feedback_list_screen.dart';
import 'package:hos_sports/screen/dashboard_screen/base/schedule/customer_schedule_game_screen.dart';
import 'package:hos_sports/screen/dashboard_screen/base/submitted/customer_submitted_game_screen.dart';
import 'package:hos_sports/screen/goalie_screen/goalie_home/goalie_home_screen.dart';
import 'package:hos_sports/screen/promotion_screen.dart';
import 'package:hos_sports/screen/schedule_game/schedule_form.dart';
import 'package:hos_sports/service/controller/common_controller.dart';
import 'package:hos_sports/service/controller/customer_controller.dart';
import 'package:hos_sports/widgets/forceUpdateSheet.dart';
import 'package:hos_sports/widgets/toast.dart';
import 'package:hos_sports/widgets/widgets.dart';
import 'base/cancel/customer_cancel_game_screen.dart';
import 'base/customer_unpaid_game_screen.dart';
import 'base/goalie_next_time/goalie_available_next_time.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Get.find<CommonController>().goalieAllRatingApi(filed: "customer"));
  }

  Future<void> _refreshData() async {
    Future.microtask(
        () => Get.find<CustomerController>().goaliesAvailableRinkGameApi());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          color: Colors.white12,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: screenWidth(context),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  Get.to(() => const PromotionScreen());
                },
                child: const Text(
                  'Promotions',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.find<CommonController>().shareSms();
                },
                child: const Text(
                  'Easy Share',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.find<CommonController>().share();
                },
                child: const Text(
                  'Social Share',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        RefreshIndicator(
          onRefresh: _refreshData,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => const GoalieAvailableNextTime());
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.50),
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      children: [
                        GetBuilder<CustomerController>(
                          initState: (_) {
                            Future.microtask(() =>
                                _.controller!.goaliesAvailableRinkGameApi());
                            Future.microtask(() => _.controller!
                                .goalieAllRatingApi(filed: "customer"));
                          },
                          builder: (CustomerController controller) {
                            // Check if loadingNewGame is true
                            if (controller.loadingNewGame) {
                              return Container(
                                child: const Center(
                                  child: CircularProgressIndicator.adaptive(
                                    backgroundColor: Colors.red,
                                  ),
                                ),
                              );
                            }

                            // Check if goalieAvailableRickTime is not null and data is not empty
                            if (controller.goalieAvailableRickTime
                                    ?.lastInterestId?.isNotEmpty ??
                                false) {
                              return Text(
                                '(${controller.goalieAvailableRickTime?.lastInterestId?.length})',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              );
                            } else {
                              return const Text(
                                '(0)',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            }
                          },
                        ),
                        const Text(
                          'Goalies available for your next time',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // ElevatedButton(
                //     onPressed: () {
                //       showCircularBottomSheet(context, "", "", "", "",'');
                //     },
                //     child: Text("show sheet")),
                const SizedBox(height: 10),
                GetBuilder<CommonController>(
                  builder: (CommonController controller) {
                    if (controller.goalieRatingModel != null) {
                      var data = controller.goalieRatingModel!.data;
                      return GridView.count(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        childAspectRatio: 2.5,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        crossAxisCount: 2,
                        children: [
                          HomeCard(
                              onTap: () {
                                // showAutoCloseAlertDialog(context,
                                //     "Your game has been submitted and we are notifiying Goalies in your area");
                                Get.to(
                                    () => const CustomerSubmittedGameScreen());
                              },
                              count: data!.availabel.toString(),
                              color: data.availabel == "0"
                                  ? Colors.white
                                  : Colors.green,
                              title: "Submitted"),
                          HomeCard(
                              onTap: () {
                                Get.to(
                                    () => const CustomerScheduleGameScreen());
                              },
                              count: data.schedule.toString(),
                              color: data.schedule == "0"
                                  ? Colors.white
                                  : Colors.green,
                              title: "Scheduled"),
                          HomeCard(
                              onTap: () {
                                Get.to(() => const CustomerHistoryGameScreen());
                              },
                              count: data.history.toString(),
                              title: "History"),
                          HomeCard(
                              onTap: () {
                                Get.to(() => const CustomerCancelGameScreen());
                              },
                              count: data.cancel.toString(),
                              color: data.cancelColor == "red"
                                  ? Colors.red
                                  : Colors.white,
                              title: "Cancelled"),
                          HomeCard(
                              onTap: () {
                                Get.to(() => const CustomerUnpaidGameScreen());
                              },
                              count: data.unpaid.toString(),
                              color: data.unpaid == "0"
                                  ? Colors.white
                                  : Colors.red,
                              title: "Outstanding Payment"),
                          HomeCard(
                              onTap: () {
                                Get.to(() =>
                                    const CustomerPendingFeedbackListScreen());
                              },
                              count: data.feedback.toString(),
                              color: data.feedback == "0"
                                  ? Colors.white
                                  : Colors.red,
                              title: "Outstanding Feedback"),
                        ],
                      );
                    }
                    return const Center(
                        child: CircularProgressIndicator.adaptive(
                            backgroundColor: Colors.red));
                  },
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => const ScheduleGameForm());
                    },
                    child: SizedBox(
                      width: screenWidth(context),
                      height: 45,
                      child: const Center(
                        child: Text(
                          'Schedule A Game',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: const Column(
                    children: [
                      Text(
                        'Reminder - In fairness to our goalies, games are not to be canceled within four hours of puck drop.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Please do not submit a game that potentially will not happen.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
        const SizedBox()
      ],
    );
  }
}
