import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:hos_sports/service/controller/goalie_controller.dart';

import '../../../widgets/widgets.dart';

class MostPlayed extends StatefulWidget {
  const MostPlayed({super.key});

  @override
  State<MostPlayed> createState() => _MostPlayedState();
}

class _MostPlayedState extends State<MostPlayed> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GoalieController>(
      initState: (_) {
        Future.microtask(() => _.controller!.goalieAvgRatingApi(filed: "game"));
      },
      builder: (GoalieController controller) {
        if (controller.mostPlayedGameModel != null) {
          return controller.mostPlayedGameModel!.data != null
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: controller.mostPlayedGameModel!.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    var data = controller.mostPlayedGameModel!.data![index];
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
                          title: Text("${data.firstname} ${data.lastname![0]}"),
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
                )
              : const Center(child: Text("No Data"));
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
        //       effect: ShimmerEffect(),
        //       containersColor: Colors.black.withOpacity(.2),
        //       textBoneBorderRadius:
        //           TextBoneBorderRadius(BorderRadius.circular(0)),
        //       child: const Padding(
        //         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7.5),
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
    );
  }
}
