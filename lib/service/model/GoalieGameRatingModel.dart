import 'dart:convert';

/// data : [{"id":"198","schedule_id":"1633","customer_id":"284","user_id":"284","rating":"","feedback":"Most flexible goalie I’ve ever encountered","goalie_on_time":"5","goalie_fit_in_team":"5","goalie_caliber":"5","is_favorite":"1","is_approve":"1","is_delete":"0","added_on":"2023-05-30 19:10:31","team_name":"Mustards","rink":"Stouffville Clippers Sorts Complex","address":"120 Weldon Rd, Whitchurch-Stouffville, ON L4A 1N2, Canada","gender":"Male","format":"Game - 5 vs 5","caliber":"C","goalies":"1","playoff":"0","save_game":"0","latitude":"43.96492","longitude":"-79.261856","game_payment":"50","date":"2023-05-24","time":"07:00 PM","game_datetime":"2023-05-24 19:00:00","time_zone":"Atlantic/Reykjavik","digit_timezone":"00:00","short_time_zone":"GMT","game_duration":"60","instruction":"","remainder":"0","place_id":"ChIJYcqpJdUp1YkRcYi19OtLuXo","register_on":"2023-05-24 01:56:01","is_cancel":"0","reposted":"0","cancel_goalie_id":"0","parent_schedule_id":"-1","user_time_zone":"America/Toronto"},{"id":"192","schedule_id":"1378","customer_id":"253","user_id":"253","rating":"","feedback":"Ryan stepped up to fill a vacancy. Thx Ryan. ","goalie_on_time":"5","goalie_fit_in_team":"5","goalie_caliber":"5","is_favorite":"1","is_approve":"1","is_delete":"0","added_on":"2023-02-26 16:38:24","team_name":"Frizzell","rink":"Mount Joy","address":"Mount Joy, Markham, ON L3P 7R2, Canada","gender":"Male","format":"Shinny - 5 vs 5","caliber":"B","goalies":"1","playoff":"0","save_game":"0","latitude":"43.891953","longitude":"-79.264069","game_payment":"50","date":"2023-02-23","time":"09:00 PM","game_datetime":"2023-02-23 21:00:00","time_zone":"America/Toronto","digit_timezone":"-05:00","short_time_zone":"EST","game_duration":"60","instruction":"","remainder":"0","place_id":"ChIJrUrB7yDW1IkRUNszkMTYaG8","register_on":"2023-02-22 15:57:56","is_cancel":"0","reposted":"0","cancel_goalie_id":"0","parent_schedule_id":"-1","user_time_zone":""},{"id":"185","schedule_id":"1332","customer_id":"2","user_id":"2","rating":"","feedback":"Nice win after being under siege in the late third. ","goalie_on_time":"5","goalie_fit_in_team":"5","goalie_caliber":"5","is_favorite":"0","is_approve":"1","is_delete":"0","added_on":"2023-01-30 18:27:26","team_name":"Ale Stars","rink":"Canlan Sports","address":"159 Dynamic Dr, Scarborough, ON M1V 5L8, Canada","gender":"Male","format":"Game - 5 vs 5","caliber":"D","goalies":"1","playoff":"0","save_game":"0","latitude":"43.829132","longitude":"-79.251633","game_payment":"50","date":"2023-01-26","time":"02:45 AM","game_datetime":"2023-01-26 02:45:00","time_zone":"America/Toronto","digit_timezone":"-05:00","short_time_zone":"EST","game_duration":"60","instruction":"Contact is Spence\n","remainder":"0","place_id":"ChIJ6827TtrW1IkRrEeePYzWg_w","register_on":"2023-01-25 23:38:39","is_cancel":"0","reposted":"0","cancel_goalie_id":"0","parent_schedule_id":"-1","user_time_zone":""},{"id":"184","schedule_id":"1331","customer_id":"2","user_id":"2","rating":"","feedback":"Tough OT lose, but great battle to get us into the overage","goalie_on_time":"5","goalie_fit_in_team":"5","goalie_caliber":"5","is_favorite":"0","is_approve":"1","is_delete":"0","added_on":"2023-01-30 18:26:39","team_name":"The D","rink":"Canlan Sports","address":"159 Dynamic Dr, Scarborough, ON M1V 5L8, Canada","gender":"Male","format":"Game - 5 vs 5","caliber":"C","goalies":"1","playoff":"0","save_game":"0","latitude":"43.829132","longitude":"-79.251636","game_payment":"50","date":"2023-01-26","time":"02:00 AM","game_datetime":"2023-01-26 02:00:00","time_zone":"America/Toronto","digit_timezone":"-05:00","short_time_zone":"EST","game_duration":"60","instruction":"","remainder":"0","place_id":"ChIJ6827TtrW1IkRrEeePYzWg_w","register_on":"2023-01-25 23:29:47","is_cancel":"0","reposted":"0","cancel_goalie_id":"0","parent_schedule_id":"-1","user_time_zone":""},{"id":"182","schedule_id":"1334","customer_id":"2","user_id":"2","rating":"","feedback":"Stellar shutout performance","goalie_on_time":"5","goalie_fit_in_team":"5","goalie_caliber":"5","is_favorite":"0","is_approve":"1","is_delete":"0","added_on":"2023-01-30 18:25:19","team_name":"Pylons","rink":"Canlan Sports","address":"159 Dynamic Dr, Scarborough, ON M1V 5L8, Canada","gender":"Male","format":"Game - 5 vs 5","caliber":"D","goalies":"1","playoff":"0","save_game":"0","latitude":"43.829132","longitude":"-79.251633","game_payment":"50","date":"2023-01-27","time":"02:00 AM","game_datetime":"2023-01-27 02:00:00","time_zone":"America/Toronto","digit_timezone":"-05:00","short_time_zone":"EST","game_duration":"60","instruction":"Contact is Junior","remainder":"0","place_id":"ChIJ6827TtrW1IkRrEeePYzWg_w","register_on":"2023-01-26 16:19:58","is_cancel":"0","reposted":"0","cancel_goalie_id":"0","parent_schedule_id":"-1","user_time_zone":""},{"id":"159","schedule_id":"1197","customer_id":"2","user_id":"2","rating":"","feedback":"Another outstanding performance ","goalie_on_time":"5","goalie_fit_in_team":"5","goalie_caliber":"5","is_favorite":"0","is_approve":"1","is_delete":"0","added_on":"2023-01-24 23:42:25","team_name":"BTA","rink":"Canlan Sports","address":"159 Dynamic Dr, Scarborough, ON M1V 5L8, Canada","gender":"Male","format":"Game - 5 vs 5","caliber":"D","goalies":"1","playoff":"0","save_game":"0","latitude":"43.829132","longitude":"-79.251636","game_payment":"50","date":"2022-12-21","time":"04:15 AM","game_datetime":"2022-12-21 04:15:00","time_zone":"America/Toronto","digit_timezone":"-05:00","short_time_zone":"EST","game_duration":"60","instruction":"","remainder":"0","place_id":"ChIJ6827TtrW1IkRrEeePYzWg_w","register_on":"2022-12-21 04:11:58","is_cancel":"0","reposted":"0","cancel_goalie_id":"0","parent_schedule_id":"-1","user_time_zone":""},{"id":"143","schedule_id":"1266","customer_id":"2","user_id":"2","rating":"","feedback":"Awesome, great compete level","goalie_on_time":"5","goalie_fit_in_team":"5","goalie_caliber":"5","is_favorite":"0","is_approve":"1","is_delete":"0","added_on":"2023-01-24 23:29:39","team_name":"Test","rink":"Canlan Sports","address":"1401 Phillip Murray Ave, Oshawa, ON L1J 8C4, Canada","gender":"Male","format":"Game - 5 vs 5","caliber":"B","goalies":"1","playoff":"0","save_game":"0","latitude":"43.854061","longitude":"-78.878744","game_payment":"50","date":"2023-01-09","time":"10:30 PM","game_datetime":"2023-01-09 22:30:00","time_zone":"America/Toronto","digit_timezone":"-05:00","short_time_zone":"EST","game_duration":"60","instruction":"","remainder":"0","place_id":"ChIJJyhwnIHi1IkR3EWgHicCdU0","register_on":"2023-01-09 22:16:59","is_cancel":"0","reposted":"0","cancel_goalie_id":"0","parent_schedule_id":"-1","user_time_zone":""},{"id":"121","schedule_id":"1118","customer_id":"2","user_id":"2","rating":"","feedback":"Amazing, got us the win with a short bench","goalie_on_time":"5","goalie_fit_in_team":"5","goalie_caliber":"5","is_favorite":"0","is_approve":"1","is_delete":"0","added_on":"2022-04-14 01:21:16","team_name":"Beavers","rink":"Rinx Toronto","address":"65 Orfus Rd, North York, ON M6A 1L7, Canada","gender":"Male","format":"Game - 5 vs 5","caliber":"C","goalies":"1","playoff":"0","save_game":"0","latitude":"43.71838","longitude":"-79.462364","game_payment":"50","date":"2022-03-30","time":"02:15 AM","game_datetime":"2022-03-30 02:15:00","time_zone":"America/Toronto","digit_timezone":"-04:00","short_time_zone":"EDT","game_duration":"60","instruction":"John\n","remainder":"0","place_id":"ChIJGdStzdMzK4gREjhMF0ZhLHs","register_on":"2022-03-29 21:34:56","is_cancel":"0","reposted":"0","cancel_goalie_id":"0","parent_schedule_id":"-1","user_time_zone":""},{"id":"118","schedule_id":"1120","customer_id":"2","user_id":"2","rating":"","feedback":"Playoff ringer, enough said!","goalie_on_time":"5","goalie_fit_in_team":"5","goalie_caliber":"5","is_favorite":"0","is_approve":"1","is_delete":"0","added_on":"2022-04-14 01:19:00","team_name":"Real Classy Guysi","rink":"Canlan Sports","address":"159 Dynamic Dr, Scarborough, ON M1V 5L8, Canada","gender":"Male","format":"Game - 5 vs 5","caliber":"C","goalies":"1","playoff":"1","save_game":"0","latitude":"43.829132","longitude":"-79.251636","game_payment":"50","date":"2022-04-13","time":"11:15 PM","game_datetime":"2022-04-13 23:15:00","time_zone":"America/Toronto","digit_timezone":"-04:00","short_time_zone":"EDT","game_duration":"60","instruction":"","remainder":"0","place_id":"ChIJ6827TtrW1IkRrEeePYzWg_w","register_on":"2022-04-13 17:57:01","is_cancel":"0","reposted":"0","cancel_goalie_id":"0","parent_schedule_id":"-1","user_time_zone":""},{"id":"48","schedule_id":"853","customer_id":"2","user_id":"2","rating":"","feedback":"Available on super short notice. Thanks!","goalie_on_time":"5","goalie_fit_in_team":"5","goalie_caliber":"5","is_favorite":"0","is_approve":"1","is_delete":"0","added_on":"2020-02-15 23:01:52","team_name":"White Hawks","rink":"Canlan Ice Sports","address":"159 Dynamic Dr, Scarborough, ON M1V 5L8, Canada","gender":"No Preference","format":"Game - 5 vs 5","caliber":"C","goalies":"1","playoff":"0","save_game":"0","latitude":"43.829128","longitude":"-79.251518","game_payment":"50","date":"2020-02-13","time":"12:15 AM","game_datetime":"2020-02-13 00:15:00","time_zone":"America/Toronto","digit_timezone":"-05:00","short_time_zone":"EST","game_duration":"60","instruction":"Contact is Jon\n","remainder":"0","place_id":"ChIJ6827TtrW1IkRrEeePYzWg_w","register_on":"2020-02-12 16:40:27","is_cancel":"0","reposted":"0","cancel_goalie_id":"0","parent_schedule_id":"-1","user_time_zone":""},{"id":"47","schedule_id":"852","customer_id":"2","user_id":"2","rating":"","feedback":"Awesome tendy and nice guy","goalie_on_time":"5","goalie_fit_in_team":"5","goalie_caliber":"5","is_favorite":"0","is_approve":"1","is_delete":"0","added_on":"2020-02-15 23:01:17","team_name":"Ale Stars","rink":"Canlan Ice Sports","address":"159 Dynamic Dr, Scarborough, ON M1V 5L8, Canada","gender":"No Preference","format":"Game - 5 vs 5","caliber":"C","goalies":"1","playoff":"0","save_game":"0","latitude":"43.829128","longitude":"-79.251518","game_payment":"50","date":"2020-02-13","time":"03:30 AM","game_datetime":"2020-02-13 03:30:00","time_zone":"America/Toronto","digit_timezone":"-05:00","short_time_zone":"EST","game_duration":"60","instruction":"Contact is Brent","remainder":"0","place_id":"ChIJ6827TtrW1IkRrEeePYzWg_w","register_on":"2020-02-12 13:14:39","is_cancel":"0","reposted":"0","cancel_goalie_id":"0","parent_schedule_id":"-1","user_time_zone":""}]
/// success : "1"
/// message : "Goalie game rating."
/// service_time : "0.0026950836181641 seconds"

GoalieGameRatingModel goalieGameRatingModelFromJson(String str) =>
    GoalieGameRatingModel.fromJson(json.decode(str));
String goalieGameRatingModelToJson(GoalieGameRatingModel data) =>
    json.encode(data.toJson());

class GoalieGameRatingModel {
  GoalieGameRatingModel({
    List<Data>? data,
    String? success,
    String? message,
    String? serviceTime,
  }) {
    _data = data;
    _success = success;
    _message = message;
    _serviceTime = serviceTime;
  }

  GoalieGameRatingModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _success = json['success'];
    _message = json['message'];
    _serviceTime = json['service_time'];
  }
  List<Data>? _data;
  String? _success;
  String? _message;
  String? _serviceTime;
  GoalieGameRatingModel copyWith({
    List<Data>? data,
    String? success,
    String? message,
    String? serviceTime,
  }) =>
      GoalieGameRatingModel(
        data: data ?? _data,
        success: success ?? _success,
        message: message ?? _message,
        serviceTime: serviceTime ?? _serviceTime,
      );
  List<Data>? get data => _data;
  String? get success => _success;
  String? get message => _message;
  String? get serviceTime => _serviceTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['success'] = _success;
    map['message'] = _message;
    map['service_time'] = _serviceTime;
    return map;
  }
}

/// id : "198"
/// schedule_id : "1633"
/// customer_id : "284"
/// user_id : "284"
/// rating : ""
/// feedback : "Most flexible goalie I’ve ever encountered"
/// goalie_on_time : "5"
/// goalie_fit_in_team : "5"
/// goalie_caliber : "5"
/// is_favorite : "1"
/// is_approve : "1"
/// is_delete : "0"
/// added_on : "2023-05-30 19:10:31"
/// team_name : "Mustards"
/// rink : "Stouffville Clippers Sorts Complex"
/// address : "120 Weldon Rd, Whitchurch-Stouffville, ON L4A 1N2, Canada"
/// gender : "Male"
/// format : "Game - 5 vs 5"
/// caliber : "C"
/// goalies : "1"
/// playoff : "0"
/// save_game : "0"
/// latitude : "43.96492"
/// longitude : "-79.261856"
/// game_payment : "50"
/// date : "2023-05-24"
/// time : "07:00 PM"
/// game_datetime : "2023-05-24 19:00:00"
/// time_zone : "Atlantic/Reykjavik"
/// digit_timezone : "00:00"
/// short_time_zone : "GMT"
/// game_duration : "60"
/// instruction : ""
/// remainder : "0"
/// place_id : "ChIJYcqpJdUp1YkRcYi19OtLuXo"
/// register_on : "2023-05-24 01:56:01"
/// is_cancel : "0"
/// reposted : "0"
/// cancel_goalie_id : "0"
/// parent_schedule_id : "-1"
/// user_time_zone : "America/Toronto"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    String? id,
    String? scheduleId,
    String? customerId,
    String? userId,
    String? rating,
    String? feedback,
    String? goalieOnTime,
    String? goalieFitInTeam,
    String? goalieCaliber,
    String? isFavorite,
    String? isApprove,
    String? isDelete,
    String? addedOn,
    String? teamName,
    String? rink,
    String? address,
    String? gender,
    String? format,
    String? caliber,
    String? goalies,
    String? playoff,
    String? saveGame,
    String? latitude,
    String? longitude,
    String? gamePayment,
    String? date,
    String? time,
    String? gameDatetime,
    String? timeZone,
    String? digitTimezone,
    String? shortTimeZone,
    String? gameDuration,
    String? instruction,
    String? remainder,
    String? placeId,
    String? registerOn,
    String? isCancel,
    String? reposted,
    String? cancelGoalieId,
    String? parentScheduleId,
    String? userTimeZone,
  }) {
    _id = id;
    _scheduleId = scheduleId;
    _customerId = customerId;
    _userId = userId;
    _rating = rating;
    _feedback = feedback;
    _goalieOnTime = goalieOnTime;
    _goalieFitInTeam = goalieFitInTeam;
    _goalieCaliber = goalieCaliber;
    _isFavorite = isFavorite;
    _isApprove = isApprove;
    _isDelete = isDelete;
    _addedOn = addedOn;
    _teamName = teamName;
    _rink = rink;
    _address = address;
    _gender = gender;
    _format = format;
    _caliber = caliber;
    _goalies = goalies;
    _playoff = playoff;
    _saveGame = saveGame;
    _latitude = latitude;
    _longitude = longitude;
    _gamePayment = gamePayment;
    _date = date;
    _time = time;
    _gameDatetime = gameDatetime;
    _timeZone = timeZone;
    _digitTimezone = digitTimezone;
    _shortTimeZone = shortTimeZone;
    _gameDuration = gameDuration;
    _instruction = instruction;
    _remainder = remainder;
    _placeId = placeId;
    _registerOn = registerOn;
    _isCancel = isCancel;
    _reposted = reposted;
    _cancelGoalieId = cancelGoalieId;
    _parentScheduleId = parentScheduleId;
    _userTimeZone = userTimeZone;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _scheduleId = json['schedule_id'];
    _customerId = json['customer_id'];
    _userId = json['user_id'];
    _rating = json['rating'];
    _feedback = json['feedback'];
    _goalieOnTime = json['goalie_on_time'];
    _goalieFitInTeam = json['goalie_fit_in_team'];
    _goalieCaliber = json['goalie_caliber'];
    _isFavorite = json['is_favorite'];
    _isApprove = json['is_approve'];
    _isDelete = json['is_delete'];
    _addedOn = json['added_on'];
    _teamName = json['team_name'];
    _rink = json['rink'];
    _address = json['address'];
    _gender = json['gender'];
    _format = json['format'];
    _caliber = json['caliber'];
    _goalies = json['goalies'];
    _playoff = json['playoff'];
    _saveGame = json['save_game'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _gamePayment = json['game_payment'];
    _date = json['date'];
    _time = json['time'];
    _gameDatetime = json['game_datetime'];
    _timeZone = json['time_zone'];
    _digitTimezone = json['digit_timezone'];
    _shortTimeZone = json['short_time_zone'];
    _gameDuration = json['game_duration'];
    _instruction = json['instruction'];
    _remainder = json['remainder'];
    _placeId = json['place_id'];
    _registerOn = json['register_on'];
    _isCancel = json['is_cancel'];
    _reposted = json['reposted'];
    _cancelGoalieId = json['cancel_goalie_id'];
    _parentScheduleId = json['parent_schedule_id'];
    _userTimeZone = json['user_time_zone'];
  }
  String? _id;
  String? _scheduleId;
  String? _customerId;
  String? _userId;
  String? _rating;
  String? _feedback;
  String? _goalieOnTime;
  String? _goalieFitInTeam;
  String? _goalieCaliber;
  String? _isFavorite;
  String? _isApprove;
  String? _isDelete;
  String? _addedOn;
  String? _teamName;
  String? _rink;
  String? _address;
  String? _gender;
  String? _format;
  String? _caliber;
  String? _goalies;
  String? _playoff;
  String? _saveGame;
  String? _latitude;
  String? _longitude;
  String? _gamePayment;
  String? _date;
  String? _time;
  String? _gameDatetime;
  String? _timeZone;
  String? _digitTimezone;
  String? _shortTimeZone;
  String? _gameDuration;
  String? _instruction;
  String? _remainder;
  String? _placeId;
  String? _registerOn;
  String? _isCancel;
  String? _reposted;
  String? _cancelGoalieId;
  String? _parentScheduleId;
  String? _userTimeZone;
  Data copyWith({
    String? id,
    String? scheduleId,
    String? customerId,
    String? userId,
    String? rating,
    String? feedback,
    String? goalieOnTime,
    String? goalieFitInTeam,
    String? goalieCaliber,
    String? isFavorite,
    String? isApprove,
    String? isDelete,
    String? addedOn,
    String? teamName,
    String? rink,
    String? address,
    String? gender,
    String? format,
    String? caliber,
    String? goalies,
    String? playoff,
    String? saveGame,
    String? latitude,
    String? longitude,
    String? gamePayment,
    String? date,
    String? time,
    String? gameDatetime,
    String? timeZone,
    String? digitTimezone,
    String? shortTimeZone,
    String? gameDuration,
    String? instruction,
    String? remainder,
    String? placeId,
    String? registerOn,
    String? isCancel,
    String? reposted,
    String? cancelGoalieId,
    String? parentScheduleId,
    String? userTimeZone,
  }) =>
      Data(
        id: id ?? _id,
        scheduleId: scheduleId ?? _scheduleId,
        customerId: customerId ?? _customerId,
        userId: userId ?? _userId,
        rating: rating ?? _rating,
        feedback: feedback ?? _feedback,
        goalieOnTime: goalieOnTime ?? _goalieOnTime,
        goalieFitInTeam: goalieFitInTeam ?? _goalieFitInTeam,
        goalieCaliber: goalieCaliber ?? _goalieCaliber,
        isFavorite: isFavorite ?? _isFavorite,
        isApprove: isApprove ?? _isApprove,
        isDelete: isDelete ?? _isDelete,
        addedOn: addedOn ?? _addedOn,
        teamName: teamName ?? _teamName,
        rink: rink ?? _rink,
        address: address ?? _address,
        gender: gender ?? _gender,
        format: format ?? _format,
        caliber: caliber ?? _caliber,
        goalies: goalies ?? _goalies,
        playoff: playoff ?? _playoff,
        saveGame: saveGame ?? _saveGame,
        latitude: latitude ?? _latitude,
        longitude: longitude ?? _longitude,
        gamePayment: gamePayment ?? _gamePayment,
        date: date ?? _date,
        time: time ?? _time,
        gameDatetime: gameDatetime ?? _gameDatetime,
        timeZone: timeZone ?? _timeZone,
        digitTimezone: digitTimezone ?? _digitTimezone,
        shortTimeZone: shortTimeZone ?? _shortTimeZone,
        gameDuration: gameDuration ?? _gameDuration,
        instruction: instruction ?? _instruction,
        remainder: remainder ?? _remainder,
        placeId: placeId ?? _placeId,
        registerOn: registerOn ?? _registerOn,
        isCancel: isCancel ?? _isCancel,
        reposted: reposted ?? _reposted,
        cancelGoalieId: cancelGoalieId ?? _cancelGoalieId,
        parentScheduleId: parentScheduleId ?? _parentScheduleId,
        userTimeZone: userTimeZone ?? _userTimeZone,
      );
  String? get id => _id;
  String? get scheduleId => _scheduleId;
  String? get customerId => _customerId;
  String? get userId => _userId;
  String? get rating => _rating;
  String? get feedback => _feedback;
  String? get goalieOnTime => _goalieOnTime;
  String? get goalieFitInTeam => _goalieFitInTeam;
  String? get goalieCaliber => _goalieCaliber;
  String? get isFavorite => _isFavorite;
  String? get isApprove => _isApprove;
  String? get isDelete => _isDelete;
  String? get addedOn => _addedOn;
  String? get teamName => _teamName;
  String? get rink => _rink;
  String? get address => _address;
  String? get gender => _gender;
  String? get format => _format;
  String? get caliber => _caliber;
  String? get goalies => _goalies;
  String? get playoff => _playoff;
  String? get saveGame => _saveGame;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  String? get gamePayment => _gamePayment;
  String? get date => _date;
  String? get time => _time;
  String? get gameDatetime => _gameDatetime;
  String? get timeZone => _timeZone;
  String? get digitTimezone => _digitTimezone;
  String? get shortTimeZone => _shortTimeZone;
  String? get gameDuration => _gameDuration;
  String? get instruction => _instruction;
  String? get remainder => _remainder;
  String? get placeId => _placeId;
  String? get registerOn => _registerOn;
  String? get isCancel => _isCancel;
  String? get reposted => _reposted;
  String? get cancelGoalieId => _cancelGoalieId;
  String? get parentScheduleId => _parentScheduleId;
  String? get userTimeZone => _userTimeZone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['schedule_id'] = _scheduleId;
    map['customer_id'] = _customerId;
    map['user_id'] = _userId;
    map['rating'] = _rating;
    map['feedback'] = _feedback;
    map['goalie_on_time'] = _goalieOnTime;
    map['goalie_fit_in_team'] = _goalieFitInTeam;
    map['goalie_caliber'] = _goalieCaliber;
    map['is_favorite'] = _isFavorite;
    map['is_approve'] = _isApprove;
    map['is_delete'] = _isDelete;
    map['added_on'] = _addedOn;
    map['team_name'] = _teamName;
    map['rink'] = _rink;
    map['address'] = _address;
    map['gender'] = _gender;
    map['format'] = _format;
    map['caliber'] = _caliber;
    map['goalies'] = _goalies;
    map['playoff'] = _playoff;
    map['save_game'] = _saveGame;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['game_payment'] = _gamePayment;
    map['date'] = _date;
    map['time'] = _time;
    map['game_datetime'] = _gameDatetime;
    map['time_zone'] = _timeZone;
    map['digit_timezone'] = _digitTimezone;
    map['short_time_zone'] = _shortTimeZone;
    map['game_duration'] = _gameDuration;
    map['instruction'] = _instruction;
    map['remainder'] = _remainder;
    map['place_id'] = _placeId;
    map['register_on'] = _registerOn;
    map['is_cancel'] = _isCancel;
    map['reposted'] = _reposted;
    map['cancel_goalie_id'] = _cancelGoalieId;
    map['parent_schedule_id'] = _parentScheduleId;
    map['user_time_zone'] = _userTimeZone;
    return map;
  }
}
