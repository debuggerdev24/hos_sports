import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_cropper/image_cropper.dart';
import '../widgets/constants.dart';
import '../widgets/toast.dart';

// const baseUrl = "https://server24.in/hossports/web_services/service.php";
// const baseUrl = "http://app.hockeyrentagoalie.com/web_services/service.php";
 const baseUrl = "http://app.hockeyrentagoalie.com/web_services_aj/service.php";
// const baseUrl = "http://app.hockeyrentagoalie.com/web_services/";

class ApiConst {
  static const updateDeviceToken = "update_device_token";
  static const signup = "user_signup";
  static const goalieSignup = "goalie_signup";
  static const login = "login_user";
  static const sendForgotPasswordLink = "send_forgot_password_link";
  static const sendOtp = "send_otp";
  static const verifyOtp = "verify_otp";

  // For device Force update
  static const foreceUpdate = "force_update";

  // For Both Login
  static const getUsersDetails = "get_users_details";
  static const updateProfile = "update_profile";
  static const goalieAllRating = "goalie_all_rating";
  static const insertFeedback = "insert_feedback";
  static const goaliesFeedbackList = "goalies_feedbacklist";
  static const gamePayment = "game_payment";
  static const unpaidGame = "unpaid_game";
  static const promotionList = "promotionlist";
  static const faqList = "faqlist";
  static const getContactUs = "get_contact_us";
  static const sendVerifyEmailLink = "send_verify_email_link";
  static const addFeedbackTestimonials = "add_feedback_testimonials";
  static const addFeedbackGeneral = "add_feedback_general";
  static const addFeedbackAppImprovement = "add_feedback_app_improvement";
  static const getNotificationSchedule = "get_notification_schedule";
  // static const updateNotificationSchedule = "update_notification_schedule";

  // For Customer Login
  static const goalieScheduleWithNotification =
      "goalie_schedule_with_notification";
  static const updateGameWithNotification = "update_game_with_notification";
  static const cancelGame = "cancel_game";
  static const allCustomerSchedule = "all_customer_schedule";
  static const customerScheduleGoalie = "customer_schedule_goalie";
  static const customerHistory = "customer_history";
  static const customerCancelGameList = "customer_cancel_gamelist";
  static const cancelGameotification = "cancel_game_notification";
  static const customerPendingFeedbackList = "customer_pending_feedbacklist";
  static const customerSelectedGoalie = "customer_selected_goalie";
  static const allGoalieInterested = "all_goalise_interested";
  static const interestedCustomer = "interested_customer";
  static const customerReviewFormGoalie = "customer_review_form_goalie";
  static const goaliesAvailableNextGame = "goalies_available_next_game";
  static const goaliesAvailableRinkGame = "goalie_available_rink_game";
  static const customerFavoritePlace = "customer_favorite_place";
  static const customerFavoriteGoalies = "customer_favorite_goalies";
  static const removeCustomerFavoriteGoalies =
      "remove_customer_favorite_goalies";
  static const removeCustomerFavoritePlace = "remove_customer_favorite_place";
  static const userCustomerNotificationSetting =
      "user_customer_notification_setting";
  static const goaliesAvailableNextGameCustomerSelection =
      "goalies_available_next_game_customer_selection";

// For Goalie Login
  static const userUpdateDistance = "user_update_distance";
  static const checkinGame = "checkin_game";
  static const goaliesCancelToPlayGame = "goalies_cancel_to_playgame";
  static const allGoalieSchedule = "all_goalise_schedule";
  static const selectGoaliesScheduleList = "select_goalies_schedulelist";
  static const goaliesHistory = "goalies_history";
  static const goaliesCancelGame = "goalies_cancel_game";
  static const goaliesPendingFeedbackList = "goalies_pending_feedbacklist";
  static const goalieInterested = "goalie_interested";
  static const goalieAvgRating = "goalie_avg_rating";
  static const goalieParticularGameRating = "goalie_particular_game_rating";
  static const addRedeemedPromotion = "add_redeemed_promotion";
  static const sendGameNotification = "send_game_notification";
  static const userGoalieNotificationSetting =
      "user_goalie_notification_setting";
  static const checkAvailableGameGoalie = "check_available_game_goalie";

// static const addNotificationSchedule = "add_notification_schedule";
// static const getScheduleReport = "get_schedule_report";
}

class ApiHelper {
  final String op;

  ApiHelper({required this.op});

  Future post(Map<String, String> fields) async {
    try {
      fields.addAll({"op": op});
      var request = http.MultipartRequest('POST', Uri.parse(baseUrl));
      log("api___ " + "$op");
      request.fields.addAll(fields);
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String res = await response.stream.bytesToString();
        print(fields);
        log(res.toString());
        return json.decode(res);
      } else {
        String res = await response.stream.bytesToString();

        return json.decode(res);
      }
    } on SocketException {
      showSnackBar(
        Get.context,
        'No Internet connection',
      );
      return null;
    } on HttpException {
      return null;
    } on FormatException {
      log("server error");
      // showToast('Server error', false);

      return null;
    } on TimeoutException {
      // Get.to(() => const TimeoutScreen());
      return null;
    } on Exception {
      log("server error");
      // showToast('Server error', false);
      return null;
    } catch (e) {
      // showToast('$e', false, context);
      showSnackBar(
        Get.context,
        '$e',
      );
      return null;
    }
    return null;
  }

  Future postNotificatoin(Map<String, String> fields) async {
    try {
      fields.addAll({"op": op});
      var request = http.MultipartRequest('POST', Uri.parse(baseUrl));
      log("api___ " + "$op");
      request.fields.addAll(fields);
      log("requestfileds========>${request}");
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String res = await response.stream.bytesToString();
        print(fields);
          log("notificastion response  =====>${fields}");
        
        log("api___ " + "$op" + "  Notificaotin response  " + res.toString());
        return json.decode(res);
      } else {
        String res = await response.stream.bytesToString();
        log("Notificaotin response  " + res.toString());
        return json.decode(res);
      }
    } on SocketException {
      showSnackBar(
        Get.context,
        'No Internet connection',
      );
      return null;
    } on HttpException {
      return null;
    } on FormatException {
      log("server error");
      // showToast('Server error', false);

      return null;
    } on TimeoutException {
      // Get.to(() => const TimeoutScreen());
      return null;
    } on Exception {
      log("server error");
      // showToast('Server error', false);
      return null;
    } catch (e) {
      // showToast('$e', false, context);
      showSnackBar(
        Get.context,
        '$e',
      );
      return null;
    }
    
  }

  Future postFormData(Map<String, String> fields, CroppedFile image) async {
    fields.addAll({"op": op});
    var request = http.MultipartRequest('POST', Uri.parse(baseUrl));
    request.fields.addAll(fields);

    // Adding the image to the request
    request.files
        .add(await http.MultipartFile.fromPath('profile_pic', image.path));

    try {
      http.StreamedResponse response = await request.send();
      String res = await response.stream.bytesToString();
      log("Response Success: $res");
      if (response.statusCode == 200) {
        return json.decode(res);
      } else {
        log("Response Error: ${response.statusCode} - $res");
        return json.decode(res);
      }
    } catch (e) {
      log("Error sending request: $e");
      return {'error': 'Failed to send request'};
    }
  }
}

getTimeZoneApi() {
  return "America/Toronto";
}
