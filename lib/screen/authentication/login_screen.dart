import 'dart:developer';

import 'package:app_settings/app_settings.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hos_sports/screen/authentication/enter_mobile_screen.dart';
import 'package:hos_sports/screen/authentication/forgot_password_screen.dart';
import 'package:hos_sports/service/api_const.dart';
import 'package:hos_sports/service/controller/auth_controller.dart';
import 'package:hos_sports/service/controller/location_controller.dart';
import 'package:hos_sports/widgets/constants.dart';
import 'package:hos_sports/widgets/toast.dart';
import 'package:hos_sports/widgets/widgets.dart';

import '../../widgets/validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool hidePass = true;
  bool saveCred = true;
  int userCred = 1;

  var emailController = TextEditingController();
  var passController = TextEditingController();
  // var emailController =
  //     TextEditingController(text: "hockeyrentagoalie@gmail.com");
  // var passController = TextEditingController(text: "Goalie24@@");
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // @override
  // void initState() {
  //   super.initState();
  //   Future.microtask(
  //     () => Get.find<AuthController>().getEmailPasswordFromLocal(),
  //   ).then((value) {
  //     Future.microtask(
  //       () => Get.find<LocationController>().determinePosition(context),
  //     );
  //     emailController.text = value[0];
  //     passController.text = value[1];
  //   });
  // }

  var locationController;

  bool isLocation = false;

  Future<void> checkAndRequestLocationPermission(BuildContext context) async {
    try {
      // Check and determine location
      await locationController.determinePosition(context);
      // If no errors are thrown, permissions and location services are enabled
      isLocation = false;
      setState(() {});
    } catch (e) {
      // Handle errors returned from determinePosition
      if (e == 'Location permissions are denied' ||
          e ==
              'Location permissions are permanently denied, we cannot request permissions.' ||
          e == 'Location services are disabled.') {
        isLocation = true;
        setState(() {});
      }
    }
  }

  bool tabloaded = false;

  var credentials;
  var authController;

  String customerEmail = "";
  String customerPassword = "";
  String goalieEmail = "";
  String goaliePassword = "";

  @override
  void initState() {
    super.initState();

    // Ensure authentication check

    // Fetch stored email and password securely
    Future.microtask(() async {
      try {
        authController = Get.find<AuthController>();

        credentials = await authController.getEmailPasswordFromLocal();

        userCred = authController.currentTabVal;
        log(userCred.toString() + "dfdfdfd");

        if (credentials != null && credentials!.isNotEmpty) {
          if (userCred == 1) {
            emailController.text = credentials![0] ?? "";
            passController.text = credentials![1] ?? "";
          }
          if (userCred == 2) {
            emailController.text = credentials![2] ?? "";
            passController.text = credentials![3] ?? "";
          }

          customerEmail = credentials![0];
          customerPassword = credentials![1];
          goalieEmail = credentials![2];
          goaliePassword = credentials![3];
          tabloaded = true;
          setState(() {});
          //
          log("Email: ${credentials![2] ?? ""}");
          log("Password: ${credentials![3] ?? ""}");
        } else {
          tabloaded = true;
          setState(() {});
          log("No stored credentials found.");
        }
      } catch (e) {
        tabloaded = true;
        setState(() {});
        log("Error fetching credentials: $e");
      }
    });

    Future.microtask(() => Get.find<AuthController>().forceUpdate(context));
  }

  @override
  void dispose() async {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    const horizontalPadding = 25.0;
    const verticalSpacing = 20.0;

    return Scaffold(
      body: Container(
        height: screenHeight,
        decoration: decoration(),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    // SizedBox(height: screenHeight * 0.05),
                    Image.asset(ImageConst.loginTop),
                    const SizedBox(height: verticalSpacing),
                    if (tabloaded = true) buildRadioOptions(),
                    const Center(
                      child: Text("Canada’s Premier Rental Goalie Service"),
                    ),
                    const SizedBox(height: verticalSpacing),
                    Image.asset(ImageConst.priceImage),
                    buildEmailTextField(),
                    buildPasswordTextField(),
                    buildForgotPasswordButton(),
                    buildSaveCredentialsCheckbox(),
                    buildLoginButton(),
                    const SizedBox(height: verticalSpacing),
                    buildSignUpOption(),
                    const SizedBox(height: verticalSpacing),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row buildRadioOptions() {
    return Row(
      children: [
        buildRadioOption(1, "Customer", customerEmail, customerPassword, true),

        buildRadioOption(2, "Goalie", goalieEmail, goaliePassword, true),

        // buildRadioOption(
        //     1, "Customer", "hockeyrentagoalie@gmail.com", "Goalie24@@"),
        // buildRadioOption(2, "Goalie", "hossports@gmail.com", "Goalie24@@"),
      ],
    );
  }

  Row buildRadioOption(
      int value, String label, String email, String password, bool isEnabled) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: userCred,
          fillColor:
              MaterialStateProperty.all(isEnabled ? Colors.white : Colors.grey),
          onChanged: isEnabled
              ? (val) async {
                  log(val.toString());
                  userCred = val as int;
                  emailController.text = await email;
                  passController.text = await password;
                  setState(() {});
                }
              : null, // Disable interaction when isEnabled is false
        ),
        Text(
          label,
          style: TextStyle(color: isEnabled ? Colors.white : Colors.grey),
        ),
      ],
    );
  }

  // Row buildRadioOption(int value, String label, String email, String password) {
  //   return Row(
  //     children: [
  //       Radio(
  //         value: value,
  //         groupValue: userCred,
  //         fillColor: MaterialStateProperty.all(Colors.white),
  //         onChanged: (val) {
  //           setState(() {
  //             userCred = val;

  //             emailController.text = email;
  //             passController.text = password;
  //           });
  //         },
  //       ),
  //       Text(label),
  //     ],
  //   );
  // }

  CustomTextFormField buildEmailTextField() {
    return CustomTextFormField(
      controller: emailController,
      prefix: const Icon(Icons.mail),
      labelText: "Email Address",
      validator: (value) {
        if (validateEmail(value!)) {
          return null;
        } else {
          return "Invalid Email Address";
        }
      },
    );
  }

  CustomTextFormField buildPasswordTextField() {
    return CustomTextFormField(
      labelText: "Password",
      obscureText: hidePass,
      prefix: const Icon(Icons.password),
      suffix: IconButton(
        onPressed: () {
          setState(() {
            hidePass = !hidePass;
          });
        },
        icon: Icon(
          Icons.remove_red_eye,
          color: hidePass ? Colors.white : Colors.white24,
        ),
      ),
      controller: passController,
    );
  }

  Align buildForgotPasswordButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Get.to(() => const ForgotPasswordScreen());
        },
        child: const Text(
          "Forgot Password?",
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
    );
  }

  Row buildSaveCredentialsCheckbox() {
    return Row(
      children: [
        Checkbox(
          value: saveCred,
          activeColor: AppColor.primary,
          side: const BorderSide(color: AppColor.primary, width: 2),
          onChanged: (value) {
            setState(() {
              saveCred = !saveCred;
            });
          },
        ),
        const Text("Save Credentials"),
      ],
    );
  }

  GetBuilder<AuthController> buildLoginButton() {
    return GetBuilder<AuthController>(
      builder: (AuthController controller) {
        return controller.loginLoading
            ? const Center(
                child: CircularProgressIndicator.adaptive(
                    backgroundColor: Colors.red))
            : ElevatedButton(
                onPressed: () async {
                  log("login");
                  if (_formKey.currentState!.validate()) {
                    controller.changeLoginLoading(true);
                    try {
                      // controller.changeLoginLoading(true);
                      controller.loginApi(
                        context,
                        email: emailController.text,
                        password: passController.text,
                        saveCred: saveCred,
                        lat: "000000",
                        lng: "000000",
                        timeZone: getTimeZoneApi(),
                        currentTab: userCred,
                      );
                    } catch (e) {
                      controller.changeLoginLoading(false);
                      log(e.toString());
                    }

                    //  {
                    //   controller.changeLoginLoading(false);
                    // });
                  }
                },
                child: const Text("Login"),
              );
      },
    );
  }

  Center buildSignUpOption() {
    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            const TextSpan(text: "Don't have an account?  "),
            TextSpan(
              text: 'Sign Up',
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w600),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Get.to(() => const EnterMobileScreen());
                },
            ),
          ],
        ),
      ),
    );
  }
}
