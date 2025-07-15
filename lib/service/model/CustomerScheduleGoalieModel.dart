import 'dart:convert';

/// data : [{"schedule_id":"2342","user_id":"2","team_name":"Team 1","rink":"Toronto","address":"Toronto, ON, Canada","gender":"Male","format":"5 vs 5","caliber":"A","goalies":"1","playoff":"0","save_game":"0","latitude":"43.653226","longitude":"-79.3831843","game_payment":"50","date":"2024-05-28","time":"12:00 PM","game_datetime":"2024-05-28 12:00:00","time_zone":"Atlantic/Reykjavik","digit_timezone":"00:00","short_time_zone":"GMT","game_duration":"60","instruction":"No Special","remainder":"0","place_id":"ChIJpTvG15DL1IkRd8S0KlBVNTI","register_on":"2024-05-27 04:35:13","is_delete":"0","is_favorite":"1","is_cancel":"0","reposted":"0","cancel_goalie_id":"0","parent_schedule_id":"-1","user_time_zone":"America/Toronto","select_goalies":"1","total_time":"2024-05-28 13:00:00","cur_time":"2024-05-28 07:01:34","selected_goalie":{"cust_interest_id":"995","schedule_id":"2342","customer_id":"2","user_id":"3","approval_status":"1","play_game":"0","check_in":"0","additional_game":"0","select_goalie_cut":"15","added_on":"2024-05-27 04:38:43","is_cancel":"0","is_delete":"0","phone_number":"4166272100","firstname":"Ryan","lastname":"Hosford","area_code":"L6c1a5","email":"hossports@gmail.com","password":"R29hbGllMjRAQA==","user_type":"2","gender":"Male","calibre":"C","birthday":"1975-09-05","avaliable_to_play":"5 vs 5,3 vs 3,Co-Ed","kilometers_to_travel":"100","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/5d83b90a95e74.jpg","level_of_game":"AA","rent_a_goalie_experience":"1","rating":"5.0","totalgame":"1","unpaid_game":"5","registered_on":"2019-05-01 02:17:18","is_verify":"1","device_type":"0","device_token":"","ashl_register":"1","is_active":"1","60_min_game":"50","90_min_game":"65","120_min_game":"75","goalie_cut":"15","is_approve":"1","user_latitude":"43.653225","user_longitude":"-79.383183","user_time_zone":"","device_version":"","feedback":"Most flexible goalie I’ve ever encountered|Ryan stepped up to fill a vacancy. Thx Ryan. |Nice win after being under siege in the late third. |Tough OT lose, but great battle to get us into the overage|Stellar shutout performance|Another outstanding performance |Awesome, great compete level|Amazing, got us the win with a short bench|Playoff ringer, enough said!|Available on super short notice. Thanks!|Awesome tendy and nice guy"}}]
/// success : "1"
/// message : "Customer selected interested goalies list"
/// service_time : "0.01310396194458 seconds"

CustomerScheduleGoalieModel customerScheduleGoalieModelFromJson(String str) =>
    CustomerScheduleGoalieModel.fromJson(json.decode(str));
String customerScheduleGoalieModelToJson(CustomerScheduleGoalieModel data) =>
    json.encode(data.toJson());

class CustomerScheduleGoalieModel {
  CustomerScheduleGoalieModel({
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

  CustomerScheduleGoalieModel.fromJson(dynamic json) {
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
  CustomerScheduleGoalieModel copyWith({
    List<Data>? data,
    String? success,
    String? message,
    String? serviceTime,
  }) =>
      CustomerScheduleGoalieModel(
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

/// schedule_id : "2342"
/// user_id : "2"
/// team_name : "Team 1"
/// rink : "Toronto"
/// address : "Toronto, ON, Canada"
/// gender : "Male"
/// format : "5 vs 5"
/// caliber : "A"
/// goalies : "1"
/// playoff : "0"
/// save_game : "0"
/// latitude : "43.653226"
/// longitude : "-79.3831843"
/// game_payment : "50"
/// date : "2024-05-28"
/// time : "12:00 PM"
/// game_datetime : "2024-05-28 12:00:00"
/// time_zone : "Atlantic/Reykjavik"
/// digit_timezone : "00:00"
/// short_time_zone : "GMT"
/// game_duration : "60"
/// instruction : "No Special"
/// remainder : "0"
/// place_id : "ChIJpTvG15DL1IkRd8S0KlBVNTI"
/// register_on : "2024-05-27 04:35:13"
/// is_delete : "0"
/// is_favorite : "1"
/// is_cancel : "0"
/// reposted : "0"
/// cancel_goalie_id : "0"
/// parent_schedule_id : "-1"
/// user_time_zone : "America/Toronto"
/// select_goalies : "1"
/// total_time : "2024-05-28 13:00:00"
/// cur_time : "2024-05-28 07:01:34"
/// selected_goalie : {"cust_interest_id":"995","schedule_id":"2342","customer_id":"2","user_id":"3","approval_status":"1","play_game":"0","check_in":"0","additional_game":"0","select_goalie_cut":"15","added_on":"2024-05-27 04:38:43","is_cancel":"0","is_delete":"0","phone_number":"4166272100","firstname":"Ryan","lastname":"Hosford","area_code":"L6c1a5","email":"hossports@gmail.com","password":"R29hbGllMjRAQA==","user_type":"2","gender":"Male","calibre":"C","birthday":"1975-09-05","avaliable_to_play":"5 vs 5,3 vs 3,Co-Ed","kilometers_to_travel":"100","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/5d83b90a95e74.jpg","level_of_game":"AA","rent_a_goalie_experience":"1","rating":"5.0","totalgame":"1","unpaid_game":"5","registered_on":"2019-05-01 02:17:18","is_verify":"1","device_type":"0","device_token":"","ashl_register":"1","is_active":"1","60_min_game":"50","90_min_game":"65","120_min_game":"75","goalie_cut":"15","is_approve":"1","user_latitude":"43.653225","user_longitude":"-79.383183","user_time_zone":"","device_version":"","feedback":"Most flexible goalie I’ve ever encountered|Ryan stepped up to fill a vacancy. Thx Ryan. |Nice win after being under siege in the late third. |Tough OT lose, but great battle to get us into the overage|Stellar shutout performance|Another outstanding performance |Awesome, great compete level|Amazing, got us the win with a short bench|Playoff ringer, enough said!|Available on super short notice. Thanks!|Awesome tendy and nice guy"}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    String? scheduleId,
    String? userId,
    String? customerId,
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
    String? selectGoalies,
    String? totalTime,
    String? curTime,
    SelectedGoalie? selectedGoalie,
  }) {
    _scheduleId = scheduleId;
    _userId = userId;
    _customerId = customerId;
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
    _selectGoalies = selectGoalies;
    _totalTime = totalTime;
    _curTime = curTime;
    _selectedGoalie = selectedGoalie;
  }

  Data.fromJson(dynamic json) {
    _scheduleId = json['schedule_id'];
    _userId = json['user_id'];
    _customerId = json['customer_id'];
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
    _selectGoalies = json['select_goalies'];
    _totalTime = json['total_time'];
    _curTime = json['cur_time'];
    _selectedGoalie = json['selected_goalie'] != null
        ? SelectedGoalie.fromJson(json['selected_goalie'])
        : null;
  }
  String? _scheduleId;
  String? _userId;
  String? _customerId;
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
  String? _selectGoalies;
  String? _totalTime;
  String? _curTime;
  SelectedGoalie? _selectedGoalie;
  Data copyWith({
    String? scheduleId,
    String? userId,
    String? customerId,
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
    String? selectGoalies,
    String? totalTime,
    String? curTime,
    SelectedGoalie? selectedGoalie,
  }) =>
      Data(
        scheduleId: scheduleId ?? _scheduleId,
        userId: userId ?? _userId,
        customerId: customerId ?? _customerId,
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
        selectGoalies: selectGoalies ?? _selectGoalies,
        totalTime: totalTime ?? _totalTime,
        curTime: curTime ?? _curTime,
        selectedGoalie: selectedGoalie ?? _selectedGoalie,
      );
  String? get scheduleId => _scheduleId;
  String? get userId => _userId;
  String? get customerId => _customerId;
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
  String? get selectGoalies => _selectGoalies;
  String? get totalTime => _totalTime;
  String? get curTime => _curTime;
  SelectedGoalie? get selectedGoalie => _selectedGoalie;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['schedule_id'] = _scheduleId;
    map['user_id'] = _userId;
    map['customer_id'] = _customerId;
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
    map['select_goalies'] = _selectGoalies;
    map['total_time'] = _totalTime;
    map['cur_time'] = _curTime;
    if (_selectedGoalie != null) {
      map['selected_goalie'] = _selectedGoalie?.toJson();
    }
    return map;
  }
}

/// cust_interest_id : "995"
/// schedule_id : "2342"
/// customer_id : "2"
/// user_id : "3"
/// approval_status : "1"
/// play_game : "0"
/// check_in : "0"
/// additional_game : "0"
/// select_goalie_cut : "15"
/// added_on : "2024-05-27 04:38:43"
/// is_cancel : "0"
/// is_delete : "0"
/// phone_number : "4166272100"
/// firstname : "Ryan"
/// lastname : "Hosford"
/// area_code : "L6c1a5"
/// email : "hossports@gmail.com"
/// password : "R29hbGllMjRAQA=="
/// user_type : "2"
/// gender : "Male"
/// calibre : "C"
/// birthday : "1975-09-05"
/// avaliable_to_play : "5 vs 5,3 vs 3,Co-Ed"
/// kilometers_to_travel : "100"
/// profile_pic : "http://app.hockeyrentagoalie.com/web_services/upload/thumb/5d83b90a95e74.jpg"
/// level_of_game : "AA"
/// rent_a_goalie_experience : "1"
/// rating : "5.0"
/// totalgame : "1"
/// unpaid_game : "5"
/// registered_on : "2019-05-01 02:17:18"
/// is_verify : "1"
/// device_type : "0"
/// device_token : ""
/// ashl_register : "1"
/// is_active : "1"
/// 60_min_game : "50"
/// 90_min_game : "65"
/// 120_min_game : "75"
/// goalie_cut : "15"
/// is_approve : "1"
/// user_latitude : "43.653225"
/// user_longitude : "-79.383183"
/// user_time_zone : ""
/// device_version : ""
/// feedback : "Most flexible goalie I’ve ever encountered|Ryan stepped up to fill a vacancy. Thx Ryan. |Nice win after being under siege in the late third. |Tough OT lose, but great battle to get us into the overage|Stellar shutout performance|Another outstanding performance |Awesome, great compete level|Amazing, got us the win with a short bench|Playoff ringer, enough said!|Available on super short notice. Thanks!|Awesome tendy and nice guy"

SelectedGoalie selectedGoalieFromJson(String str) =>
    SelectedGoalie.fromJson(json.decode(str));
String selectedGoalieToJson(SelectedGoalie data) => json.encode(data.toJson());

class SelectedGoalie {
  SelectedGoalie({
    String? custInterestId,
    String? scheduleId,
    String? customerId,
    String? userId,
    String? approvalStatus,
    String? playGame,
    String? checkIn,
    String? additionalGame,
    String? selectGoalieCut,
    String? addedOn,
    String? isCancel,
    String? isDelete,
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
    String? isApprove,
    String? userLatitude,
    String? userLongitude,
    String? userTimeZone,
    String? deviceVersion,
    String? feedback,
  }) {
    _custInterestId = custInterestId;
    _scheduleId = scheduleId;
    _customerId = customerId;
    _userId = userId;
    _approvalStatus = approvalStatus;
    _playGame = playGame;
    _checkIn = checkIn;
    _additionalGame = additionalGame;
    _selectGoalieCut = selectGoalieCut;
    _addedOn = addedOn;
    _isCancel = isCancel;
    _isDelete = isDelete;
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
    _isApprove = isApprove;
    _userLatitude = userLatitude;
    _userLongitude = userLongitude;
    _userTimeZone = userTimeZone;
    _deviceVersion = deviceVersion;
    _feedback = feedback;
  }

  SelectedGoalie.fromJson(dynamic json) {
    _custInterestId = json['cust_interest_id'];
    _scheduleId = json['schedule_id'];
    _customerId = json['customer_id'];
    _userId = json['user_id'];
    _approvalStatus = json['approval_status'];
    _playGame = json['play_game'];
    _checkIn = json['check_in'];
    _additionalGame = json['additional_game'];
    _selectGoalieCut = json['select_goalie_cut'];
    _addedOn = json['added_on'];
    _isCancel = json['is_cancel'];
    _isDelete = json['is_delete'];
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
    _isApprove = json['is_approve'];
    _userLatitude = json['user_latitude'];
    _userLongitude = json['user_longitude'];
    _userTimeZone = json['user_time_zone'];
    _deviceVersion = json['device_version'];
    _feedback = json['feedback'];
  }
  String? _custInterestId;
  String? _scheduleId;
  String? _customerId;
  String? _userId;
  String? _approvalStatus;
  String? _playGame;
  String? _checkIn;
  String? _additionalGame;
  String? _selectGoalieCut;
  String? _addedOn;
  String? _isCancel;
  String? _isDelete;
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
  String? _isApprove;
  String? _userLatitude;
  String? _userLongitude;
  String? _userTimeZone;
  String? _deviceVersion;
  String? _feedback;
  SelectedGoalie copyWith({
    String? custInterestId,
    String? scheduleId,
    String? customerId,
    String? userId,
    String? approvalStatus,
    String? playGame,
    String? checkIn,
    String? additionalGame,
    String? selectGoalieCut,
    String? addedOn,
    String? isCancel,
    String? isDelete,
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
    String? isApprove,
    String? userLatitude,
    String? userLongitude,
    String? userTimeZone,
    String? deviceVersion,
    String? feedback,
  }) =>
      SelectedGoalie(
        custInterestId: custInterestId ?? _custInterestId,
        scheduleId: scheduleId ?? _scheduleId,
        customerId: customerId ?? _customerId,
        userId: userId ?? _userId,
        approvalStatus: approvalStatus ?? _approvalStatus,
        playGame: playGame ?? _playGame,
        checkIn: checkIn ?? _checkIn,
        additionalGame: additionalGame ?? _additionalGame,
        selectGoalieCut: selectGoalieCut ?? _selectGoalieCut,
        addedOn: addedOn ?? _addedOn,
        isCancel: isCancel ?? _isCancel,
        isDelete: isDelete ?? _isDelete,
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
        isApprove: isApprove ?? _isApprove,
        userLatitude: userLatitude ?? _userLatitude,
        userLongitude: userLongitude ?? _userLongitude,
        userTimeZone: userTimeZone ?? _userTimeZone,
        deviceVersion: deviceVersion ?? _deviceVersion,
        feedback: feedback ?? _feedback,
      );
  String? get custInterestId => _custInterestId;
  String? get scheduleId => _scheduleId;
  String? get customerId => _customerId;
  String? get userId => _userId;
  String? get approvalStatus => _approvalStatus;
  String? get playGame => _playGame;
  String? get checkIn => _checkIn;
  String? get additionalGame => _additionalGame;
  String? get selectGoalieCut => _selectGoalieCut;
  String? get addedOn => _addedOn;
  String? get isCancel => _isCancel;
  String? get isDelete => _isDelete;
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
  String? get isApprove => _isApprove;
  String? get userLatitude => _userLatitude;
  String? get userLongitude => _userLongitude;
  String? get userTimeZone => _userTimeZone;
  String? get deviceVersion => _deviceVersion;
  String? get feedback => _feedback;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cust_interest_id'] = _custInterestId;
    map['schedule_id'] = _scheduleId;
    map['customer_id'] = _customerId;
    map['user_id'] = _userId;
    map['approval_status'] = _approvalStatus;
    map['play_game'] = _playGame;
    map['check_in'] = _checkIn;
    map['additional_game'] = _additionalGame;
    map['select_goalie_cut'] = _selectGoalieCut;
    map['added_on'] = _addedOn;
    map['is_cancel'] = _isCancel;
    map['is_delete'] = _isDelete;
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
    map['is_approve'] = _isApprove;
    map['user_latitude'] = _userLatitude;
    map['user_longitude'] = _userLongitude;
    map['user_time_zone'] = _userTimeZone;
    map['device_version'] = _deviceVersion;
    map['feedback'] = _feedback;
    return map;
  }
}
