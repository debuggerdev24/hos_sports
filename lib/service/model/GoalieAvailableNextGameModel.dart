import 'dart:convert';
/// schedule_id : "8"
/// team_name : "dev"
/// schedule_date : "2024-07-23"
/// schedule_datetime : "2024-07-23 18:20:00"
/// query : "\n\t\t\t\t    \t\t\tSELECT \n\t\t\t                        *,\n\t\t\t                        ROUND(( 3959 * ACOS( COS( RADIANS(43.653226) ) \n\t\t\t                        * COS( RADIANS( latitude ) ) \n\t\t\t                        * COS( RADIANS( longitude ) \n\t\t\t                        - RADIANS(-79.3831843) ) \n\t\t\t                        + SIN( RADIANS(43.653226) ) \n\t\t\t                        * SIN( RADIANS( latitude ) ) ) ),2) AS distance,\n\t\t\t                        CONVERT_TZ(DATE_ADD(game_datetime,INTERVAL game_duration MINUTE),'+00:00',digit_timezone)as total_time,\n\t\t\t                        -- (SELECT additional_game FROM tbl_interest_customer tic JOIN tbl_schedule ts on ts.schedule_id = tic.schedule_id WHERE tic.user_id = ic.user_id AND ts.game_datetime <= NOW() ORDER BY tic.added_on DESC LIMIT 0,1)as additional\n\t\t\t                        (SELECT additional_game FROM tbl_interest_customer tic JOIN tbl_schedule ts on ts.schedule_id = tic.schedule_id WHERE tic.user_id = ic.user_id AND tic.approval_status = 1 AND tic.is_delete = 0 AND tic.is_cancel = 0 AND ts.game_datetime <= NOW() ORDER BY tic.added_on DESC LIMIT 0,1)as additional\n\t\t\t                    FROM tbl_schedule s\n\t\t\t                    JOIN tbl_interest_customer ic ON ic.schedule_id = s.schedule_id\n\t\t\t                    WHERE\n\t\t\t                        ic.additional_game = 1\n\t\t\t                        AND (s.game_datetime between '2024-07-23 00:00:00' and '2024-07-23 23:59:59')\n\t\t\t                        AND ic.check_in = 1\n\t\t\t                        AND s.reposted = 0\n\t\t\t                        AND s.is_cancel = 0\n\t\t\t                        AND ic.user_id NOT IN (\n\t\t\t                        \tSELECT icc.user_id \n\t\t\t                        \tFROM tbl_schedule ss\n\t\t\t                        \tJOIN tbl_interest_customer icc ON icc.schedule_id = ss.schedule_id \n\t\t\t                        \tWHERE ss.user_id = '2' \n\t\t\t                        \tAND DATE_ADD(ss.game_datetime,INTERVAL ss.game_duration MINUTE) > '2024-07-23 18:20:00'\n\t\t\t                        \tAND ss.reposted = 0 \n\t\t\t                        \tAND ss.is_delete = 0 \n\t\t\t                        \tAND ss.goalies = (\n\t\t\t                        \t\tSELECT COUNT(*) \n\t\t\t            \t\t\t\t\tFROM tbl_interest_customer ic2 \n\t\t\t            \t\t\t\t\tWHERE ic2.schedule_id = ss.schedule_id \n\t\t\t            \t\t\t\t\tAND ic2.approval_status=1 \n\t\t\t            \t\t\t\t\tAND ic2.is_cancel = 0)\n\t\t\t                        \t)\n\t\t\t                    HAVING\n\t\t\t                        distance <= 0.124274\n\t\t\t                        AND total_time < '2024-07-23 18:20:00'\n\t\t\t                        AND additional != 0\n\t\t\t\t\t    \t\t"
/// success : "1"
/// data : [{"user_id":"3","phone_number":"4166272100","firstname":"abc","lastname":"abc","area_code":"L0G","email":"hossports@gmail.com","password":"R29hbGllMjRAQA==","user_type":"2","gender":"Male","calibre":"A","birthday":"2024-07-01","avaliable_to_play":"5 vs 5,3 vs 3,Co-Ed","kilometers_to_travel":"50","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/5da7b652a906f.png","level_of_game":"A","rent_a_goalie_experience":"1","rating":"0.0","totalgame":"1","unpaid_game":"0","registered_on":"2019-05-01 02:17:18","is_verify":"1","device_type":"0","device_token":"c-DNRaAtQO-iyYcElKotQh:APA91bEw76exglAV61AwW_4RLneNPQ58xAXTOqKliD7oPjJvR9sk0f47Kyi8OYMfHUIzyGMELtfqxPg8wC17uEdJsySsocXHpqpgHhIV_U8KM2Cg0vxdIwNsOO7Nk4lkEJe9dtU1BdUS","ashl_register":"1","is_active":"1","60_min_game":"0","90_min_game":"0","120_min_game":"0","goalie_cut":"15","is_delete":"0","is_approve":"1","user_latitude":"43.653225","user_longitude":"-79.383183","user_time_zone":"America/Toronto","device_version":"","feedback":"Feedback not found."}]
/// message : "additional game player list"
/// game_details : {"schedule_id":"8","user_id":"2","team_name":"dev","rink":"Toronto","address":"Toronto, ON, Canada","gender":"Male","format":"5 vs 5","caliber":"A","goalies":"1","playoff":"0","save_game":"0","latitude":"43.653226","longitude":"-79.3831843","game_payment":"50","date":"2024-07-23","time":"6:20 PM","game_datetime":"2024-07-23 18:20:00","time_zone":"America/Toronto","digit_timezone":"00:00","short_time_zone":"GMT","game_duration":"60","instruction":"dev","remainder":"0","place_id":"ChIJpTvG15DL1IkRd8S0KlBVNTI","register_on":"2024-07-23 11:52:08","is_delete":"0","is_favorite":"1","is_cancel":"0","reposted":"0","cancel_goalie_id":"0","parent_schedule_id":"-1","user_time_zone":"America/Toronto","total_time":"2024-07-23 19:20:00","cur_time":"2024-07-23 12:32:39"}
/// service_time : "0.0052089691162109 seconds"

GoalieAvailableNextGameModel goalieAvailableNextGameModelFromJson(String str) => GoalieAvailableNextGameModel.fromJson(json.decode(str));
String goalieAvailableNextGameModelToJson(GoalieAvailableNextGameModel data) => json.encode(data.toJson());
class GoalieAvailableNextGameModel {
  GoalieAvailableNextGameModel({
      String? scheduleId, 
      String? teamName, 
      String? scheduleDate, 
      String? scheduleDatetime, 
      String? query, 
      String? success, 
      List<Data>? data, 
      String? message, 
      GameDetails? gameDetails, 
      String? serviceTime,}){
    _scheduleId = scheduleId;
    _teamName = teamName;
    _scheduleDate = scheduleDate;
    _scheduleDatetime = scheduleDatetime;
    _query = query;
    _success = success;
    _data = data;
    _message = message;
    _gameDetails = gameDetails;
    _serviceTime = serviceTime;
}

  GoalieAvailableNextGameModel.fromJson(dynamic json) {
    _scheduleId = json['schedule_id'];
    _teamName = json['team_name'];
    _scheduleDate = json['schedule_date'];
    _scheduleDatetime = json['schedule_datetime'];
    _query = json['query'];
    _success = json['success'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _message = json['message'];
    _gameDetails = json['game_details'] != null ? GameDetails.fromJson(json['game_details']) : null;
    _serviceTime = json['service_time'];
  }
  String? _scheduleId;
  String? _teamName;
  String? _scheduleDate;
  String? _scheduleDatetime;
  String? _query;
  String? _success;
  List<Data>? _data;
  String? _message;
  GameDetails? _gameDetails;
  String? _serviceTime;
GoalieAvailableNextGameModel copyWith({  String? scheduleId,
  String? teamName,
  String? scheduleDate,
  String? scheduleDatetime,
  String? query,
  String? success,
  List<Data>? data,
  String? message,
  GameDetails? gameDetails,
  String? serviceTime,
}) => GoalieAvailableNextGameModel(  scheduleId: scheduleId ?? _scheduleId,
  teamName: teamName ?? _teamName,
  scheduleDate: scheduleDate ?? _scheduleDate,
  scheduleDatetime: scheduleDatetime ?? _scheduleDatetime,
  query: query ?? _query,
  success: success ?? _success,
  data: data ?? _data,
  message: message ?? _message,
  gameDetails: gameDetails ?? _gameDetails,
  serviceTime: serviceTime ?? _serviceTime,
);
  String? get scheduleId => _scheduleId;
  String? get teamName => _teamName;
  String? get scheduleDate => _scheduleDate;
  String? get scheduleDatetime => _scheduleDatetime;
  String? get query => _query;
  String? get success => _success;
  List<Data>? get data => _data;
  String? get message => _message;
  GameDetails? get gameDetails => _gameDetails;
  String? get serviceTime => _serviceTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['schedule_id'] = _scheduleId;
    map['team_name'] = _teamName;
    map['schedule_date'] = _scheduleDate;
    map['schedule_datetime'] = _scheduleDatetime;
    map['query'] = _query;
    map['success'] = _success;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['message'] = _message;
    if (_gameDetails != null) {
      map['game_details'] = _gameDetails?.toJson();
    }
    map['service_time'] = _serviceTime;
    return map;
  }

}

/// schedule_id : "8"
/// user_id : "2"
/// team_name : "dev"
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
/// date : "2024-07-23"
/// time : "6:20 PM"
/// game_datetime : "2024-07-23 18:20:00"
/// time_zone : "America/Toronto"
/// digit_timezone : "00:00"
/// short_time_zone : "GMT"
/// game_duration : "60"
/// instruction : "dev"
/// remainder : "0"
/// place_id : "ChIJpTvG15DL1IkRd8S0KlBVNTI"
/// register_on : "2024-07-23 11:52:08"
/// is_delete : "0"
/// is_favorite : "1"
/// is_cancel : "0"
/// reposted : "0"
/// cancel_goalie_id : "0"
/// parent_schedule_id : "-1"
/// user_time_zone : "America/Toronto"
/// total_time : "2024-07-23 19:20:00"
/// cur_time : "2024-07-23 12:32:39"

GameDetails gameDetailsFromJson(String str) => GameDetails.fromJson(json.decode(str));
String gameDetailsToJson(GameDetails data) => json.encode(data.toJson());
class GameDetails {
  GameDetails({
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
      String? curTime,}){
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
}

  GameDetails.fromJson(dynamic json) {
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
GameDetails copyWith({  String? scheduleId,
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
}) => GameDetails(  scheduleId: scheduleId ?? _scheduleId,
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
    return map;
  }

}

/// user_id : "3"
/// phone_number : "4166272100"
/// firstname : "abc"
/// lastname : "abc"
/// area_code : "L0G"
/// email : "hossports@gmail.com"
/// password : "R29hbGllMjRAQA=="
/// user_type : "2"
/// gender : "Male"
/// calibre : "A"
/// birthday : "2024-07-01"
/// avaliable_to_play : "5 vs 5,3 vs 3,Co-Ed"
/// kilometers_to_travel : "50"
/// profile_pic : "http://app.hockeyrentagoalie.com/web_services/upload/thumb/5da7b652a906f.png"
/// level_of_game : "A"
/// rent_a_goalie_experience : "1"
/// rating : "0.0"
/// totalgame : "1"
/// unpaid_game : "0"
/// registered_on : "2019-05-01 02:17:18"
/// is_verify : "1"
/// device_type : "0"
/// device_token : "c-DNRaAtQO-iyYcElKotQh:APA91bEw76exglAV61AwW_4RLneNPQ58xAXTOqKliD7oPjJvR9sk0f47Kyi8OYMfHUIzyGMELtfqxPg8wC17uEdJsySsocXHpqpgHhIV_U8KM2Cg0vxdIwNsOO7Nk4lkEJe9dtU1BdUS"
/// ashl_register : "1"
/// is_active : "1"
/// 60_min_game : "0"
/// 90_min_game : "0"
/// 120_min_game : "0"
/// goalie_cut : "15"
/// is_delete : "0"
/// is_approve : "1"
/// user_latitude : "43.653225"
/// user_longitude : "-79.383183"
/// user_time_zone : "America/Toronto"
/// device_version : ""
/// feedback : "Feedback not found."

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
      String? feedback,}){
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
    _feedback = feedback;
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
    _feedback = json['feedback'];
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
  String? _feedback;
Data copyWith({  String? userId,
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
  String? feedback,
}) => Data(  userId: userId ?? _userId,
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
  feedback: feedback ?? _feedback,
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
  String? get feedback => _feedback;

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
    map['feedback'] = _feedback;
    return map;
  }

}