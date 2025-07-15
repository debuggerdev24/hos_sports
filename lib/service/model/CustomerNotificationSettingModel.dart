import 'dart:convert';
/// success : "1"
/// data : {"ucs_id":"3","user_id":"2","is_availabel_play_game":"1","confirmed_my_game":"1","has_arrive":"1","is_available_new_promotion":"1","feedback":"1","notification":"email"}
/// message : "Success"
/// service_time : "0.002763032913208 seconds"

CustomerNotificationSettingModel customerNotificationSettingModelFromJson(String str) => CustomerNotificationSettingModel.fromJson(json.decode(str));
String customerNotificationSettingModelToJson(CustomerNotificationSettingModel data) => json.encode(data.toJson());
class CustomerNotificationSettingModel {
  CustomerNotificationSettingModel({
      String? success, 
      Data? data, 
      String? message, 
      String? serviceTime,}){
    _success = success;
    _data = data;
    _message = message;
    _serviceTime = serviceTime;
}

  CustomerNotificationSettingModel.fromJson(dynamic json) {
    _success = json['success'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _message = json['message'];
    _serviceTime = json['service_time'];
  }
  String? _success;
  Data? _data;
  String? _message;
  String? _serviceTime;
CustomerNotificationSettingModel copyWith({  String? success,
  Data? data,
  String? message,
  String? serviceTime,
}) => CustomerNotificationSettingModel(  success: success ?? _success,
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

/// ucs_id : "3"
/// user_id : "2"
/// is_availabel_play_game : "1"
/// confirmed_my_game : "1"
/// has_arrive : "1"
/// is_available_new_promotion : "1"
/// feedback : "1"
/// notification : "email"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? ucsId, 
      String? userId, 
      String? isAvailabelPlayGame, 
      String? confirmedMyGame, 
      String? hasArrive, 
      String? isAvailableNewPromotion, 
      String? feedback, 
      String? notification,}){
    _ucsId = ucsId;
    _userId = userId;
    _isAvailabelPlayGame = isAvailabelPlayGame;
    _confirmedMyGame = confirmedMyGame;
    _hasArrive = hasArrive;
    _isAvailableNewPromotion = isAvailableNewPromotion;
    _feedback = feedback;
    _notification = notification;
}

  Data.fromJson(dynamic json) {
    _ucsId = json['ucs_id'];
    _userId = json['user_id'];
    _isAvailabelPlayGame = json['is_availabel_play_game'];
    _confirmedMyGame = json['confirmed_my_game'];
    _hasArrive = json['has_arrive'];
    _isAvailableNewPromotion = json['is_available_new_promotion'];
    _feedback = json['feedback'];
    _notification = json['notification'];
  }
  String? _ucsId;
  String? _userId;
  String? _isAvailabelPlayGame;
  String? _confirmedMyGame;
  String? _hasArrive;
  String? _isAvailableNewPromotion;
  String? _feedback;
  String? _notification;
Data copyWith({  String? ucsId,
  String? userId,
  String? isAvailabelPlayGame,
  String? confirmedMyGame,
  String? hasArrive,
  String? isAvailableNewPromotion,
  String? feedback,
  String? notification,
}) => Data(  ucsId: ucsId ?? _ucsId,
  userId: userId ?? _userId,
  isAvailabelPlayGame: isAvailabelPlayGame ?? _isAvailabelPlayGame,
  confirmedMyGame: confirmedMyGame ?? _confirmedMyGame,
  hasArrive: hasArrive ?? _hasArrive,
  isAvailableNewPromotion: isAvailableNewPromotion ?? _isAvailableNewPromotion,
  feedback: feedback ?? _feedback,
  notification: notification ?? _notification,
);
  String? get ucsId => _ucsId;
  String? get userId => _userId;
  String? get isAvailabelPlayGame => _isAvailabelPlayGame;
  String? get confirmedMyGame => _confirmedMyGame;
  String? get hasArrive => _hasArrive;
  String? get isAvailableNewPromotion => _isAvailableNewPromotion;
  String? get feedback => _feedback;
  String? get notification => _notification;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ucs_id'] = _ucsId;
    map['user_id'] = _userId;
    map['is_availabel_play_game'] = _isAvailabelPlayGame;
    map['confirmed_my_game'] = _confirmedMyGame;
    map['has_arrive'] = _hasArrive;
    map['is_available_new_promotion'] = _isAvailableNewPromotion;
    map['feedback'] = _feedback;
    map['notification'] = _notification;
    return map;
  }

}