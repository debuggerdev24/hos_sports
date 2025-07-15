import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hos_sports/screen/other/contact_us_screen.dart';
import 'package:hos_sports/screen/other/faq_screen.dart';
import 'package:hos_sports/screen/settings/base/general_feedback_screen.dart';
import 'package:hos_sports/screen/settings/base/goalie_signup_screen.dart';
import 'package:hos_sports/screen/settings/base/improvement_screen.dart';
import 'package:hos_sports/screen/settings/base/proximity_screen.dart';
import 'package:hos_sports/screen/settings/base/testimonial_screen.dart';
import 'package:hos_sports/screen/settings/notification/notification_type_screen.dart';
import 'package:hos_sports/service/controller/common_controller.dart';
import 'package:hos_sports/widgets/pdfView.dart';
import 'package:hos_sports/widgets/widgets.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../service/controller/auth_controller.dart';
import '../../widgets/constants.dart';
import 'base/schedule_availability_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String version = "";

  getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() => getVersion());
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      interactive: true,
      thumbVisibility: true,
      thickness: 5,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text("Setting"),
              const SizedBox(height: 10),
              SettingListTile(
                onTap: () {
                  Get.to(() => const NotificationTypeScreen());
                },
                icon: Icons.notifications_none_rounded,
                title: "Notification",
              ),
              if (Get.find<AuthController>().userType == "2")
                SettingListTile(
                  onTap: () {
                    Get.to(() => const ScheduleAvailabilityScreen());
                  },
                  icon: Icons.schedule_rounded,
                  title: "Scheduled Availability",
                ),
              if (Get.find<AuthController>().userType == "2")
                SettingListTile(
                  onTap: () {
                    Get.to(() => const ProximityScreen());
                  },
                  icon: Icons.featured_play_list_outlined,
                  title: "Playing Proximity",
                ),
              const SizedBox(height: 10),
              const Text("Submit Feedback"),
              const SizedBox(height: 10),
              SettingListTile(
                onTap: () {
                  Future.microtask(
                      () => Get.find<CommonController>().rateApp());
                },
                icon: Icons.star_border,
                title: "Rate in App Store",
              ),
              SettingListTile(
                onTap: () {
                  Get.to(() => const TestimonialScreen());
                },
                icon: Icons.comment_outlined,
                title: "Testimonials",
              ),
              SettingListTile(
                onTap: () {
                  Get.to(() => const GeneralFeedbackScreen());
                },
                icon: Icons.feedback_outlined,
                title: "General Feedbacks",
              ),
              SettingListTile(
                onTap: () {
                  Get.to(() => const ImprovementScreen());
                },
                icon: Icons.app_shortcut_outlined,
                title: "App Improvement",
              ),
              const SizedBox(height: 10),
              const Text("General"),
              const SizedBox(height: 10),
              SettingListTile(
                icon: Icons.question_answer_outlined,
                title: "FAQ",
                onTap: () {
                  Get.to(() => const FaqScreen());
                },
              ),
              SettingListTile(
                icon: Icons.call,
                title: "Contact Information",
                onTap: () {
                  Get.to(() => const ContactUsScreen());
                },
              ),
              const SizedBox(height: 10),
              const Text("Account"),
              const SizedBox(height: 10),
              // SettingListTile(
              //   icon: Icons.policy,
              //   onTap: () {
              //     launchURLS(
              //         "http://app.hockeyrentagoalie.com/web_services/upload/large/terms.pdf");
              //     // Get.to(() => const PdfReaderScreen(
              //     //       name: 'terms.pdf',
              //     //       path: "assets/pdf/terms.pdf",
              //     //     ));
              //   },
              //   title: "Terms and Condition",
              // ),
              //////...................................................

              SettingListTile(
                icon: Icons.policy,
                onTap: () {
                  Get.to(() => const PDFScreen(
                        url: 'assets/pdf/terms.pdf',
                      ));
                  // launchURLS(
                  //     "http://app.hockeyrentagoalie.com/web_services/upload/large/terms.pdf");
                  // // Get.to(() => const PdfReaderScreen(
                  // //       name: 'terms.pdf',
                  // //       path: "assets/pdf/terms.pdf",
                  // //     ));
                },
                title: "Terms and Condition",
              ),
              SettingListTile(
                icon: Icons.privacy_tip,
                onTap: () {
                  Get.to(() => const PDFScreen(
                        url: 'assets/pdf/privacy.pdf',
                      ));
                },
                title: "Privacy and Policy",
              ),

              // SettingListTile(
              //   icon: Icons.app_registration,
              //   onTap: () {
              //     Get.to(() => const GoalieSignupScreen());
              //   },
              //   title: "Goalie Signup details",
              // ),
              SettingListTile(
                icon: Icons.logout_outlined,
                onTap: () {
                  showDialog(
                      barrierColor: const Color.fromARGB(200, 0, 0, 0),
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: Colors.black,
                          shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(
                                Radius.circular(20)), // Rounded corners
                          ),
                          title: const Text("Do you really want to log out ?"),
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  Get.find<AuthController>().logout();
                                },
                                child: const Text("Logout")),
                            ElevatedButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text("Cancel")),
                          ],
                        );
                      });
                },
                title: "Sign Out",
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "App Version : $version",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingListTile extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Function()? onTap;

  const SettingListTile(
      {super.key, required this.title, this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Card(
        color: Colors.black,
        child: ListTile(
          dense: true,
          onTap: onTap,
          splashColor: AppColor.primary,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(color: Colors.white)),
          leading: Icon(
            icon,
            color: const Color(0xff6C6C6C),
          ),
          title: Text(title),
          trailing: const Icon(
            Icons.keyboard_arrow_right_rounded,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
