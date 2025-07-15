import 'dart:convert';

/// data : [{"schedule_id":"2299","user_id":"2","team_name":"Demo Game","rink":"Toronto","address":"Toronto, ON, Canada","gender":"Male","format":"Game - 5 vs 5","caliber":"A","goalies":"1","playoff":"1","save_game":"0","latitude":"43.653225","longitude":"-79.383183333333","game_payment":"50","date":"2024-05-18","time":"01:08 PM","game_datetime":"2024-05-18 13:08:00","time_zone":"Atlantic/Reykjavik","digit_timezone":"00:00","short_time_zone":"GMT","game_duration":"60","instruction":"","remainder":"0","place_id":"ChIJpTvG15DL1IkRd8S0KlBVNTI","register_on":"2024-05-17 07:39:33","is_delete":"0","is_favorite":"1","is_cancel":"0","reposted":"0","cancel_goalie_id":"0","parent_schedule_id":"-1","user_time_zone":"America/Toronto","total_time":"2024-05-18 14:08:00","cur_time":"2024-05-20 10:59:46","play_goalies":"1","amount":"50","firstname":"Admin","lastname":"Rent A Goalie","goalie_cut":"15","schedule_game_user_time_zone":"America/Toronto"}]
/// success : "1"
/// message : "You currently have (1) unpaid games"
/// service_time : "0.0096960067749023 seconds"

GameUnpaidModel gameUnpaidModelFromJson(String str) =>
    GameUnpaidModel.fromJson(json.decode(str));
String gameUnpaidModelToJson(GameUnpaidModel data) =>
    json.encode(data.toJson());

class GameUnpaidModel {
  GameUnpaidModel({
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

  GameUnpaidModel.fromJson(dynamic json) {
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
  GameUnpaidModel copyWith({
    List<Data>? data,
    String? success,
    String? message,
    String? serviceTime,
  }) =>
      GameUnpaidModel(
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

/// schedule_id : "2299"
/// user_id : "2"
/// team_name : "Demo Game"
/// rink : "Toronto"
/// address : "Toronto, ON, Canada"
/// gender : "Male"
/// format : "Game - 5 vs 5"
/// caliber : "A"
/// goalies : "1"
/// playoff : "1"
/// save_game : "0"
/// latitude : "43.653225"
/// longitude : "-79.383183333333"
/// game_payment : "50"
/// date : "2024-05-18"
/// time : "01:08 PM"
/// game_datetime : "2024-05-18 13:08:00"
/// time_zone : "Atlantic/Reykjavik"
/// digit_timezone : "00:00"
/// short_time_zone : "GMT"
/// game_duration : "60"
/// instruction : ""
/// remainder : "0"
/// place_id : "ChIJpTvG15DL1IkRd8S0KlBVNTI"
/// register_on : "2024-05-17 07:39:33"
/// is_delete : "0"
/// is_favorite : "1"
/// is_cancel : "0"
/// reposted : "0"
/// cancel_goalie_id : "0"
/// parent_schedule_id : "-1"
/// user_time_zone : "America/Toronto"
/// total_time : "2024-05-18 14:08:00"
/// cur_time : "2024-05-20 10:59:46"
/// play_goalies : "1"
/// amount : "50"
/// firstname : "Admin"
/// lastname : "Rent A Goalie"
/// goalie_cut : "15"
/// schedule_game_user_time_zone : "America/Toronto"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    String? scheduleId,
    String? userId,
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
    String? isDelete,
    String? isFavorite,
    String? isCancel,
    String? reposted,
    String? cancelGoalieId,
    String? parentScheduleId,
    String? userTimeZone,
    String? totalTime,
    String? curTime,
    String? playGoalies,
    String? amount,
    String? firstname,
    String? lastname,
    String? goalieCut,
    String? scheduleGameUserTimeZone,
  }) {
    _scheduleId = scheduleId;
    _userId = userId;
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
    _isDelete = isDelete;
    _isFavorite = isFavorite;
    _isCancel = isCancel;
    _reposted = reposted;
    _cancelGoalieId = cancelGoalieId;
    _parentScheduleId = parentScheduleId;
    _userTimeZone = userTimeZone;
    _totalTime = totalTime;
    _curTime = curTime;
    _playGoalies = playGoalies;
    _amount = amount;
    _firstname = firstname;
    _lastname = lastname;
    _goalieCut = goalieCut;
    _scheduleGameUserTimeZone = scheduleGameUserTimeZone;
  }

  Data.fromJson(dynamic json) {
    _scheduleId = json['schedule_id'];
    _userId = json['user_id'];
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
    _isDelete = json['is_delete'];
    _isFavorite = json['is_favorite'];
    _isCancel = json['is_cancel'];
    _reposted = json['reposted'];
    _cancelGoalieId = json['cancel_goalie_id'];
    _parentScheduleId = json['parent_schedule_id'];
    _userTimeZone = json['user_time_zone'];
    _totalTime = json['total_time'];
    _curTime = json['cur_time'];
    _playGoalies = json['play_goalies'];
    _amount = json['amount'];
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    _goalieCut = json['goalie_cut'];
    _scheduleGameUserTimeZone = json['schedule_game_user_time_zone'];
  }
  String? _scheduleId;
  String? _userId;
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
  String? _isDelete;
  String? _isFavorite;
  String? _isCancel;
  String? _reposted;
  String? _cancelGoalieId;
  String? _parentScheduleId;
  String? _userTimeZone;
  String? _totalTime;
  String? _curTime;
  String? _playGoalies;
  String? _amount;
  String? _firstname;
  String? _lastname;
  String? _goalieCut;
  String? _scheduleGameUserTimeZone;
  Data copyWith({
    String? scheduleId,
    String? userId,
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
    String? isDelete,
    String? isFavorite,
    String? isCancel,
    String? reposted,
    String? cancelGoalieId,
    String? parentScheduleId,
    String? userTimeZone,
    String? totalTime,
    String? curTime,
    String? playGoalies,
    String? amount,
    String? firstname,
    String? lastname,
    String? goalieCut,
    String? scheduleGameUserTimeZone,
  }) =>
      Data(
        scheduleId: scheduleId ?? _scheduleId,
        userId: userId ?? _userId,
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
        isDelete: isDelete ?? _isDelete,
        isFavorite: isFavorite ?? _isFavorite,
        isCancel: isCancel ?? _isCancel,
        reposted: reposted ?? _reposted,
        cancelGoalieId: cancelGoalieId ?? _cancelGoalieId,
        parentScheduleId: parentScheduleId ?? _parentScheduleId,
        userTimeZone: userTimeZone ?? _userTimeZone,
        totalTime: totalTime ?? _totalTime,
        curTime: curTime ?? _curTime,
        playGoalies: playGoalies ?? _playGoalies,
        amount: amount ?? _amount,
        firstname: firstname ?? _firstname,
        lastname: lastname ?? _lastname,
        goalieCut: goalieCut ?? _goalieCut,
        scheduleGameUserTimeZone:
            scheduleGameUserTimeZone ?? _scheduleGameUserTimeZone,
      );
  String? get scheduleId => _scheduleId;
  String? get userId => _userId;
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
  String? get isDelete => _isDelete;
  String? get isFavorite => _isFavorite;
  String? get isCancel => _isCancel;
  String? get reposted => _reposted;
  String? get cancelGoalieId => _cancelGoalieId;
  String? get parentScheduleId => _parentScheduleId;
  String? get userTimeZone => _userTimeZone;
  String? get totalTime => _totalTime;
  String? get curTime => _curTime;
  String? get playGoalies => _playGoalies;
  String? get amount => _amount;
  String? get firstname => _firstname;
  String? get lastname => _lastname;
  String? get goalieCut => _goalieCut;
  String? get scheduleGameUserTimeZone => _scheduleGameUserTimeZone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['schedule_id'] = _scheduleId;
    map['user_id'] = _userId;
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
    map['is_delete'] = _isDelete;
    map['is_favorite'] = _isFavorite;
    map['is_cancel'] = _isCancel;
    map['reposted'] = _reposted;
    map['cancel_goalie_id'] = _cancelGoalieId;
    map['parent_schedule_id'] = _parentScheduleId;
    map['user_time_zone'] = _userTimeZone;
    map['total_time'] = _totalTime;
    map['cur_time'] = _curTime;
    map['play_goalies'] = _playGoalies;
    map['amount'] = _amount;
    map['firstname'] = _firstname;
    map['lastname'] = _lastname;
    map['goalie_cut'] = _goalieCut;
    map['schedule_game_user_time_zone'] = _scheduleGameUserTimeZone;
    return map;
  }
}
