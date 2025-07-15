import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hos_sports/service/controller/common_controller.dart';
import 'package:hos_sports/widgets/widgets.dart';
import 'package:intl/intl.dart';

class GoalieUnpaidGameScreen extends StatefulWidget {
  const GoalieUnpaidGameScreen({super.key});

  @override
  State<GoalieUnpaidGameScreen> createState() => _GoalieUnpaidGameScreenState();
}

class _GoalieUnpaidGameScreenState extends State<GoalieUnpaidGameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Outstanding Payment"),
      ),
      body: Container(
        width: screenWidth(context),
        height: screenHeight(context),
        decoration: decoration(),
        child: GetBuilder<CommonController>(
          initState: (_) {
            Future.microtask(
                () => _.controller!.unpaidGameApi(filter: "goalie"));
          },
          builder: (CommonController controller) {
            if (controller.gameUnpaidModel != null &&
                controller.gameUnpaidModel!.success == "1") {
              return Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.gameUnpaidModel!.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        var reversedData =
                            controller.gameUnpaidModel!.data!.reversed.toList();
                        var data = reversedData[index];
                        DateTime initialDate =
                            DateTime.parse(data.gameDatetime.toString());
                        String formattedDate =
                            DateFormat("EEEE MMM dd, yyyy 'at' hh:mm a")
                                .format(initialDate);

                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 7.5),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.black,
                                border:
                                    Border.all(color: const Color(0xffDCD4D4)),
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
                                          child:
                                              Text("Team : ${data.teamName}")),
                                      const Expanded(
                                        child: SizedBox(),
                                      ),
                                      Text(
                                        "${priceConverter(amount: data.goalieCut.toString())}",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
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
                                          formattedDate,
                                        ),
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
                                      Text("${data.gameDuration} min"),
                                      Text(
                                        "${data.caliber} Caliber",
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
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
            } else if (controller.gameUnpaidModel != null &&
                controller.gameUnpaidModel!.success == "0") {
              return centerHeadingText(
                  context, "Nice work, you have no unpaid games!");
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
