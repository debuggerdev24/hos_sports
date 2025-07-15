import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hos_sports/service/controller/auth_controller.dart';
import 'package:hos_sports/widgets/widgets.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Forgot Password"),
        ),
        body: GetBuilder<AuthController>(
          builder: (AuthController controller) {
            return Container(
              height: screenHeight(context),
              decoration: decoration(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Column(
                  children: <Widget>[
                    const Text(
                        "Don\'t worry, it happens to the best of us. Enter your email address below and we\'ll send you a link to reset your password."),
                    CustomTextFormField(
                      labelText: "Email Address",
                      controller: emailController,
                    ),
                    controller.forgotLoading
                        ? const Center(
                            child: CircularProgressIndicator.adaptive(
                                backgroundColor: Colors.red))
                        : ElevatedButton(
                            onPressed: () {
                              if (emailController.text.isNotEmpty) {
                                controller.changeForgotLoading(true);
                                Future.microtask(() =>
                                    Get.find<AuthController>()
                                        .sendForgotPasswordLinkApi(
                                            context: context,
                                            email: emailController.text));
                              }
                            },
                            child: const Text("Send"))
                  ],
                ),
              ),
            );
          },
        ));
  }
}
