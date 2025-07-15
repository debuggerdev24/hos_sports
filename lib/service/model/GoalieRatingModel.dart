import 'dart:convert';

/// data : {"avg_rating":"0.0","game":"0","availabel":"0","schedule":"0","history":"0","cancel":"0","payment":"0","unpaid":"0","game_count_current_month":"0","feedback":"0","user_rating":"0/306","user_game":"0/0"}
/// success : "1"
/// message : "goalie rating"
/// service_time : "0.27970504760742 seconds"

GoalieRatingModel goalieRatingModelFromJson(String str) =>
    GoalieRatingModel.fromJson(json.decode(str));
String goalieRatingModelToJson(GoalieRatingModel data) =>
    json.encode(data.toJson());

class GoalieRatingModel {
  GoalieRatingModel({
    Data? data,
    String? success,
    String? message,
    String? serviceTime,
  }) {
    _data = data;
    _success = success;
    _message = message;
    _serviceTime = serviceTime;
  }

  GoalieRatingModel.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _success = json['success'];
    _message = json['message'];
    _serviceTime = json['service_time'];
  }
  Data? _data;
  String? _success;
  String? _message;
  String? _serviceTime;

  Data? get data => _data;
  String? get success => _success;
  String? get message => _message;
  String? get serviceTime => _serviceTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['success'] = _success;
    map['message'] = _message;
    map['service_time'] = _serviceTime;
    return map;
  }
}

/// avg_rating : "0.0"
/// game : "0"
/// availabel : "0"
/// schedule : "0"
/// history : "0"
/// cancel : "0"
/// payment : "0"
/// unpaid : "0"
/// game_count_current_month : "0"
/// feedback : "0"
/// user_rating : "0/306"
/// user_game : "0/0"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    String? avgRating,
    String? game,
    String? availabel,
    String? schedule,
    String? history,
    String? cancel,
    String? payment,
    String? unpaid,
    String? gameCountCurrentMonth,
    String? feedback,
    String? userRating,
    String? userGame,
    String? cancelColor,
  }) {
    _avgRating = avgRating;
    _game = game;
    _availabel = availabel;
    _schedule = schedule;
    _history = history;
    _cancel = cancel;
    _payment = payment;
    _unpaid = unpaid;
    _gameCountCurrentMonth = gameCountCurrentMonth;
    _feedback = feedback;
    _userRating = userRating;
    _userGame = userGame;
    _cancelColor = cancelColor;
  }

  Data.fromJson(dynamic json) {
    _avgRating = json['avg_rating'];
    _game = json['game'];
    _availabel = json['availabel'];
    _schedule = json['schedule'];
    _history = json['history'];
    _cancel = json['cancel'];
    _payment = json['payment'];
    _unpaid = json['unpaid'];
    _gameCountCurrentMonth = json['game_count_current_month'];
    _feedback = json['feedback'];
    _userRating = json['user_rating'];
    _userGame = json['user_game'];
    _cancelColor = json['cancel_color'];
  }
  String? _avgRating;
  String? _game;
  String? _availabel;
  String? _schedule;
  String? _history;
  String? _cancel;
  String? _payment;
  String? _unpaid;
  String? _gameCountCurrentMonth;
  String? _feedback;
  String? _userRating;
  String? _userGame;
  String? _cancelColor;

  String? get avgRating => _avgRating;
  String? get game => _game;
  String? get availabel => _availabel;
  String? get schedule => _schedule;
  String? get history => _history;
  String? get cancel => _cancel;
  String? get payment => _payment;
  String? get unpaid => _unpaid;
  String? get gameCountCurrentMonth => _gameCountCurrentMonth;
  String? get feedback => _feedback;
  String? get userRating => _userRating;
  String? get userGame => _userGame;
  String? get cancelColor => _cancelColor;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['avg_rating'] = _avgRating;
    map['game'] = _game;
    map['availabel'] = _availabel;
    map['schedule'] = _schedule;
    map['history'] = _history;
    map['cancel'] = _cancel;
    map['payment'] = _payment;
    map['unpaid'] = _unpaid;
    map['game_count_current_month'] = _gameCountCurrentMonth;
    map['feedback'] = _feedback;
    map['user_rating'] = _userRating;
    map['user_game'] = _userGame;
    map['cancel_color'] = _cancelColor;
    return map;
  }
}
