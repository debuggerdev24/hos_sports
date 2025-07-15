import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hos_sports/service/controller/auth_controller.dart';
import 'package:hos_sports/service/controller/common_controller.dart';
import 'package:hos_sports/service/controller/goalie_controller.dart';
import 'package:hos_sports/widgets/constants.dart';
import 'package:hos_sports/widgets/other_widgets.dart';
import 'package:hos_sports/widgets/widgets.dart';
import 'package:intl/intl.dart';

class GoalieGameRatingScreen extends StatefulWidget {
  const GoalieGameRatingScreen({super.key});

  @override
  State<GoalieGameRatingScreen> createState() => _GoalieGameRatingScreenState();
}

class _GoalieGameRatingScreenState extends State<GoalieGameRatingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(
        () => Get.find<GoalieController>().goalieParticularGameRatingApi());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rating"),
      ),
      body: Container(
        width: screenWidth(context),
        height: screenHeight(context),
        decoration: decoration(),
        child: GetBuilder<GoalieController>(
          builder: (GoalieController controller) {
            if (controller.goalieGameRatingModel != null) {
              if (controller.goalieGameRatingModel!.success == "1") {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: CustomDimension.horizontal),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 10),
                        GetBuilder<AuthController>(
                          builder: (AuthController controller) {
                            return Container(
                              decoration: dec,
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CustomImage(
                                        url: controller.userModel!.profilePic
                                            .toString(),
                                        radius: 10,
                                      )),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            "${controller.userModel!.firstname.toString()} ${controller.userModel!.lastname!.isNotEmpty ? controller.userModel!.lastname![0] : ""}"),
                                        GetBuilder<CommonController>(
                                          builder:
                                              (CommonController controller) {
                                            if (controller.goalieRatingModel !=
                                                null) {
                                              return Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Column(
                                                    children: <Widget>[
                                                      const Text("Rating"),
                                                      Text(
                                                          "${controller.goalieRatingModel!.data!.avgRating}"),
                                                    ],
                                                  ),
                                                  Column(
                                                    children: <Widget>[
                                                      const Text("Games"),
                                                      Text(
                                                          "${controller.goalieRatingModel!.data!.game}"),
                                                    ],
                                                  ),
                                                ],
                                              );
                                            } else {
                                              return const CircularProgressIndicator
                                                  .adaptive(
                                                  backgroundColor: Colors.red);
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount:
                              controller.goalieGameRatingModel!.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            var data =
                                controller.goalieGameRatingModel!.data![index];
                            DateTime initialDate =
                                DateTime.parse(data.gameDatetime.toString());
                            String formattedDate =
                                DateFormat("EEEE MMM dd, yyyy 'at' hh:mm a")
                                    .format(initialDate);
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Container(
                                decoration: dec,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    GameCardWidget(
                                        date: formattedDate,
                                        teamName: data.teamName.toString(),
                                        caliber: data.caliber.toString(),
                                        format: data.format.toString(),
                                        gameDuration:
                                            data.gameDuration.toString()),
                                    const Divider(),
                                    const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text("On Time"),
                                        Text("Fit In"),
                                        Text("Caliber"),
                                      ],
                                    ),
                                    const Divider(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text("${data.goalieOnTime}"),
                                        Text("${data.goalieFitInTeam}"),
                                        Text("${data.goalieCaliber}"),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(data.feedback.toString()),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return centerHeadingText(context,
                    "Please come back once you have completed your first game and the Customer has submitted feedback");
              }
            } else {
              return const Center(
                  child: CircularProgressIndicator.adaptive(
                      backgroundColor: Colors.red));
            }
          },
        ),
      ),
    );
  }
}
