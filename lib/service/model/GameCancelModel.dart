import 'dart:convert';

/// data : [{"schedule_id":"1778","user_id":"3","team_name":"the spot rehab","rink":"Canlan Sports","address":"Canlan Sports, Dynamic Drive, Scarborough, ON, Canada","gender":"Male","format":"Game - 5 vs 5","caliber":"D","goalies":"1","playoff":"1","save_game":"0","latitude":"43.8291323","longitude":"-79.2516358","game_payment":"50","date":"2023-08-24","time":"11:30 PM","game_datetime":"2023-08-22 21:06:58","time_zone":"Atlantic/Reykjavik","digit_timezone":"00:00","short_time_zone":"GMT","game_duration":"60","instruction":"","remainder":"0","place_id":"ChIJ6827TtrW1IkRrEeePYzWg_w","register_on":"2023-08-21 20:58:21","is_delete":"0","is_favorite":"1","is_cancel":"0","reposted":"0","cancel_goalie_id":"0","parent_schedule_id":"-1","user_time_zone":"America/Toronto","cust_interest_id":"607","customer_id":"469","approval_status":"1","play_game":"0","check_in":"0","additional_game":"0","select_goalie_cut":"15","added_on":"2023-08-21 21:00:30","s_user_id":"469","ic_user_id":"3","s_is_cancel":"1","ic_is_cancel":"0","select_goalies":"0","total_time":"2023-08-22 22:06:58","cur_time":"2024-05-16 08:34:17","firstname":"steven","lastname":"karpouzis"}]
/// success : "1"
/// message : "Goalie cancel game list"
/// service_time : "0.0077400207519531 seconds"

GameCancelModel gameCancelModelFromJson(String str) =>
    GameCancelModel.fromJson(json.decode(str));
String gameCancelModelToJson(GameCancelModel data) =>
    json.encode(data.toJson());

class GameCancelModel {
  GameCancelModel({
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

  GameCancelModel.fromJson(dynamic json) {
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
  GameCancelModel copyWith({
    List<Data>? data,
    String? success,
    String? message,
    String? serviceTime,
  }) =>
      GameCancelModel(
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

/// schedule_id : "1778"
/// user_id : "3"
/// team_name : "the spot rehab"
/// rink : "Canlan Sports"
/// address : "Canlan Sports, Dynamic Drive, Scarborough, ON, Canada"
/// gender : "Male"
/// format : "Game - 5 vs 5"
/// caliber : "D"
/// goalies : "1"
/// playoff : "1"
/// save_game : "0"
/// latitude : "43.8291323"
/// longitude : "-79.2516358"
/// game_payment : "50"
/// date : "2023-08-24"
/// time : "11:30 PM"
/// game_datetime : "2023-08-22 21:06:58"
/// time_zone : "Atlantic/Reykjavik"
/// digit_timezone : "00:00"
/// short_time_zone : "GMT"
/// game_duration : "60"
/// instruction : ""
/// remainder : "0"
/// place_id : "ChIJ6827TtrW1IkRrEeePYzWg_w"
/// register_on : "2023-08-21 20:58:21"
/// is_delete : "0"
/// is_favorite : "1"
/// is_cancel : "0"
/// reposted : "0"
/// cancel_goalie_id : "0"
/// parent_schedule_id : "-1"
/// user_time_zone : "America/Toronto"
/// cust_interest_id : "607"
/// customer_id : "469"
/// approval_status : "1"
/// play_game : "0"
/// check_in : "0"
/// additional_game : "0"
/// select_goalie_cut : "15"
/// added_on : "2023-08-21 21:00:30"
/// s_user_id : "469"
/// ic_user_id : "3"
/// s_is_cancel : "1"
/// ic_is_cancel : "0"
/// select_goalies : "0"
/// total_time : "2023-08-22 22:06:58"
/// cur_time : "2024-05-16 08:34:17"
/// firstname : "steven"
/// lastname : "karpouzis"

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
    String? custInterestId,
    String? customerId,
    String? approvalStatus,
    String? playGame,
    String? checkIn,
    String? additionalGame,
    String? selectGoalieCut,
    String? addedOn,
    String? sUserId,
    String? icUserId,
    String? sIsCancel,
    String? icIsCancel,
    String? selectGoalies,
    String? totalTime,
    String? curTime,
    String? firstname,
    String? lastname,
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
    _custInterestId = custInterestId;
    _customerId = customerId;
    _approvalStatus = approvalStatus;
    _playGame = playGame;
    _checkIn = checkIn;
    _additionalGame = additionalGame;
    _selectGoalieCut = selectGoalieCut;
    _addedOn = addedOn;
    _sUserId = sUserId;
    _icUserId = icUserId;
    _sIsCancel = sIsCancel;
    _icIsCancel = icIsCancel;
    _selectGoalies = selectGoalies;
    _totalTime = totalTime;
    _curTime = curTime;
    _firstname = firstname;
    _lastname = lastname;
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
    _custInterestId = json['cust_interest_id'];
    _customerId = json['customer_id'];
    _approvalStatus = json['approval_status'];
    _playGame = json['play_game'];
    _checkIn = json['check_in'];
    _additionalGame = json['additional_game'];
    _selectGoalieCut = json['select_goalie_cut'];
    _addedOn = json['added_on'];
    _sUserId = json['s_user_id'];
    _icUserId = json['ic_user_id'];
    _sIsCancel = json['s_is_cancel'];
    _icIsCancel = json['ic_is_cancel'];
    _selectGoalies = json['select_goalies'];
    _totalTime = json['total_time'];
    _curTime = json['cur_time'];
    _firstname = json['firstname'];
    _lastname = json['lastname'];
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
  String? _custInterestId;
  String? _customerId;
  String? _approvalStatus;
  String? _playGame;
  String? _checkIn;
  String? _additionalGame;
  String? _selectGoalieCut;
  String? _addedOn;
  String? _sUserId;
  String? _icUserId;
  String? _sIsCancel;
  String? _icIsCancel;
  String? _selectGoalies;
  String? _totalTime;
  String? _curTime;
  String? _firstname;
  String? _lastname;
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
    String? custInterestId,
    String? customerId,
    String? approvalStatus,
    String? playGame,
    String? checkIn,
    String? additionalGame,
    String? selectGoalieCut,
    String? addedOn,
    String? sUserId,
    String? icUserId,
    String? sIsCancel,
    String? icIsCancel,
    String? selectGoalies,
    String? totalTime,
    String? curTime,
    String? firstname,
    String? lastname,
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
        custInterestId: custInterestId ?? _custInterestId,
        customerId: customerId ?? _customerId,
        approvalStatus: approvalStatus ?? _approvalStatus,
        playGame: playGame ?? _playGame,
        checkIn: checkIn ?? _checkIn,
        additionalGame: additionalGame ?? _additionalGame,
        selectGoalieCut: selectGoalieCut ?? _selectGoalieCut,
        addedOn: addedOn ?? _addedOn,
        sUserId: sUserId ?? _sUserId,
        icUserId: icUserId ?? _icUserId,
        sIsCancel: sIsCancel ?? _sIsCancel,
        icIsCancel: icIsCancel ?? _icIsCancel,
        selectGoalies: selectGoalies ?? _selectGoalies,
        totalTime: totalTime ?? _totalTime,
        curTime: curTime ?? _curTime,
        firstname: firstname ?? _firstname,
        lastname: lastname ?? _lastname,
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
  String? get custInterestId => _custInterestId;
  String? get customerId => _customerId;
  String? get approvalStatus => _approvalStatus;
  String? get playGame => _playGame;
  String? get checkIn => _checkIn;
  String? get additionalGame => _additionalGame;
  String? get selectGoalieCut => _selectGoalieCut;
  String? get addedOn => _addedOn;
  String? get sUserId => _sUserId;
  String? get icUserId => _icUserId;
  String? get sIsCancel => _sIsCancel;
  String? get icIsCancel => _icIsCancel;
  String? get selectGoalies => _selectGoalies;
  String? get totalTime => _totalTime;
  String? get curTime => _curTime;
  String? get firstname => _firstname;
  String? get lastname => _lastname;

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
    map['cust_interest_id'] = _custInterestId;
    map['customer_id'] = _customerId;
    map['approval_status'] = _approvalStatus;
    map['play_game'] = _playGame;
    map['check_in'] = _checkIn;
    map['additional_game'] = _additionalGame;
    map['select_goalie_cut'] = _selectGoalieCut;
    map['added_on'] = _addedOn;
    map['s_user_id'] = _sUserId;
    map['ic_user_id'] = _icUserId;
    map['s_is_cancel'] = _sIsCancel;
    map['ic_is_cancel'] = _icIsCancel;
    map['select_goalies'] = _selectGoalies;
    map['total_time'] = _totalTime;
    map['cur_time'] = _curTime;
    map['firstname'] = _firstname;
    map['lastname'] = _lastname;
    return map;
  }
}
