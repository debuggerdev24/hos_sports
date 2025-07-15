import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hos_sports/screen/dashboard_screen/base/customer_interested_goalie_screen.dart';
import 'package:hos_sports/service/controller/customer_controller.dart';
import 'package:hos_sports/widgets/other_widgets.dart';
import 'package:intl/intl.dart';
import '../../../../widgets/widgets.dart';

class CustomerHistoryGameScreen extends StatefulWidget {
  const CustomerHistoryGameScreen({super.key});

  @override
  State<CustomerHistoryGameScreen> createState() =>
      _CustomerHistoryGameScreenState();
}

class _CustomerHistoryGameScreenState extends State<CustomerHistoryGameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Game History"),
      ),
      body: Container(
        width: screenWidth(context),
        height: screenHeight(context),
        decoration: decoration(),
        child: GetBuilder<CustomerController>(
          initState: (_) {
            Future.microtask(() => _.controller!.customerHistoryApi());
          },
          builder: (CustomerController controller) {
            if (controller.customerGameHistoryModel != null &&
                controller.customerGameHistoryModel!.success == "1") {
              return controller.customerGameHistoryModel!.data!.isNotEmpty
                  ? Column(
                      children: <Widget>[
                        Expanded(
                          child: ListView.builder(
                            itemCount: controller
                                .customerGameHistoryModel!.data!.length,
                            itemBuilder: (BuildContext context, int index) {
                              var data = controller
                                  .customerGameHistoryModel!.data![index];
                              DateTime initialDate =
                                  DateTime.parse(data.gameDatetime.toString());
                              String formattedDate =
                                  DateFormat("EEEE MMM dd, yyyy 'at' hh:mm a")
                                      .format(initialDate);

                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 22, vertical: 7.5),
                                child: GestureDetector(
                                  onTap: () {
                                    // Get.to(() => ScheduledGameDetailsScreen(
                                    //   data: data,
                                    // ));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        border: Border.all(
                                            color: const Color(0xffDCD4D4)),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                            decoration: dec,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text("${data.gameStatus}"),
                                            )),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    )
                  : const Center(child: Text("No Game History"));
            } else if (controller.customerGameHistoryModel != null &&
                controller.customerGameHistoryModel!.success == "0") {
              return const Center(child: Text("No Game History"));
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
