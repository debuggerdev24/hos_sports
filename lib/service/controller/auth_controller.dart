import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hos_sports/screen/authentication/login_screen.dart';
import 'package:hos_sports/screen/authentication/otp_screen.dart';
import 'package:hos_sports/screen/dashboard_screen/dashboard_screen.dart';
import 'package:hos_sports/screen/goalie_screen/goalie_dashboard/goalie_dashboard_screen.dart';
import 'package:hos_sports/screen/settings/base/goalie_signup_screen.dart';
import 'package:hos_sports/service/api_const.dart';
import 'package:hos_sports/service/controller/location_controller.dart';
import 'package:hos_sports/service/model/CommonModel.dart';
import 'package:hos_sports/service/model/LoginModel.dart';
import 'package:hos_sports/service/model/SignUpModel.dart';
import 'package:hos_sports/service/model/UserModel.dart';
import 'package:hos_sports/service/model/forceUpdateModel.dart';
import 'package:hos_sports/widgets/constants.dart';
import 'package:hos_sports/widgets/forceUpdateSheet.dart';
import 'package:hos_sports/widgets/toast.dart';
import 'package:http/http.dart' as http;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/widgets.dart';

class AuthController extends GetxController {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  String? userId;
  String? userType;
  int? currentTabVal;

  //Loading
  bool loginLoading = false;
  bool signUpLoading = false;
  bool forgotLoading = false;
  bool imageUploadLoading = false;

  saveLocal({
    required String userId,
    required String userType,
    String? email,
    String? password,
    int? currentTab,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_id', userId);
    await prefs.setString('user_type', userType);
    await prefs.setInt('currentTab', currentTab ?? 1);

    if (currentTab == 1) {
      if (email != null) {
        await prefs.setString('email_customer', email);
      }
      if (password != null) {
        await prefs.setString('password_customer', password);
      }
    }
    if (currentTab == 2) {
      if (email != null) {
        await prefs.setString('email_goalie', email);
      }
      if (password != null) {
        await prefs.setString('password_goalie', password);
      }
    }
  }

  clearLocal() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = null;
    userType = null;
    await prefs.clear();
  }

  Future<List<String>> userLogged() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString("user_id") ?? "";
    userType = prefs.getString("user_type") ?? "";

    return [userId!, userType!];
  }

  Future<List<String>> getEmailPasswordFromLocal() async {
    List<String> cred = [];

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? emailCustomer = prefs.getString("email_customer") ?? "";
    String? passwordCustomer = prefs.getString("password_customer") ?? "";
    String? emailGoalie = prefs.getString("email_goalie") ?? "";
    String? passwordGoalie = prefs.getString("password_goalie") ?? "";

    //
    int? currentTab = prefs.getInt("currentTab") ?? 1;
    currentTabVal = currentTab;
    log('currentTab  $currentTabVal');
    //
    cred.add(emailCustomer);
    cred.add(passwordCustomer);
    cred.add(emailGoalie);
    cred.add(passwordGoalie);
    return cred;
  }

  logout() async {
    List<String> res = await getEmailPasswordFromLocal();
    if (res.isNotEmpty) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_id', "");
      await prefs.setString('user_type', "");
    } else {
      clearLocal();
    }
    Get.offAll(() => const LoginScreen());
  }

  Future<String?> deviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      print('Running on ${androidInfo.model}'); // e.g. "Moto G (4)"
      return androidInfo.model;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      print('Running on ${iosInfo.utsname.machine}');
      return iosInfo.utsname.machine;
    }
    return null;
  }

  getUserIdFromLocal() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? action = prefs.getString('user_id');
    return action;
  }

  Future<void> forceUpdate(BuildContext context) async {
    String urlForForce = "$baseUrl?op=${ApiConst.foreceUpdate}";
    String version = "";

    // Get current app version
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;
    log("Current version: $version");

    try {
      // Fetch update information from the API
      var response = await http.get(Uri.parse(urlForForce));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data["success"].toLowerCase() == "true") {
          final updateData = data["data"];
          bool shouldShowUpdate = false;
          String platform = "";

          // Compare Android version
          if (Platform.isAndroid &&
              isVersionSmaller(version, updateData["apk_version_android"])) {
            shouldShowUpdate = true;
            platform = 'Android';
          }

          // Compare iOS version
          if (Platform.isIOS &&
              isVersionSmaller(version, updateData["apk_version_ios"])) {
            shouldShowUpdate = true;
            platform = 'iOS';
            
          }

          if (shouldShowUpdate) {
            showCircularBottomSheet(
              context,
              updateData["apk_link_android"], // Android link
              updateData["apk_link_ios"], // iOS link
              updateData["force_update"],
              updateData["ignore_update"],
              platform,
            );
            log("Update dialog shown for $platform.");
          } else {
            log("No update required.");
          }
        } else {
          log("API response indicated failure. Message: ${data["message"]}");
        }
      } else {
        log('Failed to check for updates. Status code: ${response.statusCode}');
      }
    } catch (e) {
      log('Error occurred while checking for updates: $e');
    }
  }

  /// Utility to compare version strings
  bool isVersionSmaller(String currentVersion, String apiVersion) {
    List<int> current = currentVersion.split('.').map(int.parse).toList();
    List<int> api = apiVersion.split('.').map(int.parse).toList();

    for (int i = 0; i < current.length; i++) {
      if (i >= api.length) break;
      if (current[i] < api[i]) return true; // Current is smaller
      if (current[i] > api[i]) return false; // Current is greater
    }

    return current.length < api.length; // Handle cases like "1.0" < "1.0.1"
  }

  // Future<UpdateApiResponse?> forceUpdate(BuildContext context) async {
  //   String urlForForce = "$baseUrl?op=${ApiConst.foreceUpdate}";
  //   String version = "";
  //   PackageInfo packageInfo = await PackageInfo.fromPlatform();
  //   version = packageInfo.version;
  //   log("Current version: $version");
  //   try {
  //     var response = await http.get(Uri.parse(urlForForce));

  //     if (response.statusCode == 200) {
  //       final data = jsonDecode(response.body);

  //       // Parse the response into the model
  //       UpdateApiResponse updateApiResponse = UpdateApiResponse.fromJson(data);

  //       // Check if the success field is "true"
  //       if (updateApiResponse.success.toLowerCase() == "true") {
  //         if (updateApiResponse.data.apkVersionAndroid != version &&
  //             Platform.isAndroid) {
  //           showCircularBottomSheet(
  //               context,
  //               updateApiResponse.data.apkLinkAndroid, // Pass Android link
  //               updateApiResponse.data.apkLinkIos, // Pass iOS link,
  //               updateApiResponse.data.forceUpdate,
  //               updateApiResponse.data.ignoreUpdate,
  //               'Android');
  //           log("Update dialog shown with android URL: ${updateApiResponse.data.apkLinkAndroid}");
  //         }
  //         if (updateApiResponse.data.apkVersionIos != version &&
  //             Platform.isIOS) {
  //           showCircularBottomSheet(
  //               context,
  //               updateApiResponse.data.apkLinkAndroid, // Pass Android link
  //               updateApiResponse.data.apkLinkIos, // Pass iOS link,
  //               updateApiResponse.data.forceUpdate,
  //               updateApiResponse.data.ignoreUpdate,
  //               'iOS');
  //           log("Update dialog shown with ios URL: ${updateApiResponse.data.apkLinkIos}");
  //         }

  //         return updateApiResponse; // Return the API response
  //       } else {
  //         log("API response indicated failure. Message: ${updateApiResponse.message}");
  //         return null; // Return null in case of failure
  //       }
  //     } else {
  //       log('Failed to check for updates. Status code: ${response.statusCode}');
  //       return null;
  //     }
  //   } catch (e) {
  //     log('Error occurred while checking for updates: $e');
  //     return null; // Return null in case of an error
  //   }
  // }

  getEmailFromLocal() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? action = prefs.getString('email');
    return action;
  }

  getPasswordFromLocal() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? action = prefs.getString('password');
    return action;
  }

  String? requestId;

  //todo
  Future<bool> sendOtp(
      String countryCode, String phoneNumber, String userType, context) async {
    requestId = null;
    String sendOtpUrl = "$baseUrl?op=${ApiConst.sendOtp}";

    try {
      // Prepare form data fields
      var request = http.MultipartRequest('POST', Uri.parse(sendOtpUrl))
        ..fields['c_code'] = countryCode
        ..fields['number'] = phoneNumber;

      log("Sending form data: ${request.fields}");

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        log("Response: $responseBody");


        
        var res = json.decode(responseBody);
         log("Response: ${res}");

        if (res["success"] == "1") {
          // Get.snackbar(
          //   "Success",
          //   "OTP has been sent to $phoneNumber",
          //   snackPosition: SnackPosition.TOP,
          // );

          showCustomNotification(context,
              'OTP has been sent to ${formatPhoneNumber(phoneNumber)}');
          Get.to(() => OtpScreen(
                coutryCode: countryCode,
                phoneNumber: phoneNumber,
                userType: userType,
                msgIdData: '${res["data"]}',
              ));
          update();
          return true;
        } else {
          // Handle API error response messages
          String userMessage = res["message"] ?? "Please try again later.";
          showCustomNotification(context, userMessage);
          // Get.snackbar(
          //   "",
          //   userMessage,
          //   colorText: Colors.white,
          //   snackPosition: SnackPosition.TOP,
          // );
          return false;
        }
      } else {
        Get.snackbar("Error", "OTP request failed. Please try again later.");
        return false;
      }
    } catch (e) {
      log("Error sending OTP: $e");
      Get.snackbar("Error", "Something went wrong. Please try again.");
      return false;
    }
  }

  //todo implement
  Future<bool> verifyOtp({
    required String code,
    required String megDataId,
    required BuildContext context,
  }) async {
    String verifyOtpUrl = "$baseUrl?op=${ApiConst.verifyOtp}";

    try {
      // Prepare form data fields
      var request = http.MultipartRequest('POST', Uri.parse(verifyOtpUrl))
        ..fields['message_id'] = megDataId
        ..fields['code'] = code;

      log("Sending form data: ${request.fields}");

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        log("Response: $responseBody");
        var res = json.decode(responseBody);

        if (res["success"] == "1") {
          // Get.snackbar(
          //   "Success",
          //   "Verfied successfully",
          //   snackPosition: SnackPosition.TOP,
          // );
          showCustomNotification(context, "Verfied successfully");
          // Get.to(() => OtpScreen(
          //       coutryCode: countryCode,
          //       phoneNumber: phoneNumber,
          //       userType: userType,
          //       msgIdData: '${res["data"]}',
          //     ));
          update();
          return true;
        } else {
          // Handle API error response messages
          String userMessage = res["message"] ?? "Please try again later.";
          // Get.snackbar(
          //   "Error",
          //   userMessage,
          //   snackPosition: SnackPosition.TOP,
          // );
          showCustomNotification(context, userMessage);
          return false;
        }
      } else {
        Get.snackbar("Error", "OTP request failed. Please try again later.");
        return false;
      }
    } catch (e) {
      log("Error sending OTP: $e");
      Get.snackbar("Error", "Something went wrong. Please try again.");
      return false;
    }
  }

  // Future<bool> sendOtp(phoneNumber) async {
  //   requestId = null;
  //   var request = http.Request(
  //       'GET',
  //       Uri.parse(
  //           'https://api.nexmo.com/verify/json?api_key=${SmsConst.apiKey}&api_secret=${SmsConst.apiSecret}&number=$phoneNumber&brand=${SmsConst.brand}'));

  //   http.StreamedResponse response = await request.send();

  //   if (response.statusCode == 200) {
  //     var str = await response.stream.bytesToString();
  //     log(str.toString());
  //     var res = json.decode(str);
  //     if (res["status"] == "0") {
  //       requestId = res["request_id"];
  //       Get.snackbar(
  //           "OTP sent successfully", "Otp will be received in $phoneNumber");
  //       update();
  //       return true;
  //     } else if (res["status"] == "10") {
  //       Get.snackbar("Error", "You can login once again after 5 minutes");
  //       return false;
  //     } else {
  //       Get.snackbar("OTP send Failed", "Try again after sometime");
  //       return false;
  //     }
  //   } else {
  //     Get.snackbar("OTP send Failed", "Try again after sometime");
  //     return false;
  //   }
  // }

  // //todo implement
  // Future<bool> verifyOtp(code) async {
  //   var request = http.Request(
  //       'GET',
  //       Uri.parse(
  //           'https://api.nexmo.com/verify/check/json?api_key=${SmsConst.apiKey}&api_secret=${SmsConst.apiSecret}&request_id=$requestId&code=$code'));

  //   http.StreamedResponse response = await request.send();

  //   //   {error_text
  //   //     "request_id": "f9a45d2605dd440eba8b341caafc531b",
  //   //   "status": "0",
  //   //   "event_id": "61670191-87bc-4b9c-a62c-3bafeec533ad",
  //   //   "price": "0.05000000",
  //   //   "currency": "EUR",
  //   //   "estimated_price_messages_sent": "0.0675"
  //   // }

  //   if (response.statusCode == 200) {
  //     var str = await response.stream.bytesToString();
  //     var res = json.decode(str);
  //     log("verify " + str.toString());
  //     if (res["status"] == "0") {
  //       return true;
  //     } else if (res["status"] == "3") {
  //       Get.snackbar("Error", "You will get another after 5 mins.");
  //       return false;
  //     } else {
  //       Get.snackbar("Error", res["error_text"]);
  //       return false;
  //     }
  //   } else {
  //     print(response.reasonPhrase);
  //     return false;
  //   }
  // }

  loginApi(context,
      {required String email,
      required String password,
      required bool saveCred,
      required int currentTab,
      required String lat,
      required String lng,
      required String timeZone}) async {
    changeLoginLoading(true);
    ApiHelper apiHelper = ApiHelper(op: ApiConst.login);
    // String? token = await messaging.getToken();

    String token =
        await messaging.getToken() ?? "Failed to retrieve FCM token.";


    String device = Platform.isAndroid ? "1" : "2";
    
    Map<String, String> fields = {
      "email": email,
      "password": password,
      "device_token": "$token",
      "user_latitude": lat,
      "user_longitude": lng,
      "device_type": device,
      "user_time_zone": timeZone,
    };
    print(fields);
    var res = await apiHelper.post(fields);
    log(fields.toString());
    LoginModel loginModel = LoginModel.fromJson(res);
    if (loginModel.success == "1") {
      if (loginModel.data!.isApprove.toString() == '1') {
        if (saveCred) {
          saveLocal(
              userId: loginModel.data!.userId!,
              email: email,
              password: password,
              userType: loginModel.data!.userType!,
              currentTab: currentTab);
        } else {
          clearLocal();
          saveLocal(
              userId: loginModel.data!.userId!,
              userType: loginModel.data!.userType!);
        }
        getUsersDetailsApi(otherId: loginModel.data!.userId.toString());
        // user
        if (loginModel.data!.userType.toString() == '1') {
          changeLoginLoading(false);
          Get.offAll(() => const DashboardScreen());
        } else {
          changeLoginLoading(false);
          Get.offAll(() => const GoalieDashboardScreen());
        }
        userId = loginModel.data!.userId!;
        userType = loginModel.data!.userType!;
        changeLoginLoading(false);
      } else {
        showSnackBar(context, 'Your account is pending approval');
        changeLoginLoading(false);
      }
    } else {
      showSnackBar(context, loginModel.message);
      changeLoginLoading(false);
    }
  }

  changeLoginLoading(bool status) {
    loginLoading = status;
    update();
  }

  changeSignUpLoading(bool status) {
    signUpLoading = status;
    update();
  }

  signUpApi(context,
      {required String firstName,
      required String lastName,
      required String phoneNumber,
      required String areaCode,
      required String email,
      required String password,
      required String confirmPassword,
      required String userType}) async {
    // changeSignUpLoading(true);
    update();
    String lat = Get.find<LocationController>().latitude.toString();
    String lng = Get.find<LocationController>().longitude.toString();
    String timeZone = getTimeZoneApi();
    ApiHelper apiHelper = ApiHelper(op: ApiConst.signup);
    // String? token = await messaging.getToken();

    String token =
        await messaging.getToken() ?? "Failed to retrieve FCM token.";

    String? device = await deviceInfo();
    String deviceType = Platform.isAndroid ? "1" : "2";
    Map<String, String> customerFields = {
      'firstname': firstName,
      'lastname': lastName,
      'phone_number': phoneNumber,
      'area_code': areaCode,
      'email': email,
      'password': password,
      'confirm_password': confirmPassword,
      'device_type': deviceType,
      'user_latitude': lat,
      'user_longitude': lng,
      'device_token': '$token',
      'user_time_zone': timeZone,
      'device_version': device!,
      'user_type': '1'
    };
    Map<String, String> goalieFields = {
      'firstname': firstName,
      'lastname': lastName,
      'phone_number': phoneNumber,
      'area_code': areaCode,
      'email': email,
      'password': password,
      'confirm_password': confirmPassword,
      'device_type': deviceType,
      'user_latitude': lat,
      'user_longitude': lng,
      'device_token': '$token',
      'user_time_zone': timeZone,
      'device_version': device!,
      // "calibre": calibre,
      // "avaliable_to_play": avaliable_to_play,
      // "level_of_game": "AA",
      // "rent_a_goalie_experience": "1",
      // "ashl_register": "1",
      'user_type': '2'
    };
    log("customerFields========>${customerFields.toString()}");
        log("goalieFields========>${goalieFields.toString()}");

    log(userType == "1" ? customerFields.toString() : goalieFields.toString());

    var res =
        await apiHelper.post(userType == "1" ? customerFields : goalieFields);
    SignUpModel signUpModel = SignUpModel.fromJson(res);
    if (signUpModel.success == "1") {
      // Get.offAll(() => const LoginScreen());
      if (userType == "1") {
        Get.offAll(() => const LoginScreen());
        changeSignUpLoading(false);
        update();
        showSnackBar(context, signUpModel.message);
      } else {
        Get.offAll(() => GoalieSignupScreen(
              userId: signUpModel.data.userId.toString(),
            ));
        changeSignUpLoading(false);
        update();
        showSnackBar(context, signUpModel.message);
      }
    } else {
      changeSignUpLoading(false);
      update();
      showSnackBar(context, signUpModel.message);
    }
  }

  goalieSignUpApi(context,
      {required String gender,
      required String calibre,
      required String userId,
      required String birthday,
      required String goalieExperience,
      required String avaliableToPlay,
      required String levelOfGame,
      required String ashlRegister,
      required String kmToPlay}) async {
    ApiHelper apiHelper = ApiHelper(op: ApiConst.goalieSignup);
    Map<String, String> fields = {
      // "user_id": "4",
      "user_id": "$userId",
      "gender": gender,
      "calibre": calibre,
      "birthday": birthday,
      "avaliable_to_play": avaliableToPlay,
      "kilometers_to_travel": kmToPlay,
      "profile_pic": "",
      "level_of_game": levelOfGame,
      "rent_a_goalie_experience": goalieExperience,
      "ashl_register": ashlRegister,
      "user_type": "2"
    };
    var res = await apiHelper.post(fields);
    CommonModel commonModel = CommonModel.fromJson(res);

    if (commonModel.success == "1") {
      changeSignUpLoading(false);
      update();
      Get.offAll(() => const LoginScreen());
      showSnackBar(context, commonModel.message!);
    } else {
      changeSignUpLoading(false);
      update();
      showSnackBar(context, commonModel.message!);
    }
  }

  // updateLocationApi() async {
  //   Future.microtask(() => Get.find<LocationController>().setPosition())
  //       .then((value) async {
  //     String lat = Get.find<LocationController>().latitude.toString();
  //     String lng = Get.find<LocationController>().longitude.toString();
  //     if (lat.isNotEmpty && lng.isNotEmpty) {
  //       ApiHelper apiHelper = ApiHelper(op: ApiConst.updateDeviceToken);
  //       Map<String, String> fields = {
  //         "user_id": "$userId",
  //         "latitude": lat,
  //         "longitude": lng,
  //       };
  //       print(",<<<<<<<<<<<<<<<<<,");
  //       print(fields);
  //       var res = await apiHelper.post(fields);
  //       print("????????????/");
  //       print(res);
  //       CommonModel commonModel = CommonModel.fromJson(res);
  //       if (commonModel.success == "1") {
  //         // showToast(commonModel.message!, true);
  //       } else {
  //         // showToast(commonModel.message!, false);
  //       }
  //     }
  //   });
  // }

  updateDeviceTokenApi() async {
    ApiHelper apiHelper = ApiHelper(op: ApiConst.updateDeviceToken);
    // String? token = await messaging.getToken();
    String token =
        await messaging.getToken() ?? "Failed to retrieve FCM token.";
    log("Device token: " + token);

    String version = "";

    // Get current app version
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;
    log("Current version: $version");

    String lat = Get.find<LocationController>().latitude.toString();
    String lng = Get.find<LocationController>().longitude.toString();
    String deviceType = Platform.isAndroid ? "1" : "2";
    String timeZone = getTimeZoneApi();
    String? device = await deviceInfo();
    Map<String, String> fields = {
      "user_id": "$userId",
      "device_token": "$token",
      "user_time_zone": timeZone,
      "device_version": device!,
      "device_type": deviceType,
      "latitude": lat,
      "longitude": lng,
      "app_version": version,
      "log": "",
    };
    log("devicetoken========>${token}");

    var res = await apiHelper.post(fields);
    CommonModel commonModel = CommonModel.fromJson(res);

    if (commonModel.success == "1") {
      // showToast(commonModel.message!, true);
    } else {
      // showToast(commonModel.message!, false);
    }
  }

  changeForgotLoading(bool status) {
    forgotLoading = status;
    update();
  }

  sendForgotPasswordLinkApi({context, required String email}) async {
    changeForgotLoading(true);
    ApiHelper apiHelper = ApiHelper(op: ApiConst.sendForgotPasswordLink);
    Map<String, String> fields = {
      "email": email,
    };
    log("forgotpasowrdfield=======>${fields}");
    var res = await apiHelper.post(fields);

    CommonModel commonModel = CommonModel.fromJson(res);
    if (commonModel.success == "1") {
      changeForgotLoading(false);
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.black,
              shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              title: Text(commonModel.message.toString()),
            );
          });
    } else {
      changeForgotLoading(false);
      showSnackBar(context, commonModel.message);
    }
  }

  UserModel? userModel;

  getUsersDetailsApi({String? otherId}) async {
    String userID = otherId ?? userId!;
    userModel = null;
    ApiHelper apiHelper = ApiHelper(op: ApiConst.getUsersDetails);
    Map<String, String> fields = {
      "user_id": userID,
    };
    var res = await apiHelper.post(fields);
    if (res['success'].toString() == '1') {
      UserModel model = UserModel.fromJson(res["data"]);
      userModel = model;
      update();
    }
  }

  pickImageForSave(context) async {
    final ImagePicker picker = ImagePicker();
    final XFile? selectImage =
        await picker.pickImage(source: ImageSource.gallery);

    if (selectImage != null) {
      CroppedFile? image = await ImageCropper().cropImage(
        sourcePath: selectImage.path,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.black,
            toolbarWidgetColor: Colors.white,
            hideBottomControls: true,
            aspectRatioPresets: [
              CropAspectRatioPreset.square,
            ],
          ),
          IOSUiSettings(
            title: 'Cropper',
            hidesNavigationBar: true,
            aspectRatioLockEnabled: true,
            aspectRatioPresets: [
              CropAspectRatioPreset.square,
              // IMPORTANT: iOS supports only one custom aspect ratio in preset list
            ],
          ),
        ],
      );

      if (image != null) {
        Get.dialog(AlertDialog(
          backgroundColor: Colors.black,
          shape: const RoundedRectangleBorder(
              side: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          title: const Text("Are you sure want to update ?"),
          content: Image.file(File(image.path)),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Get.back();
                  updateProfilePicApi(context, image);
                },
                child: const Text("Yes")),
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("No"))
          ],
        ));
      }
    }
  }

  changeImageUploadLoading(bool status) {
    imageUploadLoading = status;
    update();
  }

  updateProfilePicApi(context, CroppedFile image) async {
    changeImageUploadLoading(true);
    ApiHelper apiHelper = ApiHelper(op: ApiConst.updateProfile);
    Map<String, String> fields = {
      "user_id": userId!,
    };

    var res = await apiHelper.postFormData(fields, image);

    changeImageUploadLoading(false);

    CommonModel model = CommonModel.fromJson(res);

    if (model.success == "1") {
      log("Successfully uploaded");
      changeImageUploadLoading(false);
      return showDialog(
          barrierDismissible: true,
          context: context,
          builder: (context) {
            Future.delayed(const Duration(seconds: 3), () {
              Navigator.of(context).pop();
            });
            return AlertDialog(
              backgroundColor: Colors.black,
              shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              title: Text(
                "${model.message}",
                style: const TextStyle(fontSize: 14),
              ),
            );
          });
    } else {
      changeImageUploadLoading(false);
      showSnackBar(context, model.message);
    }
  }

  updateProfileApi(
    context, {
    required String firstName,
    required String lastName,
    required String areaCode,
    required String email,
    required String phoneNumber,

    //
  }) async {
    ApiHelper apiHelper = ApiHelper(op: ApiConst.updateProfile);
    Map<String, String> fields = {
      "user_id": userId!,
      "firstname": firstName,
      "lastname": lastName,
      "phone_number": phoneNumber,
      "area_code": areaCode.toUpperCase(),
      "email": email,
    };
    
    var res = await apiHelper.post(fields);
    CommonModel model = CommonModel.fromJson(res);
    if (model.success == "1") {
      return showDialog(
          barrierDismissible: true,
          context: context,
          builder: (context) {
            Future.delayed(const Duration(seconds: 2), () {
              Navigator.of(context).pop();
            });
            return AlertDialog(
              backgroundColor: Colors.black,
              shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              title: Text(
                "${model.message}",
                style: const TextStyle(fontSize: 14),
              ),
            );
          });
    } else {
      showSnackBar(context, model.message);
    }
  }

  updateProfileDetailsApi(context,
      {
      //

      String? gender,
      String? calibre,
      String? userId,
      String? birthday,
      String? goalieExperience,
      String? avaliableToPlay,
      String? levelOfGame,
      String? ashlRegister,
      String? kmToPlay

      //
      }) async {
    ApiHelper apiHelper = ApiHelper(op: ApiConst.updateProfile);
    Map<String, String> fields = {
      "user_id": "$userId",
      "gender": gender!,
      "calibre": calibre!,
      "birthday": birthday!,
      "avaliable_to_play": avaliableToPlay!,
      "kilometers_to_travel": kmToPlay!,
      // "profile_pic": "",
      "level_of_game": levelOfGame!,
      "rent_a_goalie_experience": goalieExperience!,
      "ashl_register": ashlRegister!,
      "user_type": "2"
    };
    var res = await apiHelper.post(fields);
    CommonModel model = CommonModel.fromJson(res);
    if (model.success == "1") {
      return showDialog(
        context: context,
        builder: (context) {
          // Start a delayed task to close the dialog and pop the screen
          Future.delayed(const Duration(seconds: 2), () {
            Navigator.of(context).pop(); // Close the dialog
            Navigator.of(context).pop(); // Navigate to the previous screen
          });

          // Display the dialog
          return AlertDialog(
            backgroundColor: Colors.black,
            shape: const RoundedRectangleBorder(
              side: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            title: Text(
              "${model.message}",
              style: const TextStyle(fontSize: 14, color: Colors.white),
            ),
          );
        },
      );
    } else {
      showSnackBar(context, model.message);
    }
  }
}
