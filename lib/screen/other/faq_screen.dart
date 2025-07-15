import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hos_sports/service/controller/common_controller.dart';
import 'package:hos_sports/widgets/widgets.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FAQ"),
      ),
      body: Container(
        width: screenWidth(context),
        height: screenHeight(context),
        decoration: decoration(),
        child: GetBuilder<CommonController>(
          initState: (_) {
            Future.microtask(() => _.controller!.faqListApi());
          },
          builder: (CommonController controller) {
            if (controller.faq != null) {
              return ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: controller.faq!.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  var data = controller.faq!.data![index];
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ExpansionTile(
                              title: Text(
                                "${data.question}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                              children: [
                                Text(
                                  "${data.answer}",
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return const Center(
                child: CircularProgressIndicator.adaptive(
                    backgroundColor: Colors.red));
            // return ListView.builder(
            //   shrinkWrap: true,
            //   physics: const ClampingScrollPhysics(),
            //   itemCount: 10,
            //   itemBuilder: (BuildContext context, int index) {
            //     return Skeletonizer(
            //       containersColor: Colors.white.withOpacity(.2),
            //       textBoneBorderRadius:
            //           TextBoneBorderRadius(BorderRadius.circular(0)),
            //       child: Padding(
            //         padding: const EdgeInsets.symmetric(horizontal: 20),
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: <Widget>[
            //             const Bone.text(
            //               fontSize: 18,
            //             ),
            //             const SizedBox(
            //               height: 5,
            //             ),
            //             const Bone.multiText(
            //               lines: 3,
            //             ),
            //             Divider(
            //               height: 30,
            //               color: Colors.white.withOpacity(.2),
            //             )
            //           ],
            //         ),
            //       ),
            //     );
            //   },
            // );
          },
        ),
      ),
    );
  }
}
