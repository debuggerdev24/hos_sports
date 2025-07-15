import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hos_sports/service/controller/common_controller.dart';
import 'package:hos_sports/widgets/widgets.dart';

class GeneralFeedbackScreen extends StatefulWidget {
  const GeneralFeedbackScreen({super.key});

  @override
  State<GeneralFeedbackScreen> createState() => _GeneralFeedbackScreenState();
}

class _GeneralFeedbackScreenState extends State<GeneralFeedbackScreen> {
  var titleController = TextEditingController();
  String userType = "Customer";
  String isSendReply = "Yes";
  var commentsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("General Feedback"),
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
                CustomDropdown(
                    onTap: (value) {
                      isSendReply = value.toString().toLowerCase();
                      setState(() {});
                    },
                    items: ['Yes', 'No']
                        .map(
                          (option) => DropdownMenuItem(
                            value: option,
                            child: Text(option),
                          ),
                        )
                        .toList(),
                    value: isSendReply,
                    labelText: "Can we share this?"),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      Get.find<CommonController>().addFeedbackGeneralApi(
                          context,
                          userType: userType,
                          title: titleController.text,
                          comment: commentsController.text,
                          isSendReply: isSendReply);
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
