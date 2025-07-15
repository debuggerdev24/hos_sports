import 'dart:convert';

/// success : "1"
/// data : [{"user_id":"3","ns_id":"1","status":"1","start_time_am":"12:00:00 AM","end_time_am":"11:59:00 AM","start_time_pm":"12:00:00 PM","end_time_pm":"11:59:00 PM","local_start_time_am":"12:00:00","local_end_time_am":"11:59:00","local_start_time_pm":"12:00:00","local_end_time_pm":"11:59:00","added_on":"2019-05-01 02:18:28"},{"user_id":"3","ns_id":"2","status":"1","start_time_am":"12:00:00 AM","end_time_am":"11:59:00 AM","start_time_pm":"12:00:00 PM","end_time_pm":"11:55:00 PM","local_start_time_am":"12:00:00","local_end_time_am":"11:59:00","local_start_time_pm":"12:00:00","local_end_time_pm":"11:55:00","added_on":"2019-05-01 02:18:28"},{"user_id":"3","ns_id":"3","status":"1","start_time_am":"12:00:00 AM","end_time_am":"11:59:00 AM","start_time_pm":"12:00:00 PM","end_time_pm":"11:59:00 PM","local_start_time_am":"12:00:00","local_end_time_am":"11:59:00","local_start_time_pm":"12:00:00","local_end_time_pm":"11:59:00","added_on":"2019-05-01 02:18:28"},{"user_id":"3","ns_id":"4","status":"1","start_time_am":"12:00:00 AM","end_time_am":"11:59:00 AM","start_time_pm":"12:00:00 PM","end_time_pm":"11:59:00 PM","local_start_time_am":"12:00:00","local_end_time_am":"11:59:00","local_start_time_pm":"12:00:00","local_end_time_pm":"11:59:00","added_on":"2019-05-01 02:18:28"},{"user_id":"3","ns_id":"5","status":"1","start_time_am":"12:00:00 AM","end_time_am":"11:59:00 AM","start_time_pm":"12:00:00 PM","end_time_pm":"11:59:00 PM","local_start_time_am":"12:00:00","local_end_time_am":"11:59:00","local_start_time_pm":"12:00:00","local_end_time_pm":"11:59:00","added_on":"2019-05-01 02:18:28"},{"user_id":"3","ns_id":"6","status":"1","start_time_am":"12:00:00 AM","end_time_am":"11:59:00 AM","start_time_pm":"12:00:00 PM","end_time_pm":"11:59:00 PM","local_start_time_am":"12:00:00","local_end_time_am":"11:59:00","local_start_time_pm":"12:00:00","local_end_time_pm":"11:59:00","added_on":"2019-05-01 02:18:28"},{"user_id":"3","ns_id":"7","status":"1","start_time_am":"12:00:00 AM","end_time_am":"11:59:00 AM","start_time_pm":"12:00:00 PM","end_time_pm":"11:59:00 PM","local_start_time_am":"12:00:00","local_end_time_am":"11:59:00","local_start_time_pm":"12:00:00","local_end_time_pm":"11:59:00","added_on":"2019-05-01 02:18:28"}]
/// message : "Sucess"
/// service_time : "0.0029020309448242 seconds"

ScheduleAvailabilityModel scheduleAvailabilityModelFromJson(String str) =>
    ScheduleAvailabilityModel.fromJson(json.decode(str));

String scheduleAvailabilityModelToJson(ScheduleAvailabilityModel data) =>
    json.encode(data.toJson());

class ScheduleAvailabilityModel {
  ScheduleAvailabilityModel({
    String? success,
    List<Data>? data,
    String? message,
    String? serviceTime,
  }) {
    _success = success;
    _data = data;
    _message = message;
    _serviceTime = serviceTime;
  }

  ScheduleAvailabilityModel.fromJson(dynamic json) {
    _success = json['success'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _message = json['message'];
    _serviceTime = json['service_time'];
  }

  String? _success;
  List<Data>? _data;
  String? _message;
  String? _serviceTime;

  ScheduleAvailabilityModel copyWith({
    String? success,
    List<Data>? data,
    String? message,
    String? serviceTime,
  }) =>
      ScheduleAvailabilityModel(
        success: success ?? _success,
        data: data ?? _data,
        message: message ?? _message,
        serviceTime: serviceTime ?? _serviceTime,
      );

  String? get success => _success;

  List<Data>? get data => _data;

  String? get message => _message;

  String? get serviceTime => _serviceTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['message'] = _message;
    map['service_time'] = _serviceTime;
    return map;
  }
}

/// user_id : "3"
/// ns_id : "1"
/// status : "1"
/// start_time_am : "12:00:00 AM"
/// end_time_am : "11:59:00 AM"
/// start_time_pm : "12:00:00 PM"
/// end_time_pm : "11:59:00 PM"
/// local_start_time_am : "12:00:00"
/// local_end_time_am : "11:59:00"
/// local_start_time_pm : "12:00:00"
/// local_end_time_pm : "11:59:00"
/// added_on : "2019-05-01 02:18:28"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    String? userId,
    String? nsId,
    String? status,
    String? startTimeAm,
    String? endTimeAm,
    String? startTimePm,
    String? endTimePm,
    String? localStartTimeAm,
    String? localEndTimeAm,
    String? localStartTimePm,
    String? localEndTimePm,
    String? addedOn,
  }) {
    _userId = userId;
    _nsId = nsId;
    _status = status;
    _startTimeAm = startTimeAm;
    _endTimeAm = endTimeAm;
    _startTimePm = startTimePm;
    _endTimePm = endTimePm;
    _localStartTimeAm = localStartTimeAm;
    _localEndTimeAm = localEndTimeAm;
    _localStartTimePm = localStartTimePm;
    _localEndTimePm = localEndTimePm;
    _addedOn = addedOn;
  }

  Data.fromJson(dynamic json) {
    _userId = json['user_id'];
    _nsId = json['ns_id'];
    _status = json['status'];
    _startTimeAm = json['start_time_am'];
    _endTimeAm = json['end_time_am'];
    _startTimePm = json['start_time_pm'];
    _endTimePm = json['end_time_pm'];
    _localStartTimeAm = json['local_start_time_am'];
    _localEndTimeAm = json['local_end_time_am'];
    _localStartTimePm = json['local_start_time_pm'];
    _localEndTimePm = json['local_end_time_pm'];
    _addedOn = json['added_on'];
  }

  String? _userId;
  String? _nsId;
  String? _status;
  String? _startTimeAm;
  String? _endTimeAm;
  String? _startTimePm;
  String? _endTimePm;
  String? _localStartTimeAm;
  String? _localEndTimeAm;
  String? _localStartTimePm;
  String? _localEndTimePm;
  String? _addedOn;

  Data copyWith({
    String? userId,
    String? nsId,
    String? status,
    String? startTimeAm,
    String? endTimeAm,
    String? startTimePm,
    String? endTimePm,
    String? localStartTimeAm,
    String? localEndTimeAm,
    String? localStartTimePm,
    String? localEndTimePm,
    String? addedOn,
  }) =>
      Data(
        userId: userId ?? _userId,
        nsId: nsId ?? _nsId,
        status: status ?? _status,
        startTimeAm: startTimeAm ?? _startTimeAm,
        endTimeAm: endTimeAm ?? _endTimeAm,
        startTimePm: startTimePm ?? _startTimePm,
        endTimePm: endTimePm ?? _endTimePm,
        localStartTimeAm: localStartTimeAm ?? _localStartTimeAm,
        localEndTimeAm: localEndTimeAm ?? _localEndTimeAm,
        localStartTimePm: localStartTimePm ?? _localStartTimePm,
        localEndTimePm: localEndTimePm ?? _localEndTimePm,
        addedOn: addedOn ?? _addedOn,
      );

  String? get userId => _userId;

  String? get nsId => _nsId;

  String? get status => _status;

  String? get startTimeAm => _startTimeAm;

  String? get endTimeAm => _endTimeAm;

  String? get startTimePm => _startTimePm;

  String? get endTimePm => _endTimePm;

  String? get localStartTimeAm => _localStartTimeAm;

  String? get localEndTimeAm => _localEndTimeAm;

  String? get localStartTimePm => _localStartTimePm;

  String? get localEndTimePm => _localEndTimePm;

  String? get addedOn => _addedOn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['ns_id'] = _nsId;
    map['status'] = _status;
    map['start_time_am'] = _startTimeAm;
    map['end_time_am'] = _endTimeAm;
    map['start_time_pm'] = _startTimePm;
    map['end_time_pm'] = _endTimePm;
    map['local_start_time_am'] = _localStartTimeAm;
    map['local_end_time_am'] = _localEndTimeAm;
    map['local_start_time_pm'] = _localStartTimePm;
    map['local_end_time_pm'] = _localEndTimePm;
    map['added_on'] = _addedOn;
    return map;
  }
}
