import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:hos_sports/service/controller/common_controller.dart';
import 'package:hos_sports/service/controller/goalie_controller.dart';
import 'package:hos_sports/widgets/widgets.dart';

class HighestRating extends StatefulWidget {
  const HighestRating({super.key});

  @override
  State<HighestRating> createState() => _HighestRatingState();
}

class _HighestRatingState extends State<HighestRating> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GetBuilder<CommonController>(
            initState: (_) {
              Future.microtask(
                  () => _.controller!.goalieAllRatingApi(filed: "goalie"));
            },
            builder: (CommonController controller) {
              return SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 10,
                    ),
                    if (controller.goalieRatingModel != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 38),
                        child: Text(
                          "You are currently ranked ${getOrdinal(int.parse(controller.goalieRatingModel!.data!.userRating!.split("/").first))} with a score of ${controller.goalieRatingModel!.data!.avgRating}/5.0, Based on customer rating.",
                          textAlign: TextAlign.center,
                        ),
                      )
                    else
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        child: Center(
                            child: CircularProgressIndicator.adaptive(
                                backgroundColor: Colors.red)),
                      )
                  ],
                ),
              );
            },
          ),
          GetBuilder<GoalieController>(
            initState: (_) {
              Future.microtask(
                  () => _.controller!.goalieAvgRatingApi(filed: "avg"));
            },
            builder: (GoalieController controller) {
              if (controller.avgRatingModel != null) {
                if (controller.avgRatingModel!.success == "1") {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: 50,
                    itemBuilder: (BuildContext context, int index) {
                      var data = controller.avgRatingModel!.data![index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 7.5),
                        child: Card(
                          color: Colors.black,
                          margin: EdgeInsets.zero,
                          child: ListTile(
                            leading: SizedBox(
                                width: 50,
                                height: 50,
                                child: CustomImage(
                                  url: data.profilePic!,
                                  radius: 5,
                                )),
                            title: Text(
                                "${data.firstname} ${data.lastname!.isNotEmpty ? data.lastname![0] : ""}"),
                            trailing: Text(
                              "${data.avgRating}/5.0",
                              style: const TextStyle(color: Colors.white),
                            ),
                            subtitle: RatingBarIndicator(
                              rating: double.parse(data.avgRating!),
                              itemBuilder: (context, index) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              itemCount: 5,
                              itemSize: 16.0,
                              unratedColor: Colors.grey,
                              direction: Axis.horizontal,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Text("No Data");
                }
              }
              return const Center(
                  child: CircularProgressIndicator.adaptive(
                      backgroundColor: Colors.red));
              // return ListView.builder(
              //   shrinkWrap: true,
              //   physics: const ClampingScrollPhysics(),
              //   itemCount: 3,
              //   itemBuilder: (BuildContext context, int index) {
              //     return Skeletonizer(
              //       enabled: true,
              //       effect: const ShimmerEffect(),
              //       containersColor: Colors.black.withOpacity(.2),
              //       textBoneBorderRadius:
              //           TextBoneBorderRadius(BorderRadius.circular(0)),
              //       child: const Padding(
              //         padding:
              //             EdgeInsets.symmetric(horizontal: 20, vertical: 7.5),
              //         child: Card(
              //           margin: EdgeInsets.zero,
              //           child: ListTile(
              //             leading: Bone.circle(
              //               size: 50,
              //             ),
              //             title: Bone.text(
              //               words: 2,
              //             ),
              //             trailing: Bone.square(
              //               size: 25,
              //             ),
              //             subtitle: Bone.multiText(),
              //           ),
              //         ),
              //       ),
              //     );
              //   },
              // );
            },
          ),
        ],
      ),
    );
  }
}

String getOrdinal(int number) {
  if (number >= 11 && number <= 13) {
    return '$number' + 'th';
  }
  switch (number % 10) {
    case 1:
      return '$number' + 'st';
    case 2:
      return '$number' + 'nd';
    case 3:
      return '$number' + 'rd';
    default:
      return '$number' + 'th';
  }
}
