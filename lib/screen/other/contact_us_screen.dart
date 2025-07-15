import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hos_sports/service/controller/common_controller.dart';
import 'package:hos_sports/widgets/widgets.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Us"),
      ),
      body: Container(
        width: screenWidth(context),
        height: screenHeight(context),
        decoration: decoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 70,
            ),
            GetBuilder<CommonController>(
              initState: (_) {
                Future.microtask(() => _.controller!.getContactUsApi());
              },
              builder: (CommonController controller) {
                if (controller.contactUsModel != null) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Card(
                      color: Colors.black.withOpacity(.5),
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Contact Information",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                              "If you are having issues, we are here to help."),
                          const SizedBox(
                            height: 17,
                          ),
                          GestureDetector(
                            onTap: () {
                              makePhoneCall(controller.contactUsModel!.data!
                                  .where((element) =>
                                      element.contactType == "mobile")
                                  .map((e) => e.value)
                                  .join());
                            },
                            child: Column(
                              children: [
                                const Icon(
                                  Icons.call,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text((controller
                                    .contactUsModel!.data!
                                    .where((element) =>
                                        element.contactType == "mobile")
                                    .map((e) => e.value)
                                    .join()
                                    .toString())),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          GestureDetector(
                            onTap: () {
                              makeEmail(controller.contactUsModel!.data!
                                  .where((element) =>
                                      element.contactType == "email")
                                  .map((e) => e.value)
                                  .join()
                                  .toString());
                            },
                            child: Column(
                              children: [
                                const Icon(
                                  Icons.mail,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(controller.contactUsModel!.data!
                                    .where((element) =>
                                        element.contactType == "email")
                                    .map((e) => e.value)
                                    .join()),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          GestureDetector(
                            onTap: () {
                              launchURLS(controller.contactUsModel!.data!
                                  .where(
                                      (element) => element.contactType == "web")
                                  .map((e) => e.value)
                                  .join()
                                  .toString());
                            },
                            child: Column(
                              children: [
                                const Icon(
                                  Icons.web,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(controller.contactUsModel!.data!
                                    .where((element) =>
                                        element.contactType == "web")
                                    .map((e) => e.value)
                                    .join()),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return const Center(
                    child: CircularProgressIndicator.adaptive(
                        backgroundColor: Colors.red));
              },
            ),
          ],
        ),
      ),
    );
  }
}
