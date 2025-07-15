import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hos_sports/service/controller/customer_controller.dart';
import 'package:hos_sports/widgets/constants.dart';
import 'package:hos_sports/widgets/toast.dart';
import 'package:hos_sports/widgets/widgets.dart';

class CustomerNotificationScreen extends StatefulWidget {
  final String type;

  const CustomerNotificationScreen({super.key, required this.type});

  @override
  State<CustomerNotificationScreen> createState() =>
      _CustomerNotificationScreenState();
}

class _CustomerNotificationScreenState
    extends State<CustomerNotificationScreen> {
  bool isAvailablePlayGame = false;
  bool confirmedMyGame = false;
  bool hasArrive = false;
  bool isAvailableNewPromotion = false;
  bool feedback = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          ImageConst.topBackImage,
          scale: 5,
        ),
      ),
      body: GetBuilder<CustomerController>(
        initState: (_) {
          Future.microtask(() => _.controller!
              .userCustomerNotificationSettingApi(false,
                  notification: widget.type)).then((v) {
            if (v.success == "1") {
              isAvailablePlayGame = v.data!.isAvailabelPlayGame == "1";
              confirmedMyGame = v.data!.confirmedMyGame == "1";
              hasArrive = v.data!.hasArrive == "1";
              isAvailableNewPromotion = v.data!.isAvailableNewPromotion == "1";
              feedback = v.data!.feedback == "1";
              setState(() {});
            }
          });
        },
        builder: (CustomerController controller) {
          return Container(
            decoration: decoration(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  NotificationTiles(
                    title: "A goalie is available to play my game",
                    value: isAvailablePlayGame,
                    onChanged: (val) {
                      isAvailablePlayGame = !isAvailablePlayGame;
                      setState(() {});
                    },
                  ),
                  NotificationTiles(
                    title: "A confirmed goalie for my game has canceled",
                    value: confirmedMyGame,
                    onChanged: (val) {
                      confirmedMyGame = !confirmedMyGame;
                      setState(() {});
                    },
                  ),
                  NotificationTiles(
                    title: "Goalie has arrived at the rink",
                    value: hasArrive,
                    onChanged: (val) {
                      hasArrive = !hasArrive;
                      setState(() {});
                    },
                  ),
                  NotificationTiles(
                    title: "A new promotion is available",
                    value: isAvailableNewPromotion,
                    onChanged: (val) {
                      isAvailableNewPromotion = !isAvailableNewPromotion;
                      setState(() {});
                    },
                  ),
                  NotificationTiles(
                    title: "I have outstanding feedback",
                    value: feedback,
                    onChanged: (val) {
                      feedback = !feedback;
                      setState(() {});
                    },
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Future.microtask(
                            () => controller.userCustomerNotificationSettingApi(
                                  true,
                                  notification: widget.type,
                                  confirmedMyGame: confirmedMyGame ? "1" : "0",
                                  hasArrive: hasArrive ? "1" : "0",
                                  isAvailableNewPromotion:
                                      isAvailableNewPromotion ? "1" : "0",
                                  isAvailablePlayGame:
                                      isAvailablePlayGame ? "1" : "0",
                                  feedback: feedback ? "1" : "0",
                                )).then((v) {
                          if (v.success == "1") {
                            showSnackBar(context, "Updated");
                            isAvailablePlayGame =
                                v.data!.isAvailabelPlayGame == "1";
                            confirmedMyGame = v.data!.confirmedMyGame == "1";
                            hasArrive = v.data!.hasArrive == "1";
                            isAvailableNewPromotion =
                                v.data!.isAvailableNewPromotion == "1";
                            feedback = v.data!.feedback == "1";
                            setState(() {});
                          }
                        });
                      },
                      child: const Text("Save"))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
