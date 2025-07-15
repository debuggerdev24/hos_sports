import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../service/controller/customer_controller.dart';
import '../../widgets/constants.dart';
import '../../widgets/widgets.dart';

class CustomerFavouriteScreen extends StatefulWidget {
  const CustomerFavouriteScreen({super.key});

  @override
  State<CustomerFavouriteScreen> createState() =>
      _CustomerFavouriteScreenState();
}

class _CustomerFavouriteScreenState extends State<CustomerFavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Container(
        width: screenWidth(context),
        height: screenHeight(context),
        decoration: decoration(),
        child: Column(
          children: [
            const TabBar(
                unselectedLabelColor: Colors.grey,
                labelColor: AppColor.primary,
                indicatorColor: AppColor.primary,
                tabs: [
                  Tab(
                    text: "Goalie",
                  ),
                  Tab(
                    text: "Favourite Rink",
                  ),
                ]),
            GetBuilder<CustomerController>(
              initState: (_) {
                Future.microtask(
                    () => _.controller!.customerFavoriteGoaliesApi());
                Future.microtask(
                    () => _.controller!.customerFavoritePlaceApi());
              },
              builder: (CustomerController controller) {
                return Expanded(
                  child: TabBarView(
                    children: [
                      controller.customerFavoriteGoalieModel != null
                          ? controller.customerFavoriteGoalieModel!.success ==
                                  "1"
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: controller
                                      .customerFavoriteGoalieModel!
                                      .data!
                                      .length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var data = controller
                                        .customerFavoriteGoalieModel!
                                        .data![index];
                                    print(data.toJson());
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Card(
                                        color: Colors.black,
                                        child: ListTile(
                                          leading: SizedBox(
                                              width: 55,
                                              height: 55,
                                              child: CustomImage(
                                                url: '${data.profilePic}',
                                                radius: 10,
                                              )),
                                          title: Text(
                                              "${data.firstname} ${data.lastname![0].toUpperCase()}"),
                                          subtitle: Text(
                                            "${data.calibre} caliber",
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          trailing: TextButton(
                                              onPressed: () {
                                                Future.microtask(() => controller
                                                    .removeCustomerFavoriteGoaliesApi(
                                                        context,
                                                        goalieId: data.userId
                                                            .toString())).then(
                                                    (value) {
                                                  Future.microtask(() => controller
                                                      .customerFavoriteGoaliesApi());
                                                });
                                              },
                                              child: const Text("Remove")),
                                        ),
                                      ),
                                    );
                                  },
                                )
                              : Center(
                                  child: centerHeadingText(context,
                                      "Add favourite Goalies when providing post-game feedback"),
                                )
                          : const Center(
                              child: CircularProgressIndicator.adaptive(
                                  backgroundColor: Colors.red)),
                      controller.customerFavouritePlaceModel != null
                          ? controller.customerFavouritePlaceModel!.success ==
                                  "1"
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: controller
                                      .customerFavouritePlaceModel!
                                      .data!
                                      .length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var data = controller
                                        .customerFavouritePlaceModel!
                                        .data![index];
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Card(
                                        color: Colors.black,
                                        child: ListTile(
                                          leading: CircleAvatar(
                                            backgroundColor: Colors.grey,
                                            child: Text("${index + 1}"),
                                          ),
                                          title: Text("${data.rink}"),
                                          subtitle: Text("${data.address}"),
                                          trailing: TextButton(
                                              onPressed: () {
                                                Future.microtask(() => controller
                                                    .removeCustomerFavoritePlaceApi(
                                                        context,
                                                        placeId: data.placeId
                                                            .toString())).then(
                                                    (value) {
                                                  Future.microtask(() => controller
                                                      .customerFavoritePlaceApi());
                                                });
                                              },
                                              child: const Text("Remove")),
                                        ),
                                      ),
                                    );
                                  },
                                )
                              : Center(
                                  child: centerHeadingText(context,
                                      "Favorite rinks auto-populate as you play games at the location"),
                                )
                          : const Center(
                              child: CircularProgressIndicator.adaptive(
                                  backgroundColor: Colors.red)),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
