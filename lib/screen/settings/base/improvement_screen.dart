import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hos_sports/service/controller/common_controller.dart';
import 'package:hos_sports/widgets/widgets.dart';

class ImprovementScreen extends StatefulWidget {
  const ImprovementScreen({super.key});

  @override
  State<ImprovementScreen> createState() => _ImprovementScreenState();
}

class _ImprovementScreenState extends State<ImprovementScreen> {
  var titleController = TextEditingController();
  String userType = "Customer";
  String relatedTo = "Enhancement";
  var commentsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Improvement Feedback"),
      ),
      body: Container(
        height: screenHeight(context),
        decoration: decoration(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                CustomDropdown(
                    onTap: (value) {
                      userType = value.toString();
                    },
                    items: ['Customer', 'Goalie']
                        .map(
                          (option) => DropdownMenuItem(
                            value: option,
                            child: Text(option),
                          ),
                        )
                        .toList(),
                    value: userType,
                    labelText: "User Type"),
                const SizedBox(
                  height: 10,
                ),
                CustomDropdown(
                    onTap: (value) {
                      relatedTo = value.toString();
                    },
                    items: ['Enhancement', 'Interface', 'Error']
                        .map(
                          (option) => DropdownMenuItem(
                            value: option,
                            child: Text(option),
                          ),
                        )
                        .toList(),
                    value: relatedTo,
                    labelText: "Related To"),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  labelText: "Title",
                  controller: titleController,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  labelText: "Comments",
                  controller: commentsController,
                  maxLines: 5,
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      Get.find<CommonController>().addFeedbackAppImprovementApi(
                          context,
                          userType: userType,
                          title: titleController.text,
                          comment: commentsController.text,
                          isRelatedTo: relatedTo);
                    },
                    child: const Text("Submit"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
