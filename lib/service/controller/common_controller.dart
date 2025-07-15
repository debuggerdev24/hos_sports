import 'dart:convert';
import 'dart:developer';

import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hos_sports/service/api_const.dart';
import 'package:hos_sports/service/controller/auth_controller.dart';
import 'package:hos_sports/service/model/CommonModel.dart';
import 'package:hos_sports/service/model/ContactUsModel.dart';
import 'package:hos_sports/service/model/FaqModel.dart';
import 'package:hos_sports/service/model/GamePaymentModel.dart';
import 'package:hos_sports/service/model/GameUnpaidModel.dart';
import 'package:hos_sports/service/model/GoalieRatingModel.dart';
import 'package:hos_sports/service/model/PromotionModel.dart';
import 'package:hos_sports/service/model/ScheduleAvailabilityModel.dart';
import 'package:hos_sports/widgets/toast.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/widgets.dart';

class CommonController extends GetxController {
  FaqModel? faq;
  ContactUsModel? contactUsModel;
  GoalieRatingModel? goalieRatingModel;
  GamePaymentModel? gamePaymentModel;
  GameUnpaidModel? gameUnpaidModel;
  ScheduleAvailabilityModel? scheduleAvailabilityModel;
  PromotionModel? promotionModel;

  goalieAllRatingApi({required String filed}) async {
    String? userId = Get.find<AuthController>().userId;
    ApiHelper apiHelper = ApiHelper(op: ApiConst.goalieAllRating);
    Map<String, String> fields = {"user_id": "$userId", "filed": filed};
    var res = await apiHelper.post(fields);
    goalieRatingModel = GoalieRatingModel.fromJson(res);
    update();
  }

  insertFeedbackApi(context,
      {required String scheduleId,
      required String customerId,
      String? userID,
      required String feedback,
      required String goalieOnTime,
      required String goalieFitInTeam,
      required String goalieCaliber,
      String? rating,
      String? isFav}) async {
    String? userId = Get.find<AuthController>().userId;
    String? userType = Get.find<AuthController>().userType;
    ApiHelper apiHelper = ApiHelper(op: ApiConst.insertFeedback);
    Map<String, String> fields = {
      "user": userType == "1" ? "customer" : "goalie",
      "schedule_id": scheduleId,
      "customer_id": customerId,
      "user_id": userID ?? '$userId',
      // "customer_id": "$userId",
      // "user_id": customerId,
      "feedback": feedback,
      "goalie_on_time": goalieOnTime,
      "goalie_fit_in_team": goalieFitInTeam,
      "goalie_caliber": goalieCaliber,
      "rating": userType == "1" ? rating! : "0",
      "is_favorite": isFav ?? "0"
    };

    log('feeback ${fields.toString()}');
    var res = await apiHelper.post(fields);
    CommonModel model = CommonModel.fromJson(res);
    if (model.success == "1") {
      showSnackBar(context, "Thank you for your feedback.");
      // showSnackBar(context, "${model.message}");
    } else {
      showSnackBar(context, "${model.message}");
    }
  }

  //todo
  goaliesFeedbackListApi() async {
    String? userId = Get.find<AuthController>().userId;
    ApiHelper apiHelper = ApiHelper(op: ApiConst.goaliesFeedbackList);
    Map<String, String> fields = {
      "user": "",
      "schedule_id": "",
      "customer_id": "",
      "user_id": "",
    };
    var res = await apiHelper.post(fields);
  }

  gamePaymentApi({required String filter}) async {
    String? userId = Get.find<AuthController>().userId;
    ApiHelper apiHelper = ApiHelper(op: ApiConst.gamePayment);
    Map<String, String> fields = {
      "user_id": "$userId",
      "filter": filter,
    };
    var res = await apiHelper.post(fields);
    gamePaymentModel = GamePaymentModel.fromJson(res);
    update();
  }

  unpaidGameApi({required String filter}) async {
    String? userId = Get.find<AuthController>().userId;
    ApiHelper apiHelper = ApiHelper(op: ApiConst.unpaidGame);
    Map<String, String> fields = {
      "user_id": "$userId",
      "filter": filter,
    };
    var res = await apiHelper.post(fields);
    gameUnpaidModel = GameUnpaidModel.fromJson(res);
    update();
  }

  promotionListApi() async {
    String? type = Get.find<AuthController>().userType;
    String? userId = Get.find<AuthController>().userId;
    ApiHelper apiHelper = ApiHelper(op: ApiConst.promotionList);
    Map<String, String> fields = {
      "user_id": "$userId",
      "user_type": "$type",
    };
    var res = await apiHelper.post(fields);
    PromotionModel model = PromotionModel.fromJson(res);
    promotionModel = model;
    update();
  }

  faqListApi() async {
    String? type = Get.find<AuthController>().userType;
    ApiHelper apiHelper = ApiHelper(op: ApiConst.faqList);
    Map<String, String> fields = {
      "user_type": "$type",
    };
    var res = await apiHelper.post(fields);
    FaqModel model = FaqModel.fromJson(res);
    faq = model;
    update();
  }

  getContactUsApi() async {
    String? type = Get.find<AuthController>().userType;
    ApiHelper apiHelper = ApiHelper(op: ApiConst.getContactUs);
    Map<String, String> fields = {
      "user_type": "$type",
    };
    var res = await apiHelper.post(fields);
    ContactUsModel model = ContactUsModel.fromJson(res);
    contactUsModel = model;
    update();
  }

  //todo
  sendVerifyEmailLinkApi() async {
    ApiHelper apiHelper = ApiHelper(op: ApiConst.sendVerifyEmailLink);
    Map<String, String> fields = {
      "email": "",
      "user_id": "",
    };
    var res = await apiHelper.post(fields);
  }

  addFeedbackTestimonialsApi(context,
      {required String userType,
      required String rating,
      required String title,
      required String comment,
      required String isShare}) async {
    String? userId = Get.find<AuthController>().userId;
    ApiHelper apiHelper = ApiHelper(op: ApiConst.addFeedbackTestimonials);
    Map<String, String> fields = {
      "user_id": "$userId",
      "user_type": userType,
      "rating": rating,
      "title": title,
      "comment": comment,
      "is_share": isShare,
    };
    var res = await apiHelper.post(fields);
    CommonModel model = CommonModel.fromJson(res);
    if (model.success == "1") {
      showSnackBar(context, "${model.message}");
    } else {
      showSnackBar(context, "${model.message}");
    }
  }

  addFeedbackGeneralApi(context,
      {required String userType,
      required String title,
      required String comment,
      required String isSendReply}) async {
    String? userId = Get.find<AuthController>().userId;
    ApiHelper apiHelper = ApiHelper(op: ApiConst.addFeedbackGeneral);
    Map<String, String> fields = {
      "user_id": "$userId",
      "user_type": userType,
      "title": title,
      "comment": comment,
      "is_send_response": isSendReply,
    };
    var res = await apiHelper.post(fields);
    CommonModel model = CommonModel.fromJson(res);
    if (model.success == "1") {
      showSnackBar(context, "${model.message}");
    } else {
      showSnackBar(context, "${model.message}");
    }
  }

  addFeedbackAppImprovementApi(context,
      {required String userType,
      required String title,
      required String comment,
      required String isRelatedTo}) async {
    String? userId = Get.find<AuthController>().userId;
    ApiHelper apiHelper = ApiHelper(op: ApiConst.addFeedbackAppImprovement);
    Map<String, String> fields = {
      "user_id": "$userId",
      "user_type": userType,
      "title": title,
      "comment": comment,
      "related": isRelatedTo,
    };
    var res = await apiHelper.post(fields);
    CommonModel model = CommonModel.fromJson(res);
    if (model.success == "1") {
      showSnackBar(context, "${model.message}");
    } else {
      showSnackBar(context, "${model.message}");
    }
  }

  Future<ScheduleAvailabilityModel?> getNotificationScheduleApi() async {
    String? userId = Get.find<AuthController>().userId;
    ApiHelper apiHelper = ApiHelper(op: ApiConst.getNotificationSchedule);
    Map<String, String> fields = {
      "user_id": "$userId",
    };
    log("filesdsof the notification======>${fields}");
    var res = await apiHelper.post(fields);
    scheduleAvailabilityModel = ScheduleAvailabilityModel.fromJson(res);
    update();
    log(res.toString());
    return scheduleAvailabilityModel;
  }

  //todo
  // updateNotificationScheduleApi(context, List<Map> timeSlots) async {
  //   String? userId = Get.find<AuthController>().userId;
  //   ApiHelper apiHelper = ApiHelper(op: ApiConst.updateNotificationSchedule);
  //   // log("time Slots $timeSlots");
  //   Map<String, String> fields = {
  //     "user_id": "$userId",
  //     "time_slots": json.encode(timeSlots),
  //   };

  //   var res = await apiHelper.post(fields);
  //   final response = json.decode(res);
  //   log(response.toString());

  //   // ScheduleAvailabilityModel model = ScheduleAvailabilityModel.fromJson(res);
  //   if (response['success'] == "1") {
  //     showDialog(
  //         barrierColor: const Color.fromARGB(200, 0, 0, 0),
  //         context: context,
  //         builder: (context) {
  //           return AlertDialog(
  //             backgroundColor: Colors.black,
  //             shape: const RoundedRectangleBorder(
  //               side: BorderSide(color: Colors.white),
  //                   BorderRadius.all(Radius.circular(20)), // Rounded corners
  //             ),
  //             content: Text(response['message'].toString()),
  //               borderRadius:
  //           );
  //         });
  //   } else {
  //     showSnackBar(context, "${response['message']}");
  //   }
  // }

  Future<void> updateNotificationScheduleApiHttp(
      BuildContext context, List<Map> timeSlots) async {
    const String url = "$baseUrl/update_notification_schedule";

    String? userId = Get.find<AuthController>().userId;

    Map<String, String> fields = {
      "user_id": "$userId",
      "op": "update_notification_schedule",
      "time_slots": json.encode(timeSlots),
    };

    log("API URL: $url");

    try {
      // Send POST request
      final response = await http.post(
        Uri.parse(url),
        body: fields,
      );

      // Log the raw response for debugging
      log("Response status: ${response.statusCode}");
      log("Response body: ${response.body}");

      // Check the response status code
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        log("Parsed Response: $data");

        Get.back();
        showSnackBar(context, "${data['message']}");
      } else {
        log("Failed request. Status code: ${response.statusCode}");
        log("Response body: ${response.body}");
        Get.back();
        showSnackBar(context, "Something went wrong");
      }
    } catch (e) {
      Get.back();
      // Handle and log errors
      log("Error occurred: $e");
      showSnackBar(context, "Server error: $e");
    }
  }

  //review
  rateApp() async {
    final InAppReview inAppReview = InAppReview.instance;
    print(await inAppReview.isAvailable());
    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    }
  }

  share() async {
    final result = await Share.share(
        'Hossports Goalie Rentals App - http://onelink.to/swg7en');

    if (result.status == ShareResultStatus.success) {
      print('Thank you for sharing my website!');
    }
  }

  shareSms() async {
    const message = 'Hossports Goalie Rentals App - http://onelink.to/swg7en';
    final uri =
        Uri(scheme: 'sms', path: '', queryParameters: {'body': message});
    if (await canLaunchUrl(Uri.parse(uri.toString()))) {
      await launchUrl(Uri.parse(uri.toString()));
    } else {
      print('Could not launch SMS app');
    }
  }
}
