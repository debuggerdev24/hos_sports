import 'dart:convert';
/// success : "1"
/// data : {"ugs_id":"19","user_id":"3","is_availabel_new_game":"1","is_availabel_was_selected":"1","schedule_game_canceled":"1","schedule_change":"1","2_hours_schedule_game":"1","20_minutes_before":"1","is_available_new_promotion":"1","feedback":"1","notification":"email"}
/// message : "Success"
/// service_time : "0.0044429302215576 seconds"

GoalieNotificationSettingModel goalieNotificationSettingModelFromJson(String str) => GoalieNotificationSettingModel.fromJson(json.decode(str));
String goalieNotificationSettingModelToJson(GoalieNotificationSettingModel data) => json.encode(data.toJson());
class GoalieNotificationSettingModel {
  GoalieNotificationSettingModel({
      String? success, 
      Data? data, 
      String? message, 
      String? serviceTime,}){
    _success = success;
    _data = data;
    _message = message;
    _serviceTime = serviceTime;
}

  GoalieNotificationSettingModel.fromJson(dynamic json) {
    _success = json['success'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _message = json['message'];
    _serviceTime = json['service_time'];
  }
  String? _success;
  Data? _data;
  String? _message;
  String? _serviceTime;
GoalieNotificationSettingModel copyWith({  String? success,
  Data? data,
  String? message,
  String? serviceTime,
}) => GoalieNotificationSettingModel(  success: success ?? _success,
  data: data ?? _data,
  message: message ?? _message,
  serviceTime: serviceTime ?? _serviceTime,
);
  String? get success => _success;
  Data? get data => _data;
  String? get message => _message;
  String? get serviceTime => _serviceTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['message'] = _message;
    map['service_time'] = _serviceTime;
    return map;
  }

}

/// ugs_id : "19"
/// user_id : "3"
/// is_availabel_new_game : "1"
/// is_availabel_was_selected : "1"
/// schedule_game_canceled : "1"
/// schedule_change : "1"
/// 2_hours_schedule_game : "1"
/// 20_minutes_before : "1"
/// is_available_new_promotion : "1"
/// feedback : "1"
/// notification : "email"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? ugsId, 
      String? userId, 
      String? isAvailabelNewGame, 
      String? isAvailabelWasSelected, 
      String? scheduleGameCanceled, 
      String? scheduleChange, 
      String? HoursScheduleGame, 
      String? MinutesBefore, 
      String? isAvailableNewPromotion, 
      String? feedback, 
      String? notification,}){
    _ugsId = ugsId;
    _userId = userId;
    _isAvailabelNewGame = isAvailabelNewGame;
    _isAvailabelWasSelected = isAvailabelWasSelected;
    _scheduleGameCanceled = scheduleGameCanceled;
    _scheduleChange = scheduleChange;
    _HoursScheduleGame = HoursScheduleGame;
    _MinutesBefore = MinutesBefore;
    _isAvailableNewPromotion = isAvailableNewPromotion;
    _feedback = feedback;
    _notification = notification;
}

  Data.fromJson(dynamic json) {
    _ugsId = json['ugs_id'];
    _userId = json['user_id'];
    _isAvailabelNewGame = json['is_availabel_new_game'];
    _isAvailabelWasSelected = json['is_availabel_was_selected'];
    _scheduleGameCanceled = json['schedule_game_canceled'];
    _scheduleChange = json['schedule_change'];
    _HoursScheduleGame = json['2_hours_schedule_game'];
    _MinutesBefore = json['20_minutes_before'];
    _isAvailableNewPromotion = json['is_available_new_promotion'];
    _feedback = json['feedback'];
    _notification = json['notification'];
  }
  String? _ugsId;
  String? _userId;
  String? _isAvailabelNewGame;
  String? _isAvailabelWasSelected;
  String? _scheduleGameCanceled;
  String? _scheduleChange;
  String? _HoursScheduleGame;
  String? _MinutesBefore;
  String? _isAvailableNewPromotion;
  String? _feedback;
  String? _notification;
Data copyWith({  String? ugsId,
  String? userId,
  String? isAvailabelNewGame,
  String? isAvailabelWasSelected,
  String? scheduleGameCanceled,
  String? scheduleChange,
  String? HoursScheduleGame,
  String? MinutesBefore,
  String? isAvailableNewPromotion,
  String? feedback,
  String? notification,
}) => Data(  ugsId: ugsId ?? _ugsId,
  userId: userId ?? _userId,
  isAvailabelNewGame: isAvailabelNewGame ?? _isAvailabelNewGame,
  isAvailabelWasSelected: isAvailabelWasSelected ?? _isAvailabelWasSelected,
  scheduleGameCanceled: scheduleGameCanceled ?? _scheduleGameCanceled,
  scheduleChange: scheduleChange ?? _scheduleChange,
  HoursScheduleGame: HoursScheduleGame ?? _HoursScheduleGame,
  MinutesBefore: MinutesBefore ?? _MinutesBefore,
  isAvailableNewPromotion: isAvailableNewPromotion ?? _isAvailableNewPromotion,
  feedback: feedback ?? _feedback,
  notification: notification ?? _notification,
);
  String? get ugsId => _ugsId;
  String? get userId => _userId;
  String? get isAvailabelNewGame => _isAvailabelNewGame;
  String? get isAvailabelWasSelected => _isAvailabelWasSelected;
  String? get scheduleGameCanceled => _scheduleGameCanceled;
  String? get scheduleChange => _scheduleChange;
  String? get HoursScheduleGame => _HoursScheduleGame;
  String? get MinutesBefore => _MinutesBefore;
  String? get isAvailableNewPromotion => _isAvailableNewPromotion;
  String? get feedback => _feedback;
  String? get notification => _notification;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ugs_id'] = _ugsId;
    map['user_id'] = _userId;
    map['is_availabel_new_game'] = _isAvailabelNewGame;
    map['is_availabel_was_selected'] = _isAvailabelWasSelected;
    map['schedule_game_canceled'] = _scheduleGameCanceled;
    map['schedule_change'] = _scheduleChange;
    map['2_hours_schedule_game'] = _HoursScheduleGame;
    map['20_minutes_before'] = _MinutesBefore;
    map['is_available_new_promotion'] = _isAvailableNewPromotion;
    map['feedback'] = _feedback;
    map['notification'] = _notification;
    return map;
  }

}