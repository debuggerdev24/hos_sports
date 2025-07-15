import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:hos_sports/service/controller/auth_controller.dart';
import 'package:hos_sports/service/controller/location_controller.dart';
import 'package:hos_sports/service/model/CommonModel.dart';
import 'package:hos_sports/service/model/GameAvailableModel.dart';
import 'package:hos_sports/service/model/GameCancelModel.dart';
import 'package:hos_sports/service/model/GameHistoryModel.dart';
import 'package:hos_sports/service/model/GameScheduledModel.dart';
import 'package:hos_sports/service/model/GoalieAvgRatingModel.dart';
import 'package:hos_sports/service/model/GoalieGameRatingModel.dart';
import 'package:hos_sports/service/model/GoalieNotificationSettingModel.dart';
import 'package:hos_sports/service/model/GoaliePendingFeedbackModel.dart';
import 'package:hos_sports/service/model/MostPlayedGameModel.dart';
import 'package:hos_sports/widgets/toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/widgets.dart';
import '../api_const.dart';

class GoalieController extends GetxController {
  GoalieAvgRatingModel? avgRatingModel;
  GameCancelModel? gameCancelModel;
  MostPlayedGameModel? mostPlayedGameModel;
  GameHistoryModel? gameHistoryModel;
  GameAvailableModel? gameAvailableModel;
  GameScheduledModel? gameScheduledModel;
  GoaliePendingFeedbackModel? goaliePendingFeedbackModel;

  bool loadingAbiGame = false;

  setLoading(bool value) {
    log(">>>>>>>>> loading Games >>>>>>>>>>>>>>>>>>>>>>>>>>");
    loadingAbiGame = value;
    update(); // Trigger UI update
  }

  // //todo
  // saveDistance(String distance) async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('distance', distance);
  // }

  // readDistance() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getString('distance');
  // }

  userUpdateDistanceApi(context, {required String distance}) async {
    String? userId = Get.find<AuthController>().userId;
    ApiHelper apiHelper = ApiHelper(op: ApiConst.userUpdateDistance);
    Map<String, String> fields = {
      "user_id": "$userId",
      "distance": distance,
    };
    var res = await apiHelper.post(fields);
    CommonModel model = CommonModel.fromJson(res);
    if (model.success == "1") {
      // saveDistance(distance);
      await Future.microtask(
          () => Get.find<AuthController>().getUsersDetailsApi());

      showSnackBar(context, model.message.toString());
    } else {
      showSnackBar(context, model.message.toString());
    }
  }

  checkInGameApi(
    context, {
    required String scheduleId,
    required String status,
  }) async {
    String? userId = Get.find<AuthController>().userId;
    await Get.find<LocationController>().setPosition(context);
    var latLng = Get.find<LocationController>();
    ApiHelper apiHelper = ApiHelper(op: ApiConst.checkinGame);
    Map<String, String> fields = {
      "user_id": userId!,
      "schedule_id": scheduleId,
      "latitude": "${latLng.latitude}",
      "longitude": "${latLng.longitude}",
      "additional_game": status,
    };
    var res = await apiHelper.post(fields);
    log(res.toString());
    CommonModel model = CommonModel.fromJson(res);
    if (model.success == "1") {
      await selectGoaliesScheduleListApi();
      showAutoCloseAlertRickDialog(context, model.message.toString(),
          barrierDismissible: false);
    } else {
      await selectGoaliesScheduleListApi();
      // showSnackBar(context, model.message.toString());
      showAutoCloseAlertRickDialog(
        context,
        model.message.toString(),
        barrierDismissible: false,
      );
    }
  }

  goaliesCancelToPlayGameApi(context, {required String scheduleId}) async {
    String? userId = Get.find<AuthController>().userId;
    ApiHelper apiHelper = ApiHelper(op: ApiConst.goaliesCancelToPlayGame);
    Map<String, String> fields = {
      "user_id": "$userId",
      "schedule_id": scheduleId,
    };
    var res = await apiHelper.post(fields);
    CommonModel model = CommonModel.fromJson(res);
    if (model.success == "1") {
      Future.microtask(() => Get.find<GoalieController>()
          .sendGameNotificationApi(res['schedule_id'], res['game_type'],
              cancel_goalie_id: "$userId", isCancelbyGoalie: true));
      showSnackBar(context, model.message.toString());
    } else {
      showSnackBar(context, model.message.toString());
    }
  }

  allGoalieScheduleApi() async {
    loadingAbiGame = true;
    setLoading(true);
    //
    String? userId = Get.find<AuthController>().userId;
    ApiHelper apiHelper = ApiHelper(op: ApiConst.allGoalieSchedule);
    Map<String, String> fields = {
      "user_id": "$userId",
    };
    var res = await apiHelper.post(fields);
    gameAvailableModel = GameAvailableModel.fromJson(res);
    loadingAbiGame = false;
    setLoading(false);
    update();
  }

  selectGoaliesScheduleListApi() async {
    String? userId = Get.find<AuthController>().userId;
    ApiHelper apiHelper = ApiHelper(op: ApiConst.selectGoaliesScheduleList);
    Map<String, String> fields = {
      "user_id": "$userId",
    };
    var res = await apiHelper.post(fields);
    gameScheduledModel = GameScheduledModel.fromJson(res);
    update();
  }

  goaliesHistoryApi({required String type}) async {
    String? userId = Get.find<AuthController>().userId;
    ApiHelper apiHelper = ApiHelper(op: ApiConst.goaliesHistory);
    Map<String, String> fields = {
      "user_id": "$userId",
      "type": type,
    };
    var res = await apiHelper.post(fields);
    gameHistoryModel = GameHistoryModel.fromJson(res);
    update();
  }

  goaliesCancelGameApi() async {
    String? userId = Get.find<AuthController>().userId;
    ApiHelper apiHelper = ApiHelper(op: ApiConst.goaliesCancelGame);
    Map<String, String> fields = {
      "user_id": "$userId",
    };
    var res = await apiHelper.post(fields);
    gameCancelModel = GameCancelModel.fromJson(res);
    update();
  }

  goaliesPendingFeedbackListApi() async {
    String? userId = Get.find<AuthController>().userId;
    ApiHelper apiHelper = ApiHelper(op: ApiConst.goaliesPendingFeedbackList);
    Map<String, String> fields = {
      "user_id": "$userId",
    };
    var res = await apiHelper.post(fields);
    goaliePendingFeedbackModel = GoaliePendingFeedbackModel.fromJson(res);
    update();
  }

  goalieInterestedApi(context,
      {required String scheduleId,
      required String approvalStatus,
      required String gameDateTime}) async {
    String? userId = Get.find<AuthController>().userId;
    ApiHelper apiHelper = ApiHelper(op: ApiConst.goalieInterested);
    Map<String, String> fields = {
      "user_id": "$userId",
      "schedule_id": scheduleId,
      "approval_status": approvalStatus,
      "game_datetime": gameDateTime,
    };
    var res = await apiHelper.post(fields);
    CommonModel model = CommonModel.fromJson(res);
    if (model.success == "1") {
      showSnackBar(context, model.message.toString());
    } else {
      showSnackBar(context, model.message.toString());
    }
  }

  //ladder
  goalieAvgRatingApi({String? filed}) async {
    ApiHelper apiHelper = ApiHelper(op: ApiConst.goalieAvgRating);
    Map<String, String> fields = {
      "user_id": "",
      "filed": filed!,
    };
    var res = await apiHelper.post(fields);
    if (filed == "avg") {
      GoalieAvgRatingModel model = GoalieAvgRatingModel.fromJson(res);
      avgRatingModel = model;
      update();
    } else {
      MostPlayedGameModel model = MostPlayedGameModel.fromJson(res);
      mostPlayedGameModel = model;
      update();
    }
  }

  //todo
  GoalieGameRatingModel? goalieGameRatingModel;

  goalieParticularGameRatingApi() async {
    String? userId = Get.find<AuthController>().userId;
    ApiHelper apiHelper = ApiHelper(op: ApiConst.goalieParticularGameRating);
    Map<String, String> fields = {
      "user_id": "$userId",
    };
    var res = await apiHelper.post(fields);
    goalieGameRatingModel = GoalieGameRatingModel.fromJson(res);
    update();
  }

  //todo
  addRedeemedPromotionApi() async {
    ApiHelper apiHelper = ApiHelper(op: ApiConst.addRedeemedPromotion);
    Map<String, String> fields = {
      "user_id": "",
      "user_type": "",
      "promotion_id": "",
    };
    var res = await apiHelper.post(fields);
  }

  //todo
  sendGameNotificationApi(schedule_id, game_type,
      {String? cancel_goalie_id, required bool isCancelbyGoalie}) async {
    ApiHelper apiHelper = ApiHelper(op: ApiConst.sendGameNotification);
    // Map<String, String> fields = {
    //   "schedule_id": "",
    //   "game_type": "",
    //   "available_goalies_count": "",
    // };
    log("create game schedule_id  $schedule_id");
    log("create game type  $game_type");
    log("cancel_goalie_id  ${cancel_goalie_id ?? " no ids"} ");

    Map<String, String> fields = {
      "schedule_id": schedule_id,
      "game_type": game_type
    };

    Map<String, String> cnFields = {
      "schedule_id": schedule_id,
      "game_type": game_type,
      "cancel_goalie_id": cancel_goalie_id!
    };

    var res = await apiHelper
        .postNotificatoin(isCancelbyGoalie == true ? cnFields : fields);

    log(" res: " + res.toString());
  }

  //todo
  cancelGameNotificationApi(schedule_id, game_type) async {
    ApiHelper apiHelper = ApiHelper(op: ApiConst.cancelGameotification);
    // Map<String, String> fields = {
    //   "schedule_id": "",
    //   "game_type": "",
    //   "available_goalies_count": "",
    // };
    log("cancel game schedule_id  $schedule_id");
    log("cancel game type  $game_type");

    Map<String, String> fields = {
      "schedule_id": schedule_id,
      "game_type": game_type
    };

    var res = await apiHelper.postNotificatoin(fields);
    log("response=====>$res");
  }

  Future<GoalieNotificationSettingModel> userGoalieNotificationSettingApi(
    bool update, {
    required String notification,
    String? isAvailableNewGame,
    String? isAvailableWasSelected,
    String? scheduleChange,
    String? twoHoursScheduleGame,
    String? twentyMinutesBefore,
    String? isAvailableNewPromotion,
    String? scheduleGameCanceled,
    String? feedback,
  }) async {
    ApiHelper apiHelper = ApiHelper(op: ApiConst.userGoalieNotificationSetting);
    String? userId = Get.find<AuthController>().userId;
    Map<String, String> fields = {};

    if (update) {
      fields = {
        "user_id": "$userId",
        "notification": notification,
        "is_availabel_new_game": isAvailableNewGame!,
        "is_availabel_was_selected": isAvailableWasSelected!,
        "schedule_game_canceled": scheduleGameCanceled!,
        "schedule_change": scheduleChange!,
        "2_hours_schedule_game": twoHoursScheduleGame!,
        "20_minutes_before": twentyMinutesBefore!,
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
    print(jsonEncode(res));
    return GoalieNotificationSettingModel.fromJson(res);
  }

  //todo
  checkAvailableGameGoalieApi() async {
    ApiHelper apiHelper = ApiHelper(op: ApiConst.checkAvailableGameGoalie);
    Map<String, String> fields = {
      "user_id": "",
      "notification": "",
    };
    var res = await apiHelper.post(fields);
  }
}
