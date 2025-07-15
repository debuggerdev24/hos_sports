import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hos_sports/service/controller/common_controller.dart';
import 'package:hos_sports/widgets/widgets.dart';

class PromotionScreen extends StatefulWidget {
  const PromotionScreen({super.key});

  @override
  State<PromotionScreen> createState() => _PromotionScreenState();
}

class _PromotionScreenState extends State<PromotionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Promotion"),
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 10),
        decoration: decoration(),
        child: GetBuilder<CommonController>(
          initState: (_) {
            Future.microtask(() => _.controller!.promotionListApi());
          },
          builder: (CommonController controller) {
            return controller.promotionModel != null
                ? controller.promotionModel!.success == "1"
                    ? ListView.builder(
                        itemCount: controller.promotionModel!.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          var data = controller.promotionModel!.data![index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            child: Container(
                              decoration: dec,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    // CustomImage(url: data.promotionImage.toString()),
                                    SizedBox(height: 5),
                                    SizedBox(
                                        width: double.infinity,
                                        height: 200,
                                        child: CustomImageBig(
                                          url: data.promotionImage.toString(),
                                          radius: 5,
                                        )),
                                    SizedBox(height: 10),
                                    Text(
                                      data.promotionTitle.toString(),
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    Text(data.promotionDesc.toString())
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    // : const Text("No Promotion")
                    : centerHeadingText(context,
                        "Sorry, there are no active promotions at this time")
                // : const Center(
                //     child: Padding(
                //     padding: EdgeInsets.all(20.0),
                //     child: Text(
                //         "Sorry, there are no active promotions at this time"),
                //   ))
                : const Center(
                    child: CircularProgressIndicator.adaptive(
                        backgroundColor: Colors.red));
          },
        ),
      ),
    );
  }
}
