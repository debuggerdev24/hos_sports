import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:hos_sports/screen/authentication/signup_screen.dart';
import 'package:hos_sports/screen/profile/goalie_update_data.dart';
import 'package:hos_sports/service/controller/auth_controller.dart';
import 'package:hos_sports/widgets/widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var areaCodeController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      initState: (_) {
        Future.microtask(() => _.controller!.getUsersDetailsApi()).then((v) {
          firstNameController.text =
              _.controller!.userModel!.firstname.toString();
          lastNameController.text =
              _.controller!.userModel!.lastname.toString();
          emailController.text = _.controller!.userModel!.email.toString();
          // areaCodeController.text =
          //     _.controller!.userModel!.areaCode.toString();
          String? areaCode = _.controller?.userModel?.areaCode;
          areaCodeController.text = areaCode != null && areaCode.length > 3
              ? '${areaCode.substring(0, 3).toUpperCase()} ${areaCode.substring(3).toUpperCase()}'
              : '';

          phoneController.text =
              '+' + _.controller!.userModel!.phoneNumber.toString();
        });
      },
      builder: (AuthController controller) {
        if (controller.userModel != null) {
          var data = controller.userModel;
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const SizedBox(height: 30),
                      controller.imageUploadLoading
                          ? const Center(
                              child: CircularProgressIndicator.adaptive(
                                  backgroundColor: Colors.red))
                          : Center(
                              child: SizedBox(
                                  width: 133,
                                  height: 133,
                                  child: Stack(
                                    alignment: Alignment.bottomRight,
                                    children: [
                                      Card(
                                          child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: CustomImage(
                                          url: data!.profilePic!,
                                          radius: 5,
                                        ),
                                      )),
                                      InkWell(
                                        onTap: () {
                                          controller.pickImageForSave(context);
                                        },
                                        child: const CircleAvatar(
                                            backgroundColor: Colors.black,
                                            child: Icon(
                                              Icons.edit,
                                              color: Colors.white,
                                            )),
                                      )
                                    ],
                                  )),
                            ),
                      const SizedBox(
                        height: 9,
                      ),
                      Center(
                        child: Text(
                          "${data?.firstname!} ${data!.lastname!.isNotEmpty ? data.lastname : ""}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Center(
                        child: RatingBarIndicator(
                          rating: double.parse(data.rating!),
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: 16.0,
                          direction: Axis.horizontal,
                        ),
                      ),
                      CustomTextFormField(
                        controller: firstNameController,
                        labelText: "First Name",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter First Name";
                          }
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-Z ]')),
                          TextInputFormatter.withFunction((oldValue, newValue) {
                            if (newValue.text.isEmpty) return newValue;
                            return newValue.copyWith(
                              text: newValue.text.replaceFirstMapped(
                                RegExp(r'^[a-zA-Z]'),
                                (match) => match.group(0)!.toUpperCase(),
                              ),
                            );
                          }),
                        ],
                      ),
                      CustomTextFormField(
                        controller: lastNameController,
                        labelText: "Last Name",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Last Name";
                          }
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r'[a-zA-Z ]')),
                          TextInputFormatter.withFunction((oldValue, newValue) {
                            if (newValue.text.isEmpty) return newValue;
                            return newValue.copyWith(
                              text: newValue.text.replaceFirstMapped(
                                RegExp(r'^[a-zA-Z]'),
                                (match) => match.group(0)!.toUpperCase(),
                              ),
                            );
                          }),
                        ],
                      ),
                      CustomTextFormField(
                        readOnly: true,
                        controller: emailController,
                        labelText: "Email Address",
                      ),
                      CustomTextFormField(
                        controller: areaCodeController,
                        labelText: "Postal Code",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Postal Code";
                          } else if (areaCodeController.text.length < 6) {
                            return "Postal Code must be 6 characters";
                          }
                          return null;
                        },
                        inputFormatters: [
                          UpperCaseTextFormatter(),
                          LengthLimitingTextInputFormatter(6),
                        ],
                      ),
                      CustomTextFormField(
                        controller: phoneController,
                        labelText: "Phone Number",
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          if (!value.startsWith("+1")) {
                            phoneController.text =
                                "+1"; // Reset to +19 if removed
                            phoneController.selection =
                                TextSelection.fromPosition(
                              TextPosition(
                                  offset: phoneController
                                      .text.length), // Keep cursor at end
                            );
                          }
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9+]')),
                          LengthLimitingTextInputFormatter(15),
                        ],
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter a valid phone number";
                          } else if (phoneController.text.length < 12) {
                            return "please enter a valid phone number with country code";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      if (data!.userType == '2')
                        Row(
                          children: [
                            const Spacer(),
                            TextButton(
                                onPressed: () {
                                  Get.to(() => GoalieUpdateProfileDetails(
                                        data: data,
                                      ));
                                },
                                child: const Text(
                                  "More Details",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                )),
                          ],
                        ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Future.microtask(() =>
                                  Get.find<AuthController>().updateProfileApi(
                                    context,
                                    firstName: firstNameController.text,
                                    lastName: lastNameController.text,
                                    phoneNumber: phoneController.text,
                                    areaCode: areaCodeController.text,
                                    email: emailController.text,
                                  ));
                            }
                          },
                          child: const Text("Update")),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else {
          return const Center(
              child: CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.red));
        }
      },
    );
  }
}
