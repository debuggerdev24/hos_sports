import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hos_sports/screen/schedule_game/schedule_form.dart';
import 'package:hos_sports/service/controller/auth_controller.dart';
import 'package:hos_sports/widgets/custom_dropdown.dart';
import 'package:hos_sports/widgets/toast.dart';
import 'package:hos_sports/widgets/validator.dart';

import '../../widgets/widgets.dart';

class SignupScreen extends StatefulWidget {
  final String phoneNumber;
  final String userType;

  const SignupScreen(
      {super.key, required this.phoneNumber, required this.userType});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController firstController = TextEditingController();
  TextEditingController lastController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String gender = '';
  String ashl_register = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    phoneController.text = "${widget.phoneNumber}";
    log("User Type" + widget.userType.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: Container(
        height: screenHeight(context),
        decoration: decoration(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          labelText: "First Name",
                          controller: firstController,
                          prefix: const Icon(Icons.person),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter First Name";
                            }
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[a-zA-Z ]')),
                            TextInputFormatter.withFunction(
                                (oldValue, newValue) {
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
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: CustomTextFormField(
                          labelText: "Last Name",
                          controller: lastController,
                          prefix: const Icon(Icons.person),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Last Name";
                            }
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[a-zA-Z ]')),
                            TextInputFormatter.withFunction(
                                (oldValue, newValue) {
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
                      ),
                    ],
                  ),
                  CustomTextFormField(
                    labelText: "Phone Number",
                    readOnly: true,
                    controller: phoneController,
                    prefix: const Icon(Icons.call),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Phone Number";
                      } else if (value.length != 10) {
                        return "Phone number must be 10 digits nubmer";
                      }
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      LengthLimitingTextInputFormatter(10),
                    ],
                  ),
                  CustomTextFormField(
                    labelText: "Postal Code",
                    controller: areaController,
                    keyboardType: TextInputType.text,
                    prefix: const Icon(Icons.location_city),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter Postal Code";
                      } else if (value.length != 6) {
                        return "Postal Code must be 6 characters";
                      }
                      return null;
                    },
                    inputFormatters: [
                      UpperCaseTextFormatter(),   
                      LengthLimitingTextInputFormatter(6),   
                    ],
                  ),
                  SizedBox(height: 10),
                  CustomTextFormField(
                    labelText: "Email Address",
                    controller: emailController,
                    prefix: const Icon(Icons.email),
                    validator: (value) {
                      if (!validateEmail(value!)) {
                        return "Email Address";
                      }
                    },
                  ),
                  CustomTextFormField(
                    labelText: "Password",
                    controller: passController,
                    prefix: const Icon(Icons.password),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Password";
                      } else if (!validatePassword(value)) {
                        return "Minimum 8 words, special character, uppercase , lowercase and digits";
                      }
                    },
                  ),
                  CustomTextFormField(
                    labelText: "Confirm Password",
                    controller: confirmPassController,
                    prefix: const Icon(Icons.password),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Confirm Password";
                      } else if (!validatePassword(value)) {
                        return "Minimum 8 words, special character, uppercase , lowercase and digits";
                      }
                    },
                  ),
                  GetBuilder<AuthController>(
                    builder: (AuthController controller) {
                      return controller.signUpLoading
                          ? const Center(
                              child: CircularProgressIndicator.adaptive(),
                            )
                          : ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  // Remove spaces and convert to uppercase
                                  String processedAreaCode = areaController.text
                                      .replaceAll(' ', '')
                                      .toUpperCase();

                                  await controller.changeSignUpLoading(true);
                                  await controller.signUpApi(
                                    context,
                                    firstName: firstController.text,
                                    lastName: lastController.text,
                                    phoneNumber: phoneController.text
                                        .replaceAll("+", ""),
                                    areaCode: processedAreaCode,
                                    email: emailController.text,
                                    password: passController.text,
                                    confirmPassword: confirmPassController.text,
                                    userType: widget.userType,
                                  );
                                  await controller.changeSignUpLoading(false);
                                }
                              },
                              child: const Text("Register"),
                            );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
