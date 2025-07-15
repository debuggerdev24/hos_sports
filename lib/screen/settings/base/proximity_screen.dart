import 'dart:developer';

import 'package:blurry_modal_progress_hud/blurry_modal_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hos_sports/service/controller/auth_controller.dart';
import 'package:hos_sports/service/controller/goalie_controller.dart';
import 'package:hos_sports/widgets/toast.dart';
import 'package:hos_sports/widgets/widgets.dart';

import '../../../widgets/constants.dart';

class ProximityScreen extends StatefulWidget {
  const ProximityScreen({super.key});

  @override
  State<ProximityScreen> createState() => _ProximityScreenState();
}

class _ProximityScreenState extends State<ProximityScreen> {
  String distance = '0';
  String? oldDistance;
  List proximity = [30, 50, 75, 100];
  int defaultInt = 3; // Set to 3, which corresponds to 100 in `proximity`

  bool setDataKm = true;
  bool blurLoaing = false;
  bool dataLoaded = true;

  @override
  Widget build(BuildContext context) {
    return BlurryModalProgressHUD(
      inAsyncCall: blurLoaing,
      blurEffectIntensity: 4,
      dismissible: false,
      opacity: 0.4,
      color: Colors.black,
      progressIndicator: Center(
          child:
              CircularProgressIndicator.adaptive(backgroundColor: Colors.red)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Playing Proximity"),
        ),
        body: Container(
          height: screenHeight(context),
          decoration: decoration(),
          child: GetBuilder<AuthController>(initState: (_) async {
            dataLoaded = true;
            var datGet =
                await Future.microtask(() => _.controller!.getUsersDetailsApi())
                    .then((v) async {
              await Future.delayed(
                  const Duration(milliseconds: 500)); // Add 1 sec delay
              dataLoaded = false;
              setState(() {});
            });
          }, builder: (AuthController controller) {
            if (controller.userModel != null) {
              var data = controller.userModel;
              oldDistance = data!.kilometersToTravel;

              log('kilometers_to_travel   ' + oldDistance.toString());
              log(distance.toString());
              return dataLoaded
                  ? Center(
                      child: CircularProgressIndicator.adaptive(),
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 20),
                        const Text("I would like to see games within"),
                        const SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: List.generate(
                            proximity.length,
                            (index) => Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
                              child: OutlinedButton(
                                onPressed: () {
                                  distance = proximity[index].toString();

                                  setState(() {});
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                    (distance == '0' &&
                                                oldDistance ==
                                                    proximity[index]
                                                        .toString()) ||
                                            distance ==
                                                proximity[index].toString()
                                        ? AppColor.primary
                                        : Colors.black,
                                  ),
                                ),
                                child: Text("${proximity[index]} KM"),
                              ),
                            ),
                          ),
                        ),
                        if (distance != '0')
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 15),
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      side: MaterialStateProperty.all(
                                        const BorderSide(
                                            color: Colors.white, width: 2),
                                      ),
                                    ),
                                    onPressed: () async {
                                      blurLoaing = true;
                                      setState(() {});
                                      if (distance != '0') {
                                        await Future.microtask(() =>
                                            Get.find<GoalieController>()
                                                .userUpdateDistanceApi(context,
                                                    distance: distance!));
                                        blurLoaing = false;
                                        setState(() {});
                                        Get.back();
                                      } else {
                                        showToast(
                                            "Select Distance", false, context);
                                      }
                                    },
                                    child: const Text("Update"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ],
                    );
            } else {
              return const Center(
                  child: CircularProgressIndicator.adaptive(
                      backgroundColor: Colors.red));
            }
          }),
        ),
      ),
    );
  }
}
