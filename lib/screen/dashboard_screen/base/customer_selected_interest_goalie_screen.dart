import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hos_sports/service/controller/common_controller.dart';
import 'package:hos_sports/service/controller/customer_controller.dart';
import 'package:hos_sports/widgets/widgets.dart';
import 'package:intl/intl.dart';
import '../../../service/model/CustomerScheduleGoalieModel.dart';
import '../../../widgets/other_widgets.dart';
import 'customer_single_goalie_detail_screen.dart';

class CustomerSelectedGoalieInterestedScreen extends StatefulWidget {
  final String scheduleId;
  final Data data;

  const CustomerSelectedGoalieInterestedScreen(
      {super.key, required this.scheduleId, required this.data});

  @override
  State<CustomerSelectedGoalieInterestedScreen> createState() =>
      _CustomerSelectedGoalieInterestedScreenState();
}

class _CustomerSelectedGoalieInterestedScreenState
    extends State<CustomerSelectedGoalieInterestedScreen> {
  ////
  ////
  @override
  void dispose() {
    Future.microtask(() =>
        Get.find<CommonController>().goalieAllRatingApi(filed: "customer"));
    Future.microtask(
        () => Get.find<CustomerController>().goaliesAvailableRinkGameApi());
    super.dispose();
  }

  Decoration dec = BoxDecoration(
      color: Colors.black.withOpacity(.5),
      border: Border.all(color: Colors.white),
      borderRadius: BorderRadiusDirectional.circular(10));

  @override
  Widget build(BuildContext context) {
    var data = widget.data;
    return Scaffold(
      appBar: AppBar(
        title: Text("Scheduled Games"),
      ),
      body: Container(
        width: screenWidth(context),
        height: screenHeight(context),
        decoration: decoration(),
        child: GetBuilder<CustomerController>(
          initState: (_) {
            Future.microtask(() => _.controller!
                .customerSelectedGoalieApi(scheduleId: widget.scheduleId));
          },
          builder: (CustomerController controller) {
            if (controller.loadingSchedule) {
              return const Center(
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.red,
                ),
              );
            } else if (controller.allGoalieInterestedModel != null &&
                controller.allGoalieInterestedModel!.data != null) {
              var list = controller.allGoalieInterestedModel!.data!;
              DateTime initialDate =
                  DateTime.parse(data.gameDatetime.toString());
              String formattedDate =
                  DateFormat("EEEE MMM dd, yyyy 'at' hh:mm a")
                      .format(initialDate);
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 12),
                      Container(
                        decoration: dec,
                        child: GameCardWidget(
                            date: formattedDate,
                            teamName: data.teamName.toString(),
                            caliber: data.caliber.toString(),
                            format: data.format.toString(),
                            gameDuration: data.gameDuration.toString()),
                      ),
                      const SizedBox(height: 12),
                      const Text("Confirmed Goalie Details"),
                      const SizedBox(height: 10),
                      ListView.builder(
                        itemCount: list.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          var goalieData = list[index];
                          return Container(
                            decoration: dec,
                            child: ListTile(
                              onTap: () {
                                // Get.to(() => CustomerSingleGoalieDetailScreen(
                                //       goalieData: goalieData,
                                //     ));
                              },
                              leading: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CustomImage(
                                    url: goalieData.profilePic.toString(),
                                    radius: 10,
                                  )),
                              title: Text(
                                  "${goalieData.firstname} ${goalieData.lastname![0].toUpperCase()}"),
                              subtitle: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: <Widget>[
                                        const Text(
                                          "Rating",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Text(
                                          "${goalieData.rating}",
                                          style: const TextStyle(
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        const Text(
                                          "Caliber",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Text(
                                          "${goalieData.calibre}",
                                          style: const TextStyle(
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                    Column(
                                      children: <Widget>[
                                        const Text(
                                          "Games",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Text(
                                          "${goalieData.totalgame}",
                                          style: const TextStyle(
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            } else if (controller.allGoalieInterestedModel != null &&
                controller.allGoalieInterestedModel!.data == null) {
              return const Center(child: Text("No Goalie"));
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
