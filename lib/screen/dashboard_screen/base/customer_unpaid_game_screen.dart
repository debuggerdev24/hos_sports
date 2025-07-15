import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hos_sports/service/controller/common_controller.dart';
import 'package:hos_sports/widgets/widgets.dart';
import 'package:intl/intl.dart';

class CustomerUnpaidGameScreen extends StatefulWidget {
  const CustomerUnpaidGameScreen({super.key});

  @override
  State<CustomerUnpaidGameScreen> createState() =>
      _CustomerUnpaidGameScreenState();
}

class _CustomerUnpaidGameScreenState extends State<CustomerUnpaidGameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Unpaid Game"),
      ),
      body: Container(
        width: screenWidth(context),
        height: screenHeight(context),
        decoration: decoration(),
        child: GetBuilder<CommonController>(
          initState: (_) {
            Future.microtask(
                () => _.controller!.unpaidGameApi(filter: "customer"));
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
                        var data = controller.gameUnpaidModel!.data![index];
                        DateTime initialDate =
                            DateTime.parse(data.gameDatetime.toString());
                        String formattedDate =
                            DateFormat("EEEE MMM dd, yyyy 'at' hh:mm a")
                                .format(initialDate);

                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 22, vertical: 7.5),
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
                                        child: Text(
                                            "Cancelled by : ${data.firstname} ${data.lastname![0].toUpperCase()}"),
                                        // child: Text(
                                        //   "${data.firstname} ${data.lastname}",
                                        // ),
                                      ),
                                      Text(
                                        "${data.amount}",
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
                                          child:
                                              Text("Team : ${data.teamName}")),
                                      Text("${data.gameDuration} min"),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text("Un-Paid"),
                                    )),
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
                  context, "You currently have no unpaid games");
              // return const Center(
              //     child: Text("You currently have no unpaid games"));
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
