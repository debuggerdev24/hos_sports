import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hos_sports/service/controller/common_controller.dart';
import 'package:hos_sports/widgets/widgets.dart';

class TestimonialScreen extends StatefulWidget {
  const TestimonialScreen({super.key});

  @override
  State<TestimonialScreen> createState() => _TestimonialScreenState();
}

class _TestimonialScreenState extends State<TestimonialScreen> {
  var titleController = TextEditingController();
  String userType = "Customer";
  String rating = "1";
  String isShare = "Yes";
  var commentsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Testimonial"),
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
                      rating = value ?? "5";
                    },
                    items: ['1', '2', '3', '4', '5']
                        .map(
                          (option) => DropdownMenuItem(
                            value: option,
                            child: Text(option),
                          ),
                        )
                        .toList(),
                    value: rating,
                    labelText: "Rating"),
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
                      isShare = value.toString().toLowerCase();
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
                    value: isShare,
                    labelText: "Can we share this?"),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      Get.find<CommonController>().addFeedbackTestimonialsApi(
                          context,
                          userType: userType,
                          rating: rating,
                          title: titleController.text,
                          comment: commentsController.text,
                          isShare: isShare);
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
