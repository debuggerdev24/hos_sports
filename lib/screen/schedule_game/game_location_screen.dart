import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:hos_sports/service/controller/customer_controller.dart';
import 'package:hos_sports/widgets/widgets.dart';

import '../../widgets/constants.dart';

class GameLocationScreen extends StatefulWidget {
  const GameLocationScreen({super.key});

  @override
  State<GameLocationScreen> createState() => _GameLocationScreenState();
}

class _GameLocationScreenState extends State<GameLocationScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  LatLng _latLng = const LatLng(43.6468373, -79.3812663);
  String rink = "";
  String placeId = "";
  final address = TextEditingController();
  TextEditingController placeController = TextEditingController();
  Set<Marker> markers = {};

  showAddressDialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            backgroundColor: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 20,
                ),
                GooglePlaceAutoCompleteTextField(
                  textEditingController: placeController,
                  boxDecoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                  googleAPIKey: GoogleMapKey.allKey,
                  countries: const ["ca"],
                  inputDecoration: const InputDecoration(
                      labelText: "Search New Rink",
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      )),
                  debounceTime: 800,
                  isLatLngRequired: true,
                  itemClick: (pre) {
                    address.text = pre.description!;
                  },
                  getPlaceDetailWithLatLng: (Prediction prediction) async {
                    print(prediction.toJson());
                    placeId = prediction.placeId.toString();
                    rink = prediction.structuredFormatting!.mainText.toString();
                    _latLng = LatLng(double.parse(prediction.lat!),
                        double.parse(prediction.lng!));
                    markers.clear();
                    markers.add(Marker(
                        markerId: const MarkerId("1"), position: _latLng));
                    final GoogleMapController controller =
                        await _controller.future;
                    await controller.animateCamera(
                        CameraUpdate.newCameraPosition(
                            CameraPosition(target: _latLng, zoom: 15)));
                    Get.back();
                    setState(() {});
                  },
                  itemBuilder: (context, index, Prediction prediction) {
                    return Container(
                      color: Colors.black,
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          Expanded(
                              child: Text(
                            prediction.description ?? "",
                          ))
                        ],
                      ),
                    );
                  },
                  isCrossBtnShown: true,
                  containerHorizontalPadding: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Center(child: Text("Favourite Rink")),
                const Divider(),
                Expanded(
                  child: GetBuilder<CustomerController>(
                    builder: (CustomerController controller) {
                      if (controller.customerFavouritePlaceModel != null &&
                          controller.customerFavouritePlaceModel!.data !=
                              null) {
                        if (controller
                            .customerFavouritePlaceModel!.data!.isNotEmpty) {
                          return Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColor.primary),
                                borderRadius: BorderRadius.circular(20)),
                            child: ListView.builder(
                              physics: const ClampingScrollPhysics(),
                              itemCount: controller
                                  .customerFavouritePlaceModel!.data!.length,
                              itemBuilder: (BuildContext context, int index) {
                                var data = controller
                                    .customerFavouritePlaceModel!.data![index];
                                return ListTile(
                                  onTap: () async {
                                    _latLng = LatLng(
                                        double.parse(data.latitude.toString()),
                                        double.parse(
                                            data.longitude.toString()));
                                    address.text = "${data.address}";
                                    rink = "${data.rink}";
                                    placeId = "${data.placeId}";
                                    markers.clear();
                                    markers.add(Marker(
                                        markerId: const MarkerId("1"),
                                        position: _latLng));
                                    final GoogleMapController controller =
                                        await _controller.future;
                                    await controller.animateCamera(
                                        CameraUpdate.newCameraPosition(
                                            CameraPosition(
                                                // bearing: 192.8334901395799,
                                                target: _latLng,
                                                // tilt: 59.440717697143555,
                                                zoom: 15)));
                                    Get.back();
                                    setState(() {});
                                  },
                                  title: Text(data.rink.toString()),
                                  subtitle: Text(data.rink.toString()),
                                );
                              },
                            ),
                          );
                        } else {
                          return Container();
                        }
                      } else if (controller.customerFavouritePlaceModel !=
                              null &&
                          controller.customerFavouritePlaceModel!.data ==
                              null) {
                        return Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColor.primary),
                                borderRadius: BorderRadius.circular(20)),
                            child: const Center(
                                child: Text("No Recent Location")));
                      } else {
                        return Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColor.primary),
                              borderRadius: BorderRadius.circular(20)),
                          child: const Center(
                              child: Text("Please use the search bar above")),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(
        () => Get.find<CustomerController>().customerFavoritePlaceApi());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        title: Image.asset(
          ImageConst.topBackImage,
          scale: 5,
        ),
        actions: [
          if (placeId.isNotEmpty)
            ElevatedButton(
              onPressed: () {
                Navigator.pop(
                    context,
                    PlaceSaveModel(
                        rink: rink,
                        address: address.text,
                        latLng: _latLng,
                        placeId: placeId));
              },
              child: const Text("Done"),
            ),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 20, top: 10),
            child: Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Text(
                'Rating',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: Align(
              alignment: AlignmentDirectional.centerEnd,
              child: RatingBarIndicator(
                rating: 5,
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 18.0,
                direction: Axis.horizontal,
              ),
            ),
          ),
          Expanded(
            child: Card(
              color: Colors.black,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                color: Colors.black,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // CustomTextFormField(
                    //   controller: address,
                    //   enabled: false,
                    //   onTap: () {
                    //     showAddressDialog();
                    //   },
                    //   maxLines: 3,
                    //   labelText:
                    //       'Please click here to enter Arena name or view Favourites',
                    // ),

                    OutlinedButton(
                        style: ButtonStyle(
                            side: MaterialStateProperty.all(
                              BorderSide(color: AppColor.primary),
                            ),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black)),
                        onPressed: () async {
                          showAddressDialog();
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  address.text.isEmpty
                                      ? "Please click here to enter Arena name or view Favourites"
                                      : address.text.toString(),
                                ),
                              ),
                            ],
                          ),
                        )),
                    SizedBox(height: 10),
                    Expanded(
                      child: SizedBox(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: GoogleMap(
                            mapType: MapType.normal,
                            initialCameraPosition: CameraPosition(
                              target: _latLng,
                              zoom: 8.4746,
                            ),
                            onMapCreated: (GoogleMapController controller) {
                              _controller.complete(controller);
                            },
                            // onTap: (latLng) {
                            //   _latLng = latLng;
                            //   setState(() {});
                            // },
                            // markers: markers ?? {},
                            onTap: (latLng) {
                              setState(() {
                                _latLng = latLng;
                                // Clear existing markers and add a new one
                                markers = {
                                  Marker(
                                    markerId: MarkerId(latLng.toString()),
                                    position: latLng,
                                  ),
                                };
                              });
                            },
                            markers: markers,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlaceSaveModel {
  final String rink;
  final String address;
  final LatLng latLng;
  final String placeId;

  PlaceSaveModel(
      {required this.rink,
      required this.address,
      required this.latLng,
      required this.placeId});
}
