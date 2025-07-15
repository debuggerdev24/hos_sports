import 'dart:convert';

/// data : [{"schedule_id":"2236","user_id":"182","team_name":"Bolts","rink":"Canlan Sports","address":"Canlan Sports, Dynamic Drive, Scarborough, ON, Canada","gender":"Male","format":"Game - 5 vs 5","caliber":"E","goalies":"1","playoff":"1","save_game":"0","latitude":"43.8291323","longitude":"-79.2516358","game_payment":"50","date":"2024-03-13","time":"09:30 PM","game_datetime":"2024-03-13 21:30:00","time_zone":"Atlantic/Reykjavik","digit_timezone":"00:00","short_time_zone":"GMT","game_duration":"60","instruction":"","remainder":"0","place_id":"ChIJ6827TtrW1IkRrEeePYzWg_w","register_on":"2024-03-13 17:26:14","is_delete":"0","is_favorite":"1","is_cancel":"0","reposted":"0","cancel_goalie_id":"0","parent_schedule_id":"-1","user_time_zone":"America/Toronto","amount":"15","firstname":"George","lastname":"Kostoulias","goalie_cut":"15"},{"schedule_id":"2222","user_id":"529","team_name":"The Horde","rink":"159 Dynamic Dr","address":"159 Dynamic Dr, Scarborough, ON M1V 5L8, Canada","gender":"No Preference","format":"Game - 5 vs 5","caliber":"D","goalies":"1","playoff":"1","save_game":"0","latitude":"43.829124","longitude":"-79.251634","game_payment":"50","date":"2024-03-11","time":"07:15 PM","game_datetime":"2024-03-11 19:15:00","time_zone":"Atlantic/Reykjavik","digit_timezone":"00:00","short_time_zone":"GMT","game_duration":"60","instruction":"Goalie can be either D or C. I need a confirmation text 647-390-7503 ","remainder":"0","place_id":"ChIJL5hMztvW1IkR0loF-Z8X9x4","register_on":"2024-03-11 18:20:19","is_delete":"0","is_favorite":"1","is_cancel":"0","reposted":"0","cancel_goalie_id":"0","parent_schedule_id":"-1","user_time_zone":"America/Toronto","amount":"15","firstname":"Todd","lastname":"Boyd","goalie_cut":"15"},{"schedule_id":"2182","user_id":"431","team_name":"Ice Holes","rink":"159 Dynamic Dr","address":"159 Dynamic Dr, Scarborough, ON M1V 5L8, Canada","gender":"No Preference","format":"Game - 5 vs 5","caliber":"D","goalies":"1","playoff":"0","save_game":"0","latitude":"43.829154588468","longitude":"-79.251640811563","game_payment":"50","date":"2024-02-18","time":"09:15 PM","game_datetime":"2024-02-18 21:15:00","time_zone":"Atlantic/Reykjavik","digit_timezone":"00:00","short_time_zone":"GMT","game_duration":"60","instruction":"","remainder":"0","place_id":"ChIJL5hMztvW1IkR0loF-Z8X9x4","register_on":"2024-02-18 15:53:43","is_delete":"0","is_favorite":"1","is_cancel":"0","reposted":"0","cancel_goalie_id":"0","parent_schedule_id":"-1","user_time_zone":"America/Toronto","amount":"15","firstname":"Alex","lastname":"Lamanna","goalie_cut":"15"},{"schedule_id":"1806","user_id":"327","team_name":"brew street","rink":"Canlan Sports","address":"Canlan Sports, Dynamic Drive, Scarborough, ON, Canada","gender":"Male","format":"Game - 5 vs 5","caliber":"E","goalies":"1","playoff":"0","save_game":"0","latitude":"44.0630541","longitude":"-79.4411499","game_payment":"50","date":"2023-09-29","time":"09:15 PM","game_datetime":"2023-09-29 21:15:00","time_zone":"Atlantic/Reykjavik","digit_timezone":"00:00","short_time_zone":"GMT","game_duration":"60","instruction":"","remainder":"0","place_id":"ChIJ6827TtrW1IkRrEeePYzWg_w","register_on":"2023-09-28 21:05:58","is_delete":"0","is_favorite":"1","is_cancel":"0","reposted":"0","cancel_goalie_id":"0","parent_schedule_id":"-1","user_time_zone":"America/Toronto","amount":"15","firstname":"david","lastname":"thompson","goalie_cut":"15"},{"schedule_id":"1781","user_id":"411","team_name":"Knights","rink":"Canlan Sports","address":"159 Dynamic Dr, Scarborough, ON M1V 5L8, Canada","gender":"Male","format":"Game - 5 vs 5","caliber":"D","goalies":"1","playoff":"1","save_game":"0","latitude":"43.829132","longitude":"-79.251633","game_payment":"50","date":"2023-08-24","time":"07:30 PM","game_datetime":"2023-08-24 19:30:00","time_zone":"Atlantic/Reykjavik","digit_timezone":"00:00","short_time_zone":"GMT","game_duration":"60","instruction":"","remainder":"0","place_id":"ChIJ6827TtrW1IkRrEeePYzWg_w","register_on":"2023-08-24 20:27:47","is_delete":"0","is_favorite":"1","is_cancel":"0","reposted":"0","cancel_goalie_id":"0","parent_schedule_id":"-1","user_time_zone":"America/Toronto","amount":"15","firstname":"Alexander","lastname":"bond","goalie_cut":"15"},{"schedule_id":"1709","user_id":"411","team_name":"Knights","rink":"Canlan Sports","address":"159 Dynamic Dr, Scarborough, ON M1V 5L8, Canada","gender":"Male","format":"Game - 5 vs 5","caliber":"D","goalies":"1","playoff":"0","save_game":"0","latitude":"43.829132","longitude":"-79.251633","game_payment":"50","date":"2023-06-29","time":"10:30 PM","game_datetime":"2023-06-29 22:30:00","time_zone":"Atlantic/Reykjavik","digit_timezone":"00:00","short_time_zone":"GMT","game_duration":"60","instruction":"","remainder":"0","place_id":"ChIJ6827TtrW1IkRrEeePYzWg_w","register_on":"2023-06-29 13:07:55","is_delete":"0","is_favorite":"1","is_cancel":"0","reposted":"0","cancel_goalie_id":"0","parent_schedule_id":"-1","user_time_zone":"America/Toronto","amount":"0","firstname":"Alexander","lastname":"bond","goalie_cut":"15"},{"schedule_id":"1633","user_id":"284","team_name":"Mustards","rink":"Stouffville Clippers Sorts Complex","address":"120 Weldon Rd, Whitchurch-Stouffville, ON L4A 1N2, Canada","gender":"Male","format":"Game - 5 vs 5","caliber":"C","goalies":"1","playoff":"0","save_game":"0","latitude":"43.96492","longitude":"-79.261856","game_payment":"50","date":"2023-05-24","time":"07:00 PM","game_datetime":"2023-05-24 19:00:00","time_zone":"Atlantic/Reykjavik","digit_timezone":"00:00","short_time_zone":"GMT","game_duration":"60","instruction":"","remainder":"0","place_id":"ChIJYcqpJdUp1YkRcYi19OtLuXo","register_on":"2023-05-24 01:56:01","is_delete":"0","is_favorite":"1","is_cancel":"0","reposted":"0","cancel_goalie_id":"0","parent_schedule_id":"-1","user_time_zone":"America/Toronto","amount":"15","firstname":"Doug","lastname":"Knight","goalie_cut":"15"},{"schedule_id":"1500","user_id":"182","team_name":"Bolts","rink":"Canlan Sports","address":"Canlan Sports, Dynamic Drive, Scarborough, ON, Canada","gender":"Male","format":"Game - 5 vs 5","caliber":"D","goalies":"1","playoff":"1","save_game":"0","latitude":"43.8291323","longitude":"-79.2516358","game_payment":"50","date":"2023-03-16","time":"01:00 AM","game_datetime":"2023-03-16 01:00:00","time_zone":"America/Toronto","digit_timezone":"-04:00","short_time_zone":"EST","game_duration":"60","instruction":"","remainder":"0","place_id":"ChIJ6827TtrW1IkRrEeePYzWg_w","register_on":"2023-03-14 23:54:20","is_delete":"0","is_favorite":"1","is_cancel":"0","reposted":"0","cancel_goalie_id":"0","parent_schedule_id":"-1","user_time_zone":"","amount":"15","firstname":"George","lastname":"Kostoulias","goalie_cut":"15"},{"schedule_id":"1378","user_id":"253","team_name":"Frizzell","rink":"Mount Joy","address":"Mount Joy, Markham, ON L3P 7R2, Canada","gender":"Male","format":"Shinny - 5 vs 5","caliber":"B","goalies":"1","playoff":"0","save_game":"0","latitude":"43.891953","longitude":"-79.264069","game_payment":"50","date":"2023-02-23","time":"09:00 PM","game_datetime":"2023-02-23 21:00:00","time_zone":"America/Toronto","digit_timezone":"-05:00","short_time_zone":"EST","game_duration":"60","instruction":"","remainder":"0","place_id":"ChIJrUrB7yDW1IkRUNszkMTYaG8","register_on":"2023-02-22 15:57:56","is_delete":"0","is_favorite":"1","is_cancel":"0","reposted":"0","cancel_goalie_id":"0","parent_schedule_id":"-1","user_time_zone":"","amount":"15","firstname":"Brad","lastname":"Frizzell","goalie_cut":"15"},{"schedule_id":"1334","user_id":"2","team_name":"Pylons","rink":"Canlan Sports","address":"159 Dynamic Dr, Scarborough, ON M1V 5L8, Canada","gender":"Male","format":"Game - 5 vs 5","caliber":"D","goalies":"1","playoff":"0","save_game":"0","latitude":"43.829132","longitude":"-79.251633","game_payment":"50","date":"2023-01-27","time":"02:00 AM","game_datetime":"2023-01-27 02:00:00","time_zone":"America/Toronto","digit_timezone":"-05:00","short_time_zone":"EST","game_duration":"60","instruction":"Contact is Junior","remainder":"0","place_id":"ChIJ6827TtrW1IkRrEeePYzWg_w","register_on":"2023-01-26 16:19:58","is_delete":"0","is_favorite":"0","is_cancel":"0","reposted":"0","cancel_goalie_id":"0","parent_schedule_id":"-1","user_time_zone":"","amount":"15","firstname":"Admin","lastname":"Rent A Goalie","goalie_cut":"15"},{"schedule_id":"1332","user_id":"2","team_name":"Ale Stars","rink":"Canlan Sports","address":"159 Dynamic Dr, Scarborough, ON M1V 5L8, Canada","gender":"Male","format":"Game - 5 vs 5","caliber":"D","goalies":"1","playoff":"0","save_game":"0","latitude":"43.829132","longitude":"-79.251633","game_payment":"50","date":"2023-01-26","time":"02:45 AM","game_datetime":"2023-01-26 02:45:00","time_zone":"America/Toronto","digit_timezone":"-05:00","short_time_zone":"EST","game_duration":"60","instruction":"Contact is Spence\n","remainder":"0","place_id":"ChIJ6827TtrW1IkRrEeePYzWg_w","register_on":"2023-01-25 23:38:39","is_delete":"0","is_favorite":"0","is_cancel":"0","reposted":"0","cancel_goalie_id":"0","parent_schedule_id":"-1","user_time_zone":"","amount":"15","firstname":"Admin","lastname":"Rent A Goalie","goalie_cut":"15"},{"schedule_id":"1331","user_id":"2","team_name":"The D","rink":"Canlan Sports","address":"159 Dynamic Dr, Scarborough, ON M1V 5L8, Canada","gender":"Male","format":"Game - 5 vs 5","caliber":"C","goalies":"1","playoff":"0","save_game":"0","latitude":"43.829132","longitude":"-79.251636","game_payment":"50","date":"2023-01-26","time":"02:00 AM","game_datetime":"2023-01-26 02:00:00","time_zone":"America/Toronto","digit_timezone":"-05:00","short_time_zone":"EST","game_duration":"60","instruction":"","remainder":"0","place_id":"ChIJ6827TtrW1IkRrEeePYzWg_w","register_on":"2023-01-25 23:29:47","is_delete":"0","is_favorite":"0","is_cancel":"0","reposted":"0","cancel_goalie_id":"0","parent_schedule_id":"-1","user_time_zone":"","amount":"15","firstname":"Admin","lastname":"Rent A Goalie","goalie_cut":"15"},{"schedule_id":"1266","user_id":"2","team_name":"Test","rink":"Canlan Sports","address":"1401 Phillip Murray Ave, Oshawa, ON L1J 8C4, Canada","gender":"Male","format":"Game - 5 vs 5","caliber":"B","goalies":"1","playoff":"0","save_game":"0","latitude":"43.854061","longitude":"-78.878744","game_payment":"50","date":"2023-01-09","time":"10:30 PM","game_datetime":"2023-01-09 22:30:00","time_zone":"America/Toronto","digit_timezone":"-05:00","short_time_zone":"EST","game_duration":"60","instruction":"","remainder":"0","place_id":"ChIJJyhwnIHi1IkR3EWgHicCdU0","register_on":"2023-01-09 22:16:59","is_delete":"0","is_favorite":"0","is_cancel":"0","reposted":"0","cancel_goalie_id":"0","parent_schedule_id":"-1","user_time_zone":"","amount":"15","firstname":"Admin","lastname":"Rent A Goalie","goalie_cut":"15"},{"schedule_id":"1197","user_id":"2","team_name":"BTA","rink":"Canlan Sports","address":"159 Dynamic Dr, Scarborough, ON M1V 5L8, Canada","gender":"Male","format":"Game - 5 vs 5","caliber":"D","goalies":"1","playoff":"0","save_game":"0","latitude":"43.829132","longitude":"-79.251636","game_payment":"50","date":"2022-12-21","time":"04:15 AM","game_datetime":"2022-12-21 04:15:00","time_zone":"America/Toronto","digit_timezone":"-05:00","short_time_zone":"EST","game_duration":"60","instruction":"","remainder":"0","place_id":"ChIJ6827TtrW1IkRrEeePYzWg_w","register_on":"2022-12-21 04:11:58","is_delete":"0","is_favorite":"0","is_cancel":"0","reposted":"0","cancel_goalie_id":"0","parent_schedule_id":"-1","user_time_zone":"","amount":"15","firstname":"Admin","lastname":"Rent A Goalie","goalie_cut":"15"},{"schedule_id":"1120","user_id":"2","team_name":"Real Classy Guysi","rink":"Canlan Sports","address":"159 Dynamic Dr, Scarborough, ON M1V 5L8, Canada","gender":"Male","format":"Game - 5 vs 5","caliber":"C","goalies":"1","playoff":"1","save_game":"0","latitude":"43.829132","longitude":"-79.251636","game_payment":"50","date":"2022-04-13","time":"11:15 PM","game_datetime":"2022-04-13 23:15:00","time_zone":"America/Toronto","digit_timezone":"-04:00","short_time_zone":"EDT","game_duration":"60","instruction":"","remainder":"0","place_id":"ChIJ6827TtrW1IkRrEeePYzWg_w","register_on":"2022-04-13 17:57:01","is_delete":"0","is_favorite":"0","is_cancel":"0","reposted":"0","cancel_goalie_id":"0","parent_schedule_id":"-1","user_time_zone":"","amount":"15","firstname":"Admin","lastname":"Rent A Goalie","goalie_cut":"15"},{"schedule_id":"1118","user_id":"2","team_name":"Beavers","rink":"Rinx Toronto","address":"65 Orfus Rd, North York, ON M6A 1L7, Canada","gender":"Male","format":"Game - 5 vs 5","caliber":"C","goalies":"1","playoff":"0","save_game":"0","latitude":"43.71838","longitude":"-79.462364","game_payment":"50","date":"2022-03-30","time":"02:15 AM","game_datetime":"2022-03-30 02:15:00","time_zone":"America/Toronto","digit_timezone":"-04:00","short_time_zone":"EDT","game_duration":"60","instruction":"John\n","remainder":"0","place_id":"ChIJGdStzdMzK4gREjhMF0ZhLHs","register_on":"2022-03-29 21:34:56","is_delete":"0","is_favorite":"0","is_cancel":"0","reposted":"0","cancel_goalie_id":"0","parent_schedule_id":"-1","user_time_zone":"","amount":"15","firstname":"Admin","lastname":"Rent A Goalie","goalie_cut":"15"},{"schedule_id":"852","user_id":"2","team_name":"Ale Stars","rink":"Canlan Ice Sports","address":"159 Dynamic Dr, Scarborough, ON M1V 5L8, Canada","gender":"No Preference","format":"Game - 5 vs 5","caliber":"C","goalies":"1","playoff":"0","save_game":"0","latitude":"43.829128","longitude":"-79.251518","game_payment":"50","date":"2020-02-13","time":"03:30 AM","game_datetime":"2020-02-13 03:30:00","time_zone":"America/Toronto","digit_timezone":"-05:00","short_time_zone":"EST","game_duration":"60","instruction":"Contact is Brent","remainder":"0","place_id":"ChIJ6827TtrW1IkRrEeePYzWg_w","register_on":"2020-02-12 13:14:39","is_delete":"0","is_favorite":"0","is_cancel":"0","reposted":"0","cancel_goalie_id":"0","parent_schedule_id":"-1","user_time_zone":"","amount":"15","firstname":"Admin","lastname":"Rent A Goalie","goalie_cut":"15"},{"schedule_id":"853","user_id":"2","team_name":"White Hawks","rink":"Canlan Ice Sports","address":"159 Dynamic Dr, Scarborough, ON M1V 5L8, Canada","gender":"No Preference","format":"Game - 5 vs 5","caliber":"C","goalies":"1","playoff":"0","save_game":"0","latitude":"43.829128","longitude":"-79.251518","game_payment":"50","date":"2020-02-13","time":"12:15 AM","game_datetime":"2020-02-13 00:15:00","time_zone":"America/Toronto","digit_timezone":"-05:00","short_time_zone":"EST","game_duration":"60","instruction":"Contact is Jon\n","remainder":"0","place_id":"ChIJ6827TtrW1IkRrEeePYzWg_w","register_on":"2020-02-12 16:40:27","is_delete":"0","is_favorite":"0","is_cancel":"0","reposted":"0","cancel_goalie_id":"0","parent_schedule_id":"-1","user_time_zone":"","amount":"15","firstname":"Admin","lastname":"Rent A Goalie","goalie_cut":"15"}]
/// success : "1"
/// total_goalie_cut : "630"
/// service_time : "0.018148899078369 seconds"

GamePaymentModel gamePaymentModelFromJson(String str) =>
    GamePaymentModel.fromJson(json.decode(str));
String gamePaymentModelToJson(GamePaymentModel data) =>
    json.encode(data.toJson());

class GamePaymentModel {
  GamePaymentModel({
    List<Data>? data,
    String? success,
    String? totalGoalieCut,
    String? serviceTime,
  }) {
    _data = data;
    _success = success;
    _totalGoalieCut = totalGoalieCut;
    _serviceTime = serviceTime;
  }

  GamePaymentModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _success = json['success'];
    _totalGoalieCut = json['total_goalie_cut'];
    _serviceTime = json['service_time'];
  }
  List<Data>? _data;
  String? _success;
  String? _totalGoalieCut;
  String? _serviceTime;
  GamePaymentModel copyWith({
    List<Data>? data,
    String? success,
    String? totalGoalieCut,
    String? serviceTime,
  }) =>
      GamePaymentModel(
        data: data ?? _data,
        success: success ?? _success,
        totalGoalieCut: totalGoalieCut ?? _totalGoalieCut,
        serviceTime: serviceTime ?? _serviceTime,
      );
  List<Data>? get data => _data;
  String? get success => _success;
  String? get totalGoalieCut => _totalGoalieCut;
  String? get serviceTime => _serviceTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['success'] = _success;
    map['total_goalie_cut'] = _totalGoalieCut;
    map['service_time'] = _serviceTime;
    return map;
  }
}

/// schedule_id : "2236"
/// user_id : "182"
/// team_name : "Bolts"
/// rink : "Canlan Sports"
/// address : "Canlan Sports, Dynamic Drive, Scarborough, ON, Canada"
/// gender : "Male"
/// format : "Game - 5 vs 5"
/// caliber : "E"
/// goalies : "1"
/// playoff : "1"
/// save_game : "0"
/// latitude : "43.8291323"
/// longitude : "-79.2516358"
/// game_payment : "50"
/// date : "2024-03-13"
/// time : "09:30 PM"
/// game_datetime : "2024-03-13 21:30:00"
/// time_zone : "Atlantic/Reykjavik"
/// digit_timezone : "00:00"
/// short_time_zone : "GMT"
/// game_duration : "60"
/// instruction : ""
/// remainder : "0"
/// place_id : "ChIJ6827TtrW1IkRrEeePYzWg_w"
/// register_on : "2024-03-13 17:26:14"
/// is_delete : "0"
/// is_favorite : "1"
/// is_cancel : "0"
/// reposted : "0"
/// cancel_goalie_id : "0"
/// parent_schedule_id : "-1"
/// user_time_zone : "America/Toronto"
/// amount : "15"
/// firstname : "George"
/// lastname : "Kostoulias"
/// goalie_cut : "15"

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
    String? amount,
    String? firstname,
    String? lastname,
    String? goalieCut,
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
    _amount = amount;
    _firstname = firstname;
    _lastname = lastname;
    _goalieCut = goalieCut;
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
    _amount = json['amount'];
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    _goalieCut = json['goalie_cut'];
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
  String? _amount;
  String? _firstname;
  String? _lastname;
  String? _goalieCut;
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
    String? amount,
    String? firstname,
    String? lastname,
    String? goalieCut,
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
        amount: amount ?? _amount,
        firstname: firstname ?? _firstname,
        lastname: lastname ?? _lastname,
        goalieCut: goalieCut ?? _goalieCut,
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
  String? get amount => _amount;
  String? get firstname => _firstname;
  String? get lastname => _lastname;
  String? get goalieCut => _goalieCut;

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
    map['amount'] = _amount;
    map['firstname'] = _firstname;
    map['lastname'] = _lastname;
    map['goalie_cut'] = _goalieCut;
    return map;
  }
}
