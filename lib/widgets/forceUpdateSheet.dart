import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hos_sports/service/controller/auth_controller.dart';
import 'package:hos_sports/service/model/forceUpdateModel.dart';
import 'package:hos_sports/widgets/constants.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

void showCircularBottomSheet(
  BuildContext context,
  String apkLinkAndroid,
  String apkLinkIos,
  String foreUpdate,
  String ignoreUpdate,
  String currentPlatform,
) {
  // List of platforms that can ignore the update
  // List platformsCanIgnore = ['android', 'ios', 'both', 'none'];

  // Determine if we need to show the "No Thanks" button
  bool showNoThanksButton = false;

  // Check if the platform can ignore the update
  if (ignoreUpdate.toLowerCase() == currentPlatform.toLowerCase() ||
      ignoreUpdate.toLowerCase() == 'both') {
    showNoThanksButton = true;
  }

  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent, // Makes the background transparent
    isDismissible: false, // Prevents tapping outside to dismiss the sheet
    enableDrag: false, // Disables dragging to close the sheet
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async => false, // Disables back button to close
        child: Container(
          height: 300,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.black,
            border: Border(
              top: BorderSide(color: Colors.red, width: 1), // Red border on top
              left: BorderSide(
                  color: Colors.red, width: 1), // Red border on the left
              right: BorderSide(
                  color: Colors.red, width: 1), // Red border on the right
              bottom: BorderSide.none, // No border at the bottom
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    "Important Update!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Row(
                  children: [
                    Image.asset(
                      ImageConst.logo,
                      height: 50,
                      width: 50,
                    ),
                    const SizedBox(width: 10),
                    Image.asset(
                      ImageConst.topBackImage,
                      height: 100,
                      width: 100,
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'HOSSPORTS recommends updating to the latest version. It’s mandatory to install new version of app from store in order to use the app.',
                    style: TextStyle(
                        color: Colors
                            .white), // Text color to contrast the black background
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Show "No Thanks" button based on the ignore update logic
                      if (showNoThanksButton)
                        OutlinedButton(
                          style: ButtonStyle(
                            side: MaterialStateProperty.all(
                              const BorderSide(color: AppColor.primary),
                            ),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                          ),
                          onPressed: () {
                            Navigator.pop(context); // Closes the bottom sheet
                          },
                          child: const Text(
                            "Dismiss",
                            style: TextStyle(color: AppColor.primary),
                          ),
                        ),
                      ElevatedButton(
                        onPressed: () async {
                          final url =
                              Platform.isAndroid ? apkLinkAndroid : apkLinkIos;

                          if (await canLaunchUrlString(url)) {
                            await launchUrlString(
                                url); // Opens the link in the browser or app
                            await Future.delayed(Duration(
                                seconds: 2)); // Give time for URL to open
                            exit(0); // Close the app
                          } else {
                            log('Could not launch $url');
                          }
                        },
                        child: const Text('Update !!'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}



// import 'package:flutter/material.dart';

// void showCircularBottomSheet(BuildContext context) {
//   showModalBottomSheet(
//     context: context,

//     backgroundColor: Colors.transparent, // Makes the background transparent
//     isDismissible: false, // Disables swipe-to-dismiss
//     builder: (BuildContext context) {
//       return Container(
//         decoration: BoxDecoration(
//           color: Colors.black.withOpacity(0.2),
//           borderRadius: BorderRadius.vertical(
//             top: Radius.circular(25.0), // Circular top corners
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black26,
//               blurRadius: 10.0,
//               spreadRadius: 2.0,
//             ),
//           ],
//         ),
//         child: Column(
//           children: [
//             // Scrollable content
//             Expanded(
//               child: Column(children: [
//                 Container(
//                   height: 200,
//                   width: 400,
//                   color: Colors.red,
//                 )
//               ]),
//             ),
//             Expanded(
//               child: Column(children: [
//                 Container(
//                   height: 200,
//                   width: 400,
//                   color: Colors.amber,
//                 )
//               ]),
//             ),
//             // Close Button
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.pop(context); // Close the bottom sheet
//                 },
//                 child: Text('Close'),
//                 style: ElevatedButton.styleFrom(),
//               ),
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }
