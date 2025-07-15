import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:hos_sports/screen/authentication/signup_screen.dart';
import 'package:hos_sports/service/controller/auth_controller.dart';
import 'package:hos_sports/service/controller/opt_count_down.dart';
import 'package:hos_sports/widgets/validator.dart';
import 'package:hos_sports/widgets/widgets.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;
  final String coutryCode;
  final String msgIdData;
  final String userType;

  const OtpScreen(
      {super.key,
      required this.phoneNumber,
      required this.userType,
      required this.coutryCode,
      required this.msgIdData});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _otpController = TextEditingController();

  final CountdownController timerController = Get.find<CountdownController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OTP Verification"),
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
              children: [
                const Spacer(),
                Column(
                  children: [
                    Text(
                      'Please enter the OTP sent to your phone number ${(widget.phoneNumber)}',
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                  ],
                ),
                // const Spacer(),
                // CustomTextFormField(
                //   controller: _otpController,
                //   validator: (value) {
                //     if (!validateOtp(value!)) {
                //       return "Enter 4 digit Otp";
                //     }
                //   },
                //   maxLength: 4,
                //   inputFormatters: [
                //     FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                //   ],
                //   keyboardType: TextInputType.number,
                //   labelText: "Enter Otp",
                // ),
                SizedBox(height: 40),
                PinCodeTextField(
                  appContext: context,
                  controller: _otpController,
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10),
                    fieldHeight: 70,
                    fieldWidth: 70,
                    activeFillColor: Colors.black,
                    selectedFillColor: Colors.black.withOpacity(0.5),
                    inactiveFillColor: Colors.black.withOpacity(0.5),
                    activeColor: Colors.black.withOpacity(0.5),
                    selectedColor: Colors.black.withOpacity(0.5),
                    inactiveColor: Colors.black.withOpacity(0.5),
                  ),
                  cursorColor: Colors.black,
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter the OTP";
                    }
                    if (value.length != 4) {
                      return "OTP must be 4 digits";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    // Optional: Handle changes here if needed
                  },
                ),
                SizedBox(height: 15),
                Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(() {
                      return Text(
                        'Please verify in ${timerController.formattedTime} mins',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      );
                    }),
                  ],
                )),
                SizedBox(height: 40),
                GetBuilder<AuthController>(
                  builder: (AuthController controller) {
                    return controller.signUpLoading
                        ? const Center(
                            child: CircularProgressIndicator.adaptive(),
                          )
                        : Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      String otp = _otpController.text;
                                      controller.changeSignUpLoading(true);
                                      Get.find<AuthController>()
                                          .verifyOtp(
                                              code: otp,
                                              megDataId: widget.msgIdData,
                                              context: context)
                                          .then((value) {
                                        controller.changeSignUpLoading(false);
                                        if (value) {
                                          timerController.resetTimer();
                                          Get.to(() => SignupScreen(
                                              phoneNumber: widget.phoneNumber,
                                              userType: widget.userType));
                                        }
                                      });

                                      controller.changeSignUpLoading(false);
                                    }
                                  },
                                  child: const Text("Verify OTP"),
                                ),
                              ),
                            ],
                          );
                  },
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     if (_formKey.currentState!.validate()) {
                //       String otp = _otpController.text;
                //       Get.find<AuthController>().verifyOtp(otp).then((value) {
                //         if (value) {
                //           Get.to(() => SignupScreen(
                //               phoneNumber: widget.phoneNumber,
                //               userType: widget.userType));
                //         }
                //       });
                //     }
                //   },
                //   child: const Text('Verify OTP'),
                // ),
                const Spacer(),
                const Center(
                  child: Text(
                    'Didn\'t receive OTP?',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Implement resend OTP logic here
                    Get.find<AuthController>().sendOtp(widget.coutryCode,
                        widget.phoneNumber, widget.userType, context);
                  },
                  child: const Text(
                    'Resend OTP',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(height: screenHeight(context) * .01),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
