import 'dart:convert';

/// game_rank : "0"
/// data : [{"firstname":"Hunter","lastname":"Jonkman","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/647946f2e50e7.jpg","user_id":"271","goalies":"1","game":"1","avg_rating":"0.0","total_time":"2024-05-02 22:15:00","cur_time":"2024-05-15 12:40:20","total_goalie":"1","month":"5","cur_month":"5"}]
/// success : "1"
/// message : "Goalie game rating"
/// service_time : "0.0089519023895264 seconds"

MostPlayedGameModel mostPlayedGameModelFromJson(String str) =>
    MostPlayedGameModel.fromJson(json.decode(str));
String mostPlayedGameModelToJson(MostPlayedGameModel data) =>
    json.encode(data.toJson());

class MostPlayedGameModel {
  MostPlayedGameModel({
    String? gameRank,
    List<Data>? data,
    String? success,
    String? message,
    String? serviceTime,
  }) {
    _gameRank = gameRank;
    _data = data;
    _success = success;
    _message = message;
    _serviceTime = serviceTime;
  }

  MostPlayedGameModel.fromJson(dynamic json) {
    _gameRank = json['game_rank'];
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
  String? _gameRank;
  List<Data>? _data;
  String? _success;
  String? _message;
  String? _serviceTime;
  MostPlayedGameModel copyWith({
    String? gameRank,
    List<Data>? data,
    String? success,
    String? message,
    String? serviceTime,
  }) =>
      MostPlayedGameModel(
        gameRank: gameRank ?? _gameRank,
        data: data ?? _data,
        success: success ?? _success,
        message: message ?? _message,
        serviceTime: serviceTime ?? _serviceTime,
      );
  String? get gameRank => _gameRank;
  List<Data>? get data => _data;
  String? get success => _success;
  String? get message => _message;
  String? get serviceTime => _serviceTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['game_rank'] = _gameRank;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['success'] = _success;
    map['message'] = _message;
    map['service_time'] = _serviceTime;
    return map;
  }
}

/// firstname : "Hunter"
/// lastname : "Jonkman"
/// profile_pic : "http://app.hockeyrentagoalie.com/web_services/upload/thumb/647946f2e50e7.jpg"
/// user_id : "271"
/// goalies : "1"
/// game : "1"
/// avg_rating : "0.0"
/// total_time : "2024-05-02 22:15:00"
/// cur_time : "2024-05-15 12:40:20"
/// total_goalie : "1"
/// month : "5"
/// cur_month : "5"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    String? firstname,
    String? lastname,
    String? profilePic,
    String? userId,
    String? goalies,
    String? game,
    String? avgRating,
    String? totalTime,
    String? curTime,
    String? totalGoalie,
    String? month,
    String? curMonth,
  }) {
    _firstname = firstname;
    _lastname = lastname;
    _profilePic = profilePic;
    _userId = userId;
    _goalies = goalies;
    _game = game;
    _avgRating = avgRating;
    _totalTime = totalTime;
    _curTime = curTime;
    _totalGoalie = totalGoalie;
    _month = month;
    _curMonth = curMonth;
  }

  Data.fromJson(dynamic json) {
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    _profilePic = json['profile_pic'];
    _userId = json['user_id'];
    _goalies = json['goalies'];
    _game = json['game'];
    _avgRating = json['avg_rating'];
    _totalTime = json['total_time'];
    _curTime = json['cur_time'];
    _totalGoalie = json['total_goalie'];
    _month = json['month'];
    _curMonth = json['cur_month'];
  }
  String? _firstname;
  String? _lastname;
  String? _profilePic;
  String? _userId;
  String? _goalies;
  String? _game;
  String? _avgRating;
  String? _totalTime;
  String? _curTime;
  String? _totalGoalie;
  String? _month;
  String? _curMonth;
  Data copyWith({
    String? firstname,
    String? lastname,
    String? profilePic,
    String? userId,
    String? goalies,
    String? game,
    String? avgRating,
    String? totalTime,
    String? curTime,
    String? totalGoalie,
    String? month,
    String? curMonth,
  }) =>
      Data(
        firstname: firstname ?? _firstname,
        lastname: lastname ?? _lastname,
        profilePic: profilePic ?? _profilePic,
        userId: userId ?? _userId,
        goalies: goalies ?? _goalies,
        game: game ?? _game,
        avgRating: avgRating ?? _avgRating,
        totalTime: totalTime ?? _totalTime,
        curTime: curTime ?? _curTime,
        totalGoalie: totalGoalie ?? _totalGoalie,
        month: month ?? _month,
        curMonth: curMonth ?? _curMonth,
      );
  String? get firstname => _firstname;
  String? get lastname => _lastname;
  String? get profilePic => _profilePic;
  String? get userId => _userId;
  String? get goalies => _goalies;
  String? get game => _game;
  String? get avgRating => _avgRating;
  String? get totalTime => _totalTime;
  String? get curTime => _curTime;
  String? get totalGoalie => _totalGoalie;
  String? get month => _month;
  String? get curMonth => _curMonth;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstname'] = _firstname;
    map['lastname'] = _lastname;
    map['profile_pic'] = _profilePic;
    map['user_id'] = _userId;
    map['goalies'] = _goalies;
    map['game'] = _game;
    map['avg_rating'] = _avgRating;
    map['total_time'] = _totalTime;
    map['cur_time'] = _curTime;
    map['total_goalie'] = _totalGoalie;
    map['month'] = _month;
    map['cur_month'] = _curMonth;
    return map;
  }
}
