import 'dart:developer';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hos_sports/screen/authentication/otp_screen.dart';
import 'package:hos_sports/service/controller/auth_controller.dart';
import 'package:hos_sports/widgets/toast.dart';
import 'package:hos_sports/widgets/validator.dart';

import '../../service/controller/opt_count_down.dart';
import '../../widgets/widgets.dart';

class EnterMobileScreen extends StatefulWidget {
  const EnterMobileScreen({super.key});

  @override
  State<EnterMobileScreen> createState() => _EnterMobileScreenState();
}

class _EnterMobileScreenState extends State<EnterMobileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  String? countryCode;

  // Selected value for the radio buttons
  String _selectedValue = 'null';
  bool _isLoading = false; // Add this state variable

  final CountdownController timerController = Get.find<CountdownController>();

  @override
  void initState() {
    Future.microtask(() => Get.find<AuthController>().forceUpdate(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Phone Number"),
      ),
      body: Container(
        height: screenHeight(context),
        decoration: decoration(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CustomTextFormField(
                  keyboardType: TextInputType.phone,
                  controller: phoneController,
                  validator: (value) {
                    if (!validatePhoneNumber(value!)) {
                      return "InValid Phone Number";
                    }
                  },
                  labelText: "Phone Number",
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    LengthLimitingTextInputFormatter(10),
                  ],
                  prefix: CountryCodePicker(
                    onChanged: (value) {
                      countryCode =
                          value.dialCode.toString().replaceAll("+", "");
                    },
                    onInit: (code) {
                      countryCode =
                          code!.dialCode.toString().replaceAll("+", "");
                    },
                    // initialSelection: 'IT',
                    initialSelection: 'CA',
                    // favorite: const ['+39', 'FR'],
                    showCountryOnly: false,
                    showOnlyCountryWhenClosed: false,
                    alignLeft: false,
                    textStyle: Theme.of(context).textTheme.bodyMedium,
                    backgroundColor: Colors.black,
                    boxDecoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(25)),
                  ),
                ),

                const SizedBox(height: 25),
                const Text("Please select a role to sign up as:"),

                ListTile(
                  title: Text('Goalie'),
                  leading: Radio<String>(
                    value: '2',
                    activeColor: Colors.red,
                    groupValue: _selectedValue,
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = value!;
                      });
                    },
                  ),
                ),

                // Radio button for Customer
                ListTile(
                  title: Text('Customer'),
                  leading: Radio<String>(
                    value: '1',
                    activeColor: Colors.red,
                    groupValue: _selectedValue,
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = value!;
                      });
                    },
                  ),
                ),

                const SizedBox(height: 25),

                ElevatedButton(
                  onPressed: _isLoading
                      ? null // Disable button while loading
                      : () async {
                          if (phoneController.text.isEmpty) {
                            showToast(
                                "Please enter a phone number", false, context);
                            return;
                          }

                          if (phoneController.text.length < 10) {
                            showToast(
                                "Phone number must be at least 10 digits long",
                                false,
                                context);
                            return;
                          }
                          if (_selectedValue == "null") {
                            showToast("Please select a role of your choice.",
                                false, context);
                            return;
                          }

                          if (_formKey.currentState!.validate()) {
                            timerController.resetTimer();
                            timerController.startTimer();
                            setState(() {
                              _isLoading = true; // Show loading indicator
                            });

                            bool value = await Get.find<AuthController>()
                                .sendOtp("+$countryCode", phoneController.text,
                                    _selectedValue, context);


                                    log("value========>${value}");

                            setState(() {
                              _isLoading = false; // Hide loading indicator
                            });
                          }
                        },
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Text("Send Otp"),
                ),
                // ElevatedButton(
                //     onPressed: () {

                //     },
                //     child: const Text("Send Otp"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
