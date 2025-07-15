import 'dart:convert';

/// data : [{"user_id":"2","phone_number":"4168073138","firstname":"Admin","lastname":"Rent A Goalie","area_code":"l6c1a5","email":"hockeyrentagoalie@gmail.com","password":"R29hbGllMjRAQA==","user_type":"1","gender":"","calibre":"","birthday":"","avaliable_to_play":"","kilometers_to_travel":"","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/5cc8faa2593de.jpg","level_of_game":"","rent_a_goalie_experience":"","rating":"5.0","totalgame":"191","unpaid_game":"5","registered_on":"2019-05-01 01:44:21","is_verify":"1","device_type":"1","device_token":"fb4MC7KlTVWxksRGVt8hCc:APA91bFZ-hgRb8LiL2Kms8NbNtBbW9XyvgI2r6fSIomKejVjaf1HanvjT5ML2K4gmTuXqmHuXowSsEMrj61eg9AadtbmqkGhRKvTmgx_nFtbedtyinBHdHybj1KGa4W68JebPtplN7ck","ashl_register":"0","is_active":"1","60_min_game":"50","90_min_game":"65","120_min_game":"75","goalie_cut":"0","is_delete":"0","is_approve":"1","user_latitude":"43.653225","user_longitude":"-79.383183","user_time_zone":"Asia/Calcutta","device_version":"12|3.4|sdk_gphone64_x86_64|GMT 05:30","schedule_id":"2299","team_name":"Demo Game","rink":"Toronto","format":"Game - 5 vs 5","caliber":"A","goalies":"1","playoff":"1","save_game":"0","date":"2024-05-18","time":"01:08 PM","latitude":"43.653225","longitude":"-79.383183333333","game_duration":"60","address":"Toronto, ON, Canada","history_goalies":"0","game_status":"completed","total_time":"2024-05-18 14:08:00","cur_time":"2024-05-20 11:36:45"}]
/// success : "1"
/// message : "feedback"
/// service_time : "0.010548830032349 seconds"

GoaliePendingFeedbackModel goaliePendingFeedbackModelFromJson(String str) =>
    GoaliePendingFeedbackModel.fromJson(json.decode(str));
String goaliePendingFeedbackModelToJson(GoaliePendingFeedbackModel data) =>
    json.encode(data.toJson());

class GoaliePendingFeedbackModel {
  GoaliePendingFeedbackModel({
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

  GoaliePendingFeedbackModel.fromJson(dynamic json) {
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
  GoaliePendingFeedbackModel copyWith({
    List<Data>? data,
    String? success,
    String? message,
    String? serviceTime,
  }) =>
      GoaliePendingFeedbackModel(
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

/// user_id : "2"
/// phone_number : "4168073138"
/// firstname : "Admin"
/// lastname : "Rent A Goalie"
/// area_code : "l6c1a5"
/// email : "hockeyrentagoalie@gmail.com"
/// password : "R29hbGllMjRAQA=="
/// user_type : "1"
/// gender : ""
/// calibre : ""
/// birthday : ""
/// avaliable_to_play : ""
/// kilometers_to_travel : ""
/// profile_pic : "http://app.hockeyrentagoalie.com/web_services/upload/thumb/5cc8faa2593de.jpg"
/// level_of_game : ""
/// rent_a_goalie_experience : ""
/// rating : "5.0"
/// totalgame : "191"
/// unpaid_game : "5"
/// registered_on : "2019-05-01 01:44:21"
/// is_verify : "1"
/// device_type : "1"
/// device_token : "fb4MC7KlTVWxksRGVt8hCc:APA91bFZ-hgRb8LiL2Kms8NbNtBbW9XyvgI2r6fSIomKejVjaf1HanvjT5ML2K4gmTuXqmHuXowSsEMrj61eg9AadtbmqkGhRKvTmgx_nFtbedtyinBHdHybj1KGa4W68JebPtplN7ck"
/// ashl_register : "0"
/// is_active : "1"
/// 60_min_game : "50"
/// 90_min_game : "65"
/// 120_min_game : "75"
/// goalie_cut : "0"
/// is_delete : "0"
/// is_approve : "1"
/// user_latitude : "43.653225"
/// user_longitude : "-79.383183"
/// user_time_zone : "Asia/Calcutta"
/// device_version : "12|3.4|sdk_gphone64_x86_64|GMT 05:30"
/// schedule_id : "2299"
/// team_name : "Demo Game"
/// rink : "Toronto"as
/// format : "Game - 5 vs 5"
/// caliber : "A"
/// goalies : "1"
/// playoff : "1"
/// save_game : "0"
/// date : "2024-05-18"
/// time : "01:08 PM"
/// latitude : "43.653225"
/// longitude : "-79.383183333333"
/// game_duration : "60"
/// address : "Toronto, ON, Canada"
/// history_goalies : "0"
/// game_status : "completed"
/// total_time : "2024-05-18 14:08:00"
/// cur_time : "2024-05-20 11:36:45"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    String? userId,
    String? phoneNumber,
    String? firstname,
    String? lastname,
    String? areaCode,
    String? email,
    String? password,
    String? userType,
    String? gender,
    String? calibre,
    String? birthday,
    String? avaliableToPlay,
    String? kilometersToTravel,
    String? profilePic,
    String? levelOfGame,
    String? rentAGoalieExperience,
    String? rating,
    String? totalgame,
    String? unpaidGame,
    String? registeredOn,
    String? isVerify,
    String? deviceType,
    String? deviceToken,
    String? ashlRegister,
    String? isActive,
    String? MinGame60,
    String? MinGame90,
    String? MinGame120,
    String? goalieCut,
    String? isDelete,
    String? isApprove,
    String? userLatitude,
    String? userLongitude,
    String? userTimeZone,
    String? deviceVersion,
    String? scheduleId,
    String? teamName,
    String? rink,
    String? format,
    String? caliber,
    String? goalies,
    String? playoff,
    String? saveGame,
    String? date,
    String? time,
    String? latitude,
    String? longitude,
    String? gameDuration,
    String? address,
    String? historyGoalies,
    String? gameStatus,
    String? gameDatetime,
    String? totalTime,
    String? curTime,
  }) {
    _userId = userId;
    _phoneNumber = phoneNumber;
    _firstname = firstname;
    _lastname = lastname;
    _areaCode = areaCode;
    _email = email;
    _password = password;
    _userType = userType;
    _gender = gender;
    _calibre = calibre;
    _birthday = birthday;
    _avaliableToPlay = avaliableToPlay;
    _kilometersToTravel = kilometersToTravel;
    _profilePic = profilePic;
    _levelOfGame = levelOfGame;
    _rentAGoalieExperience = rentAGoalieExperience;
    _rating = rating;
    _totalgame = totalgame;
    _unpaidGame = unpaidGame;
    _registeredOn = registeredOn;
    _isVerify = isVerify;
    _deviceType = deviceType;
    _deviceToken = deviceToken;
    _ashlRegister = ashlRegister;
    _isActive = isActive;
    _MinGame60 = MinGame60;
    _MinGame90 = MinGame90;
    _MinGame120 = MinGame120;
    _goalieCut = goalieCut;
    _isDelete = isDelete;
    _isApprove = isApprove;
    _userLatitude = userLatitude;
    _userLongitude = userLongitude;
    _userTimeZone = userTimeZone;
    _deviceVersion = deviceVersion;
    _scheduleId = scheduleId;
    _teamName = teamName;
    _rink = rink;
    _format = format;
    _caliber = caliber;
    _goalies = goalies;
    _playoff = playoff;
    _saveGame = saveGame;
    _date = date;
    _time = time;
    _latitude = latitude;
    _longitude = longitude;
    _gameDuration = gameDuration;
    _address = address;
    _historyGoalies = historyGoalies;
    _gameStatus = gameStatus;
    _gameDatetime = gameDatetime;
    _totalTime = totalTime;
    _curTime = curTime;
  }

  Data.fromJson(dynamic json) {
    _userId = json['user_id'];
    _phoneNumber = json['phone_number'];
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    _areaCode = json['area_code'];
    _email = json['email'];
    _password = json['password'];
    _userType = json['user_type'];
    _gender = json['gender'];
    _calibre = json['calibre'];
    _birthday = json['birthday'];
    _avaliableToPlay = json['avaliable_to_play'];
    _kilometersToTravel = json['kilometers_to_travel'];
    _profilePic = json['profile_pic'];
    _levelOfGame = json['level_of_game'];
    _rentAGoalieExperience = json['rent_a_goalie_experience'];
    _rating = json['rating'];
    _totalgame = json['totalgame'];
    _unpaidGame = json['unpaid_game'];
    _registeredOn = json['registered_on'];
    _isVerify = json['is_verify'];
    _deviceType = json['device_type'];
    _deviceToken = json['device_token'];
    _ashlRegister = json['ashl_register'];
    _isActive = json['is_active'];
    _MinGame60 = json['60_min_game'];
    _MinGame90 = json['90_min_game'];
    _MinGame120 = json['120_min_game'];
    _goalieCut = json['goalie_cut'];
    _isDelete = json['is_delete'];
    _isApprove = json['is_approve'];
    _userLatitude = json['user_latitude'];
    _userLongitude = json['user_longitude'];
    _userTimeZone = json['user_time_zone'];
    _deviceVersion = json['device_version'];
    _scheduleId = json['schedule_id'];
    _teamName = json['team_name'];
    _rink = json['rink'];
    _format = json['format'];
    _caliber = json['caliber'];
    _goalies = json['goalies'];
    _playoff = json['playoff'];
    _saveGame = json['save_game'];
    _date = json['date'];
    _time = json['time'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _gameDuration = json['game_duration'];
    _address = json['address'];
    _historyGoalies = json['history_goalies'];
    _gameStatus = json['game_status'];
    _gameDatetime = json['game_datetime'];
    _totalTime = json['total_time'];
    _curTime = json['cur_time'];
  }
  String? _userId;
  String? _phoneNumber;
  String? _firstname;
  String? _lastname;
  String? _areaCode;
  String? _email;
  String? _password;
  String? _userType;
  String? _gender;
  String? _calibre;
  String? _birthday;
  String? _avaliableToPlay;
  String? _kilometersToTravel;
  String? _profilePic;
  String? _levelOfGame;
  String? _rentAGoalieExperience;
  String? _rating;
  String? _totalgame;
  String? _unpaidGame;
  String? _registeredOn;
  String? _isVerify;
  String? _deviceType;
  String? _deviceToken;
  String? _ashlRegister;
  String? _isActive;
  String? _MinGame60;
  String? _MinGame90;
  String? _MinGame120;
  String? _goalieCut;
  String? _isDelete;
  String? _isApprove;
  String? _userLatitude;
  String? _userLongitude;
  String? _userTimeZone;
  String? _deviceVersion;
  String? _scheduleId;
  String? _teamName;
  String? _rink;
  String? _format;
  String? _caliber;
  String? _goalies;
  String? _playoff;
  String? _saveGame;
  String? _date;
  String? _time;
  String? _latitude;
  String? _longitude;
  String? _gameDuration;
  String? _address;
  String? _historyGoalies;
  String? _gameStatus;
  String? _gameDatetime;
  String? _totalTime;
  String? _curTime;
  Data copyWith({
    String? userId,
    String? phoneNumber,
    String? firstname,
    String? lastname,
    String? areaCode,
    String? email,
    String? password,
    String? userType,
    String? gender,
    String? calibre,
    String? birthday,
    String? avaliableToPlay,
    String? kilometersToTravel,
    String? profilePic,
    String? levelOfGame,
    String? rentAGoalieExperience,
    String? rating,
    String? totalgame,
    String? unpaidGame,
    String? registeredOn,
    String? isVerify,
    String? deviceType,
    String? deviceToken,
    String? ashlRegister,
    String? isActive,
    String? MinGame60,
    String? MinGame90,
    String? MinGame120,
    String? goalieCut,
    String? isDelete,
    String? isApprove,
    String? userLatitude,
    String? userLongitude,
    String? userTimeZone,
    String? deviceVersion,
    String? scheduleId,
    String? teamName,
    String? rink,
    String? format,
    String? caliber,
    String? goalies,
    String? playoff,
    String? saveGame,
    String? date,
    String? time,
    String? latitude,
    String? longitude,
    String? gameDuration,
    String? address,
    String? historyGoalies,
    String? gameStatus,
    String? gameDatetime,
    String? totalTime,
    String? curTime,
  }) =>
      Data(
        userId: userId ?? _userId,
        phoneNumber: phoneNumber ?? _phoneNumber,
        firstname: firstname ?? _firstname,
        lastname: lastname ?? _lastname,
        areaCode: areaCode ?? _areaCode,
        email: email ?? _email,
        password: password ?? _password,
        userType: userType ?? _userType,
        gender: gender ?? _gender,
        calibre: calibre ?? _calibre,
        birthday: birthday ?? _birthday,
        avaliableToPlay: avaliableToPlay ?? _avaliableToPlay,
        kilometersToTravel: kilometersToTravel ?? _kilometersToTravel,
        profilePic: profilePic ?? _profilePic,
        levelOfGame: levelOfGame ?? _levelOfGame,
        rentAGoalieExperience: rentAGoalieExperience ?? _rentAGoalieExperience,
        rating: rating ?? _rating,
        totalgame: totalgame ?? _totalgame,
        unpaidGame: unpaidGame ?? _unpaidGame,
        registeredOn: registeredOn ?? _registeredOn,
        isVerify: isVerify ?? _isVerify,
        deviceType: deviceType ?? _deviceType,
        deviceToken: deviceToken ?? _deviceToken,
        ashlRegister: ashlRegister ?? _ashlRegister,
        isActive: isActive ?? _isActive,
        MinGame60: MinGame60 ?? _MinGame60,
        MinGame90: MinGame90 ?? _MinGame90,
        MinGame120: MinGame120 ?? _MinGame120,
        goalieCut: goalieCut ?? _goalieCut,
        isDelete: isDelete ?? _isDelete,
        isApprove: isApprove ?? _isApprove,
        userLatitude: userLatitude ?? _userLatitude,
        userLongitude: userLongitude ?? _userLongitude,
        userTimeZone: userTimeZone ?? _userTimeZone,
        deviceVersion: deviceVersion ?? _deviceVersion,
        scheduleId: scheduleId ?? _scheduleId,
        teamName: teamName ?? _teamName,
        rink: rink ?? _rink,
        format: format ?? _format,
        caliber: caliber ?? _caliber,
        goalies: goalies ?? _goalies,
        playoff: playoff ?? _playoff,
        saveGame: saveGame ?? _saveGame,
        date: date ?? _date,
        time: time ?? _time,
        latitude: latitude ?? _latitude,
        longitude: longitude ?? _longitude,
        gameDuration: gameDuration ?? _gameDuration,
        address: address ?? _address,
        historyGoalies: historyGoalies ?? _historyGoalies,
        gameStatus: gameStatus ?? _gameStatus,
        gameDatetime: gameDatetime ?? _gameDatetime,
        totalTime: totalTime ?? _totalTime,
        curTime: curTime ?? _curTime,
      );
  String? get userId => _userId;
  String? get phoneNumber => _phoneNumber;
  String? get firstname => _firstname;
  String? get lastname => _lastname;
  String? get areaCode => _areaCode;
  String? get email => _email;
  String? get password => _password;
  String? get userType => _userType;
  String? get gender => _gender;
  String? get calibre => _calibre;
  String? get birthday => _birthday;
  String? get avaliableToPlay => _avaliableToPlay;
  String? get kilometersToTravel => _kilometersToTravel;
  String? get profilePic => _profilePic;
  String? get levelOfGame => _levelOfGame;
  String? get rentAGoalieExperience => _rentAGoalieExperience;
  String? get rating => _rating;
  String? get totalgame => _totalgame;
  String? get unpaidGame => _unpaidGame;
  String? get registeredOn => _registeredOn;
  String? get isVerify => _isVerify;
  String? get deviceType => _deviceType;
  String? get deviceToken => _deviceToken;
  String? get ashlRegister => _ashlRegister;
  String? get isActive => _isActive;
  String? get MinGame60 => _MinGame60;
  String? get MinGame90 => _MinGame90;
  String? get MinGame120 => _MinGame120;
  String? get goalieCut => _goalieCut;
  String? get isDelete => _isDelete;
  String? get isApprove => _isApprove;
  String? get userLatitude => _userLatitude;
  String? get userLongitude => _userLongitude;
  String? get userTimeZone => _userTimeZone;
  String? get deviceVersion => _deviceVersion;
  String? get scheduleId => _scheduleId;
  String? get teamName => _teamName;
  String? get rink => _rink;
  String? get format => _format;
  String? get caliber => _caliber;
  String? get goalies => _goalies;
  String? get playoff => _playoff;
  String? get saveGame => _saveGame;
  String? get date => _date;
  String? get time => _time;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  String? get gameDuration => _gameDuration;
  String? get address => _address;
  String? get historyGoalies => _historyGoalies;
  String? get gameStatus => _gameStatus;
  String? get gameDatetime => _gameDatetime;
  String? get totalTime => _totalTime;
  String? get curTime => _curTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['phone_number'] = _phoneNumber;
    map['firstname'] = _firstname;
    map['lastname'] = _lastname;
    map['area_code'] = _areaCode;
    map['email'] = _email;
    map['password'] = _password;
    map['user_type'] = _userType;
    map['gender'] = _gender;
    map['calibre'] = _calibre;
    map['birthday'] = _birthday;
    map['avaliable_to_play'] = _avaliableToPlay;
    map['kilometers_to_travel'] = _kilometersToTravel;
    map['profile_pic'] = _profilePic;
    map['level_of_game'] = _levelOfGame;
    map['rent_a_goalie_experience'] = _rentAGoalieExperience;
    map['rating'] = _rating;
    map['totalgame'] = _totalgame;
    map['unpaid_game'] = _unpaidGame;
    map['registered_on'] = _registeredOn;
    map['is_verify'] = _isVerify;
    map['device_type'] = _deviceType;
    map['device_token'] = _deviceToken;
    map['ashl_register'] = _ashlRegister;
    map['is_active'] = _isActive;
    map['60_min_game'] = _MinGame60;
    map['90_min_game'] = _MinGame90;
    map['120_min_game'] = _MinGame120;
    map['goalie_cut'] = _goalieCut;
    map['is_delete'] = _isDelete;
    map['is_approve'] = _isApprove;
    map['user_latitude'] = _userLatitude;
    map['user_longitude'] = _userLongitude;
    map['user_time_zone'] = _userTimeZone;
    map['device_version'] = _deviceVersion;
    map['schedule_id'] = _scheduleId;
    map['team_name'] = _teamName;
    map['rink'] = _rink;
    map['format'] = _format;
    map['caliber'] = _caliber;
    map['goalies'] = _goalies;
    map['playoff'] = _playoff;
    map['save_game'] = _saveGame;
    map['date'] = _date;
    map['time'] = _time;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['game_duration'] = _gameDuration;
    map['address'] = _address;
    map['history_goalies'] = _historyGoalies;
    map['game_status'] = _gameStatus;
    map['game_datetime'] = _gameDatetime;
    map['total_time'] = _totalTime;
    map['cur_time'] = _curTime;
    return map;
  }
}
