import 'dart:convert';
import 'dart:developer';

// import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hos_sports/screen/dashboard_screen/base/goalie_next_time/goalie_available_next_time.dart';
import 'package:hos_sports/service/controller/auth_controller.dart';
import 'package:hos_sports/service/controller/goalie_controller.dart';
import 'package:hos_sports/service/model/AllGoalieInterestedModel.dart';
import 'package:hos_sports/service/model/CheckRickWithoutGoalie.dart';
import 'package:hos_sports/service/model/CommonModel.dart';
import 'package:hos_sports/service/model/CustomerCancelGameModel.dart';
import 'package:hos_sports/service/model/CustomerGameHistoryModel.dart';
import 'package:hos_sports/service/model/CustomerNotificationSettingModel.dart';
import 'package:hos_sports/service/model/CustomerPendingFeedbackModel.dart';
import 'package:hos_sports/service/model/CustomerScheduleGameModel.dart';
import 'package:hos_sports/service/model/CustomerScheduleGoalieModel.dart';
import 'package:hos_sports/service/model/GoalieAvailableNextGameModel.dart';
import 'package:hos_sports/service/model/GoalieRatingModel.dart';
import 'package:hos_sports/widgets/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../screen/dashboard_screen/dashboard_screen.dart';
import '../../widgets/widgets.dart';
import '../api_const.dart';
import '../model/CustomerFavoriteGoalieModel.dart';
import '../model/CustomerFavouritePlaceModel.dart';
import 'common_controller.dart';

class CustomerController extends GetxController {
  GoalieRatingModel? goalieRatingModel;
  CustomerFavouritePlaceModel? customerFavouritePlaceModel;
  CustomerScheduleGameModel? customerScheduleGameModel;
  AllGoalieInterestedModel? allGoalieInterestedModel;
  CustomerScheduleGoalieModel? customerScheduleGoalieModel;
  CustomerCancelGameModel? customerCancelGameModel;
  CustomerGameHistoryModel? customerGameHistoryModel;
  CustomerPendingFeedbackModel? customerPendingFeedbackModel;
  CustomerFavoriteGoalieModel? customerFavoriteGoalieModel;

  //

  bool loadingNewGame = false;
  bool loadingSchedule = false;
  bool loadingSubmitted = false;
  bool loading = false;

  // saveTeamName(value) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   List<String>? a = await loadTeamName();
  //   if (!a!.contains(value)) {
  //     a.add(value);
  //   }
  //   print(a);
  //   await prefs.setStringList('teamName', a);
  // }

  // Future<List<String>?> loadTeamName() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getStringList('teamName') ?? [];
  // }







  List<String> teamNames = [];

  /// Load team names from SharedPreferences
  Future<void> loadTeamName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    teamNames = prefs.getStringList('teamName') ?? [];
    update(); // Refresh UI
  }

  /// Add a new team name (from any screen)
  Future<void> addTeamName(String newTeam) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (!teamNames.contains(newTeam)) {
      if (teamNames.length >= 10) {
        teamNames.removeAt(0); // Remove the oldest entry
      }
      teamNames.add(newTeam);
      log("Team $teamNames");
      await prefs.setStringList('teamName', teamNames);
      update(); // Refresh UI
    }
  }

  /// Remove a team name
  Future<void> removeTeamName(String team) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    teamNames.remove(team);
    await prefs.setStringList('teamName', teamNames);
    update(); // Refresh UI
  }

  createNewSchedule(
    context, {
    required String date,
    required String time,
    required String caliber,
    required String goalies,
    required String format,
    required String gender,
    required String playoff,
    required String teamName,
    required String rink,
    required String latitude,
    required String longitude,
    required String gameDuration,
    required String instruction,
    required String address,
    required String placeId,
    required String timeZone,
  }) async {
    String? userId = Get.find<AuthController>().userId;
    ApiHelper apiHelper =
        ApiHelper(op: ApiConst.goalieScheduleWithNotification);
    Map<String, String> fields = {
      "user_id": "$userId",
      "date": date,
      "time": time,
      "caliber": caliber,
      "goalies": goalies,
      "format": format,
      "gender": gender,
      "playoff": playoff,
      "team_name": teamName,
      "rink": rink,
      "save_game": "0",
      "latitude": latitude,
      "longitude": longitude,
      "game_duration": gameDuration,
      "instruction": instruction,
      "address": address,
      "place_id": placeId,
      "time_zone": timeZone,
      "digit_timezone": "00:00",
      "short_time_zone": "GMT",
    };
    var res = await apiHelper.post(fields);
    addTeamName(teamName);
    // saveTeamName(teamName);
    if (res == null) {
      Future.microtask(() => Get.find<CommonController>()
          .goalieAllRatingApi(filed: "customer")).then((val) {
        Get.back();
        // showAutoCloseAlertDialog(context,
        //     "Your game has been submitted and we're notifying Goalies in your area.");
      });
    }
    CommonModel model = CommonModel.fromJson(res);
    log(">>>>success ${model.success.toString()}");
    if (model.success == "1") {
      // Future.microtask(() => Get.find<CommonController>()
      //     .goalieAllRatingApi(filed: "customer")).then((val) {
      //   Get.back();
      //   // showSnackBar(context,
      //   //     "Your game has been submitted and we're notifying Goalies in your area.");
      // });
      // Future.microtask(() => Get.find<GoalieController>()
      //     .sendGameNotificationApi(
      //         res['data']['send_game_notification']['schedule_id'],
      //         res['data']['send_game_notification']['game_type']));
      // showSnackBar(context, model.message.toString());
      Future.microtask(() => Get.find<CommonController>()
          .goalieAllRatingApi(filed: "customer")).then((val) {
        Get.back(result: true); // Pass true when navigating back

        log('sending notification');

        Future.microtask(() => Get.find<GoalieController>()
            .sendGameNotificationApi(
                res['send_game_notification']['schedule_id'],
                res['send_game_notification']['game_type'],
                cancel_goalie_id: "0",
                isCancelbyGoalie: false));
      });
      log("sending notification===============>${fields}");
      showSnackBar(context, model.message.toString());
    } else if (model.success == "0") {
      // Get.back();
      showSnackBar(context, model.message.toString());
    } else {
      // Get.back();
      showSnackBar(context, model.message.toString());
    }
  }

  ///////

  goalieAllRatingApi({required String filed}) async {
    String? userId = Get.find<AuthController>().userId;
    ApiHelper apiHelper = ApiHelper(op: ApiConst.goalieAllRating);
    Map<String, String> fields = {"user_id": "$userId", "filed": filed};
    var res = await apiHelper.post(fields);
    goalieRatingModel = GoalieRatingModel.fromJson(res);
    update();
  }

  updateGameWithNotificationApi(
    context, {
    required String scheduleId,
    required String date,
    required String time,
    required String caliber,
    required String goalies,
    required String format,
    required String gender,
    required dynamic playoff,
    required String teamName,
    required String rink,
    required String latitude,
    required String longitude,
    required String gameDuration,
    required String instruction,
    required String address,
    required String placeId,
  }) async {
    String? userId = Get.find<AuthController>().userId;
    ApiHelper apiHelper = ApiHelper(op: ApiConst.updateGameWithNotification);

    Map<String, String> fields = {
      "schedule_id": scheduleId,
      "user_id": "$userId",
      "date": date,
      "time": time,
      "caliber": caliber,
      "goalies": goalies,
      "format": format,
      "gender": gender,
      "playoff": playoff,
      "team_name": teamName,
      "rink": rink,
      "save_game": "0",
      "latitude": latitude,
      "longitude": longitude,
      "game_duration": gameDuration,
      "instruction": instruction,
      "address": address,
      "place_id": placeId,
      "time_zone": "America/Toronto",
      "digit_timezone": "00:00",
      "short_time_zone": "GMT",
      "flow": "1",
    };

    log("POST_DATA>>__ " + fields.toString());

    var res = await apiHelper.post(fields);
    print(res);
    if (res == null) {
      Future.microtask(() => Get.find<CommonController>()
          .goalieAllRatingApi(filed: "customer")).then((val) {
        Future.microtask(
            () => Get.find<CustomerController>().allCustomerScheduleApi());
        // Get.back();
        Get.back();
        showSnackBar(
            context, "Your game edits have been submitted sucessfully");
      });
    }
    CommonModel model = CommonModel.fromJson(res);
    log(">>>>success ${model.success.toString()}");
    if (model.success == "1") {
      Future.microtask(() => Get.find<CommonController>()
          .goalieAllRatingApi(filed: "customer")).then((val) {
        Get.back(result: true); // Pass true when navigating back
        // showSnackBar(context,
        //     "Your game has been submitted and we're notifying Goalies in your area.");

        log('sending notification');

        Future.microtask(() => Get.find<GoalieController>()
            .sendGameNotificationApi(
                res['send_game_notification']['schedule_id'],
                res['send_game_notification']['game_type'],
                cancel_goalie_id: "0",
                isCancelbyGoalie: false));
      });

      showSnackBar(context, model.message.toString());
    } else if (model.success == "0") {
      // Get.back();
      showSnackBar(context, model.message.toString());
    } else {
      Get.back();
      showSnackBar(context, model.message.toString());
    }
  }

  cancelGameApi(context, {required String scheduleId}) async {
    ApiHelper apiHelper = ApiHelper(op: ApiConst.cancelGame);
    Map<String, String> fields = {
      "schedule_id": scheduleId,
    };
    var res = await apiHelper.post(fields);
    CommonModel model = CommonModel.fromJson(res);
    if (model.success == "1") {
      //
      log('cancel notification');

      await Future.microtask(
          () => Get.find<CustomerController>().allCustomerScheduleApi());

      Get.offAll(() => const DashboardScreen());

      await Future.microtask(() => Get.find<GoalieController>()
          .cancelGameNotificationApi(res['scheduled_id'], res['game_type']));

      Get.offAll(() => const DashboardScreen());

      showSnackBar(context, model.message.toString());
    } else {
      showSnackBar(context, model.message.toString());
    }
  }

  allCustomerScheduleApi() async {
    loading = true;
    setLoading(true);
    String? userId = Get.find<AuthController>().userId;
    ApiHelper apiHelper = ApiHelper(op: ApiConst.allCustomerSchedule);
    Map<String, String> fields = {
      "user_id": "$userId",
    };
    var res = await apiHelper.post(fields);
    customerScheduleGameModel = CustomerScheduleGameModel.fromJson(res);

    log(res.toString());

    loading = false;
    await setLoading(false);

    update();
  }

  customerScheduleGoalieApi() async {
    loadingSchedule = true;
    await setSchduled(true);
    String? userId = Get.find<AuthController>().userId;
    ApiHelper apiHelper = ApiHelper(op: ApiConst.customerScheduleGoalie);
    Map<String, String> fields = {
      "user_id": "$userId",
    };
    var res = await apiHelper.post(fields);
    customerScheduleGoalieModel = CustomerScheduleGoalieModel.fromJson(res);
    log(res.toString());
    //
    loadingSchedule = false;
    await setSchduled(false);
    update();
  }

  customerHistoryApi() async {
    String? userId = Get.find<AuthController>().userId;
    ApiHelper apiHelper = ApiHelper(op: ApiConst.customerHistory);
    Map<String, String> fields = {
      "user_id": "$userId",
      "type": "history",
    };
    var res = await apiHelper.post(fields);
    CustomerGameHistoryModel model = CustomerGameHistoryModel.fromJson(res);
    customerGameHistoryModel = model;
    update();
  }

  customerCancelGameListApi() async {
    String? userId = Get.find<AuthController>().userId;
    ApiHelper apiHelper = ApiHelper(op: ApiConst.customerCancelGameList);
    Map<String, String> fields = {
      "user_id": "$userId",
    };
    var res = await apiHelper.post(fields);
    CustomerCancelGameModel model = CustomerCancelGameModel.fromJson(res);
    customerCancelGameModel = model;
    update();
  }

  customerPendingFeedbackListApi() async {
    String? userId = Get.find<AuthController>().userId;
    ApiHelper apiHelper = ApiHelper(op: ApiConst.customerPendingFeedbackList);
    Map<String, String> fields = {"user_id": "$userId"};
    var res = await apiHelper.post(fields);
    CustomerPendingFeedbackModel model =
        CustomerPendingFeedbackModel.fromJson(res);
    customerPendingFeedbackModel = model;
    update();
  }

  setLoading(bool value) {
    log("Loading>>>>>>>>> loading >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    loading = value;
    update(); // Trigger UI update
  }

  setSubmitted(bool value) {
    log("Loading>>>>>>>>> submitted >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    loadingSubmitted = value;
    update(); // Trigger UI update
  }

  setSchduled(bool value) {
    log("Loading>>>> Schedule >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    loadingSchedule = value;
    update(); // Trigger UI update
  }

  //

  customerSelectedGoalieApi({required String scheduleId}) async {
    loadingSchedule = true;
    await setSchduled(true);

    String? userId = Get.find<AuthController>().userId;
    ApiHelper apiHelper = ApiHelper(op: ApiConst.customerSelectedGoalie);
    Map<String, String> fields = {
      "schedule_id": scheduleId,
      "customer_id": "$userId",
    };

    var res = await apiHelper.post(fields);
    allGoalieInterestedModel = AllGoalieInterestedModel.fromJson(res);

    loadingSchedule = false;
    await setSchduled(false);
    update();
  }

  allGoalieInterestedApi({required String scheduleId}) async {
    loadingSubmitted = true;
    await setSubmitted(true);
    // update(); // Notify the UI
    ApiHelper apiHelper = ApiHelper(op: ApiConst.allGoalieInterested);
    Map<String, String> fields = {
      "schedule_id": scheduleId,
    };
    var res = await apiHelper.post(fields);
    log(res.toString());
    allGoalieInterestedModel = AllGoalieInterestedModel.fromJson(res);
    loadingSubmitted = false;
    await setSubmitted(false);

    update();
  }

  //todo
  interestedCustomerApi() async {
    ApiHelper apiHelper = ApiHelper(op: ApiConst.interestedCustomer);
    Map<String, String> fields = {
      "schedule_id": "",
      "customer_id": "",
      "user_id": "",
      "approval_status": "",
    };
    var res = await apiHelper.post(fields);
  }

  //todo
  customerReviewFormGoalieApi() async {
    ApiHelper apiHelper = ApiHelper(op: ApiConst.customerReviewFormGoalie);
    Map<String, String> fields = {
      "user_id": "",
    };
    var res = await apiHelper.post(fields);
  }

  //todo
  GoalieAvailableNextGameModel? goalieAvailableNextTime;

  // goaliesAvailableNextGameApi() async {
  //   ApiHelper apiHelper = ApiHelper(op: ApiConst.goaliesAvailableNextGame);
  //   String userId = Get.find<AuthController>().userId.toString();
  //   Map<String, String> fields = {
  //     "user_id": userId,
  //   };
  //   var res = await apiHelper.post(fields);
  //   log("op : goaliesAvailableNextGame__  filds ${fields}  ${res}");
  //   goalieAvailableNextTime = GoalieAvailableNextGameModel.fromJson(res);
  //   update();
  // }

  setCheckNewGame(bool value) {
    log("Loading>>>> New Game >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    loadingNewGame = value;
    update(); // Trigger UI update
  }

  //todo
  CheckingGameWithoutGoalieResponse? goalieAvailableRickTime;
  goaliesAvailableRinkGameApi() async {
    loadingNewGame = true;
    await setCheckNewGame(true);
    ApiHelper apiHelper = ApiHelper(op: ApiConst.goaliesAvailableRinkGame);
    String userId = Get.find<AuthController>().userId.toString();
    Map<String, String> fields = {
      "user_id": userId,
    };
    var res = await apiHelper.post(fields);
    log("op : goaliesAvailableRINK__  filds ${fields}  ${res}");
    goalieAvailableRickTime = CheckingGameWithoutGoalieResponse.fromJson(res);
    loadingNewGame = false;
    await setCheckNewGame(false);
    update();
  }

  customerFavoritePlaceApi() async {
    String? userId = Get.find<AuthController>().userId;
    ApiHelper apiHelper = ApiHelper(op: ApiConst.customerFavoritePlace);
    Map<String, String> fields = {
      "user_id": "$userId",
    };
    var res = await apiHelper.post(fields);
    customerFavouritePlaceModel = CustomerFavouritePlaceModel.fromJson(res);
    update();
  }

  customerFavoriteGoaliesApi() async {
    String? userId = Get.find<AuthController>().userId;
    ApiHelper apiHelper = ApiHelper(op: ApiConst.customerFavoriteGoalies);
    Map<String, String> fields = {
      "user_id": "$userId",
    };
    var res = await apiHelper.post(fields);
    customerFavoriteGoalieModel = CustomerFavoriteGoalieModel.fromJson(res);
    update();
  }

  removeCustomerFavoriteGoaliesApi(context, {required String goalieId}) async {
    String? userId = Get.find<AuthController>().userId;
    ApiHelper apiHelper = ApiHelper(op: ApiConst.removeCustomerFavoriteGoalies);
    Map<String, String> fields = {
      "customer_id": "$userId",
      "user_id": goalieId,
    };
    var res = await apiHelper.post(fields);
    CommonModel model = CommonModel.fromJson(res);
    if (model.success == "1") {
      showSnackBar(context, model.message.toString());
    } else {
      showSnackBar(context, model.message.toString());
    }
  }

  removeCustomerFavoritePlaceApi(context, {required String placeId}) async {
    String? userId = Get.find<AuthController>().userId;
    ApiHelper apiHelper = ApiHelper(op: ApiConst.removeCustomerFavoritePlace);
    Map<String, String> fields = {
      "place_id": placeId,
      "user_id": "$userId",
    };
    var res = await apiHelper.post(fields);
    CommonModel model = CommonModel.fromJson(res);
    if (model.success == "1") {
      showSnackBar(context, model.message.toString());
    } else {
      showSnackBar(context, model.message.toString());
    }
  }

  Future<CustomerNotificationSettingModel> userCustomerNotificationSettingApi(
    bool update, {
    required String notification,
    String? isAvailablePlayGame,
    String? confirmedMyGame,
    String? hasArrive,
    String? isAvailableNewPromotion,
    String? feedback,
  }) async {
    String? userId = Get.find<AuthController>().userId;
    ApiHelper apiHelper =
        ApiHelper(op: ApiConst.userCustomerNotificationSetting);
    Map<String, String> fields = {};
    if (update == true) {
      fields = {
        "user_id": "$userId",
        "notification": notification,
        "is_availabel_play_game": isAvailablePlayGame!,
        "confirmed_my_game": confirmedMyGame!,
        "has_arrive": hasArrive!,
        "is_available_new_promotion": isAvailableNewPromotion!,
        "feedback": feedback!,
      };
    } else {
      fields = {
        "user_id": "$userId",
        "notification": notification,
      };
    }

    var res = await apiHelper.post(fields);
    print(res);
    return CustomerNotificationSettingModel.fromJson(res);
  }

  goaliesAvailableNextGameCustomerSelectionApi(context,
      {required String scheduleId,
      required String goalieId,
      required String approvalStatus}) async {
    String? userId = Get.find<AuthController>().userId;
    ApiHelper apiHelper =
        ApiHelper(op: ApiConst.goaliesAvailableNextGameCustomerSelection);
    Map<String, String> fields = {
      "schedule_id": scheduleId,
      "customer_id": "$userId",
      "user_id": goalieId,
      "approval_status": approvalStatus,
    };
    var res = await apiHelper.post(fields);
    CommonModel model = CommonModel.fromJson(res);
    if (model.success == "1") {
      showSnackBar(context, model.message.toString());
    } else {
      showSnackBar(context, model.message.toString());
    }
  }
}
