import 'dart:convert';

/// game_rank : "1"
/// data : [{"firstname":"Ryan","lastname":"Hosford","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/5d83b90a95e74.jpg","user_id":"3","avg_rating":"5.0","game":"13"},{"firstname":"Griffin","lastname":"Hosford","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/5d83b8c5d5bb6.jpg","user_id":"60","avg_rating":"5.0","game":"2"},{"firstname":"Jonathan","lastname":"Bested","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/5e10feb376bd4.png","user_id":"44","avg_rating":"5.0","game":"12"},{"firstname":"Brayden","lastname":"Jones","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/5dd2ca316f798.png","user_id":"76","avg_rating":"5.0","game":"1"},{"firstname":"Ryan","lastname":"Dover","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/5dfa324494a73.png","user_id":"35","avg_rating":"5.0","game":"3"},{"firstname":"Mackenzie","lastname":"Salmon","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/5e4f687b9f0ff.jpg","user_id":"84","avg_rating":"5.0","game":"5"},{"firstname":"Michael","lastname":"Wannop","profile_pic":"","user_id":"91","avg_rating":"5.0","game":"3"},{"firstname":"John","lastname":"Burke","profile_pic":"","user_id":"100","avg_rating":"5.0","game":"1"},{"firstname":"Tyler","lastname":"Cohen","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/5e30ab9905f8a.jpg","user_id":"81","avg_rating":"5.0","game":"1"},{"firstname":"Kyle","lastname":"Parker","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/61ffbf1a0d1e9.jpg","user_id":"165","avg_rating":"5.0","game":"3"},{"firstname":"Ryan ","lastname":"Hiebert ","profile_pic":"","user_id":"169","avg_rating":"5.0","game":"1"},{"firstname":"Mike","lastname":"Riley","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/5ccb1def8d80e.jpg","user_id":"14","avg_rating":"5.0","game":"1"},{"firstname":"David","lastname":"Dalrymple","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/5dd1f4fe7d53c.jpg","user_id":"72","avg_rating":"5.0","game":"3"},{"firstname":"Adam","lastname":"Cooper","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/61781cb532981.jpg","user_id":"136","avg_rating":"5.0","game":"1"},{"firstname":"Gord","lastname":"de Gannes","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/63adf0e5e6014.jpg","user_id":"160","avg_rating":"5.0","game":"2"},{"firstname":"Sandro","lastname":"Pileggi","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/63017b3fdd741.jpg","user_id":"147","avg_rating":"5.0","game":"7"},{"firstname":"Mike","lastname":"Daoust","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/64e2477fa4ff2.jpg","user_id":"67","avg_rating":"5.0","game":"4"},{"firstname":"Mike","lastname":"Busby","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/6616a8b2e4b75.jpg","user_id":"241","avg_rating":"5.0","game":"1"},{"firstname":"Serge","lastname":"L","profile_pic":"","user_id":"270","avg_rating":"5.0","game":"1"},{"firstname":"Scott","lastname":"Brown","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/63b0a9513c8f7.jpg","user_id":"211","avg_rating":"5.0","game":"1"},{"firstname":"lucas","lastname":"Giancaterina","profile_pic":"","user_id":"329","avg_rating":"5.0","game":"1"},{"firstname":"Adrian","lastname":"Ianno","profile_pic":"","user_id":"380","avg_rating":"5.0","game":"1"},{"firstname":"jake","lastname":"poland","profile_pic":"","user_id":"371","avg_rating":"5.0","game":"1"},{"firstname":"shawn","lastname":"patterson","profile_pic":"","user_id":"423","avg_rating":"5.0","game":"1"},{"firstname":"Alex","lastname":"Lamanna","profile_pic":"","user_id":"431","avg_rating":"5.0","game":"7"},{"firstname":"Jay","lastname":"Bistonath","profile_pic":"","user_id":"502","avg_rating":"5.0","game":"3"},{"firstname":"Patrick","lastname":"Morrison","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/657f1988d991b.jpg","user_id":"333","avg_rating":"5.0","game":"1"},{"firstname":"Tom","lastname":"Piotrowski","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/658ee3ffefd57.jpg","user_id":"493","avg_rating":"5.0","game":"2"},{"firstname":"Jason","lastname":"Gabor","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/6566711904518.png","user_id":"555","avg_rating":"5.0","game":"1"},{"firstname":"Jeff","lastname":"Ekubor","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/64e7fff890e3d.png","user_id":"449","avg_rating":"5.0","game":"6"},{"firstname":"anthony","lastname":"gitto","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/65deb3f6ed04e.jpg","user_id":"492","avg_rating":"5.0","game":"1"},{"firstname":"John","lastname":"Pitty","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/657b9f614d969.png","user_id":"573","avg_rating":"5.0","game":"1"},{"firstname":"Bryan","lastname":"Shiffman","profile_pic":"","user_id":"593","avg_rating":"5.0","game":"1"},{"firstname":"Ian","lastname":"McDonald","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/63f999bc7440c.jpg","user_id":"129","avg_rating":"5.0","game":"1"},{"firstname":"david","lastname":"thompson","profile_pic":"","user_id":"327","avg_rating":"5.0","game":"1"},{"firstname":"Neil","lastname":"casbourn","profile_pic":"","user_id":"400","avg_rating":"5.0","game":"1"},{"firstname":"Rick","lastname":"Anderson","profile_pic":"","user_id":"553","avg_rating":"5.0","game":"1"},{"firstname":"graham","lastname":"lloyd","profile_pic":"","user_id":"324","avg_rating":"5.0","game":"1"},{"firstname":"Quinn","lastname":"Kirkendall","profile_pic":"","user_id":"655","avg_rating":"5.0","game":"1"},{"firstname":"Joseph","lastname":"Clark","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/66099a9f8581e.jpg","user_id":"696","avg_rating":"5.0","game":"2"},{"firstname":"Jerome","lastname":"Abarquez","profile_pic":"","user_id":"706","avg_rating":"5.0","game":"2"},{"firstname":"steven","lastname":"karpouzis","profile_pic":"","user_id":"469","avg_rating":"5.0","game":"1"},{"firstname":"Brandon","lastname":"Gerritsen","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/65cc0a23778b1.jpg","user_id":"152","avg_rating":"5.0","game":"1"},{"firstname":"Ian","lastname":"smith","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/5cc9067e8c85b.jpg","user_id":"4","avg_rating":"4.9","game":"36"},{"firstname":"George","lastname":"Kostoulias","profile_pic":"","user_id":"182","avg_rating":"4.9","game":"3"},{"firstname":"Andrew","lastname":"Marson","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/65321cbba0ac6.jpg","user_id":"229","avg_rating":"4.9","game":"5"},{"firstname":"Adam","lastname":"Rogaczewski","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/5da7b652a906f.png","user_id":"13","avg_rating":"4.8","game":"30"},{"firstname":"Evan","lastname":"Wright","profile_pic":"","user_id":"78","avg_rating":"4.8","game":"13"},{"firstname":"Derrick","lastname":"Leung","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/5e3309feec54b.png","user_id":"86","avg_rating":"4.8","game":"41"},{"firstname":"David","lastname":"Wainwright","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/5e4b0c66cccfc.jpg","user_id":"105","avg_rating":"4.8","game":"2"},{"firstname":"Stu","lastname":"Marks","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/6155d80abdbd2.jpg","user_id":"126","avg_rating":"4.8","game":"2"},{"firstname":"Andrew","lastname":"Waterworth","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/657a0b39cf33c.png","user_id":"386","avg_rating":"4.8","game":"2"},{"firstname":"Matt","lastname":"Sanche","profile_pic":"","user_id":"476","avg_rating":"4.8","game":"2"},{"firstname":"ed","lastname":"Hachey","profile_pic":"","user_id":"501","avg_rating":"4.8","game":"3"},{"firstname":"derek","lastname":"Dominico","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/5ccdaaa5cb808.png","user_id":"15","avg_rating":"4.7","game":"2"},{"firstname":"Jay","lastname":"Bistonath","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/63f3a2db3ae6d.png","user_id":"22","avg_rating":"4.7","game":"5"},{"firstname":"Jeff ","lastname":"Ling","profile_pic":"","user_id":"338","avg_rating":"4.7","game":"1"},{"firstname":"dylan","lastname":"Wasser","profile_pic":"","user_id":"166","avg_rating":"4.3","game":"1"},{"firstname":"Param","lastname":"Pabla","profile_pic":"","user_id":"311","avg_rating":"4.3","game":"1"}]
/// success : "1"
/// message : "Goalie avg rating"
/// service_time : "0.0087659358978271 seconds"

GoalieAvgRatingModel goalieAvgRatingModelFromJson(String str) =>
    GoalieAvgRatingModel.fromJson(json.decode(str));
String goalieAvgRatingModelToJson(GoalieAvgRatingModel data) =>
    json.encode(data.toJson());

class GoalieAvgRatingModel {
  GoalieAvgRatingModel({
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

  GoalieAvgRatingModel.fromJson(dynamic json) {
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
  GoalieAvgRatingModel copyWith({
    String? gameRank,
    List<Data>? data,
    String? success,
    String? message,
    String? serviceTime,
  }) =>
      GoalieAvgRatingModel(
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

/// firstname : "Ryan"
/// lastname : "Hosford"
/// profile_pic : "http://app.hockeyrentagoalie.com/web_services/upload/thumb/5d83b90a95e74.jpg"
/// user_id : "3"
/// avg_rating : "5.0"
/// game : "13"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    String? firstname,
    String? lastname,
    String? profilePic,
    String? userId,
    String? avgRating,
    String? game,
  }) {
    _firstname = firstname;
    _lastname = lastname;
    _profilePic = profilePic;
    _userId = userId;
    _avgRating = avgRating;
    _game = game;
  }

  Data.fromJson(dynamic json) {
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    _profilePic = json['profile_pic'];
    _userId = json['user_id'];
    _avgRating = json['avg_rating'];
    _game = json['game'];
  }
  String? _firstname;
  String? _lastname;
  String? _profilePic;
  String? _userId;
  String? _avgRating;
  String? _game;
  Data copyWith({
    String? firstname,
    String? lastname,
    String? profilePic,
    String? userId,
    String? avgRating,
    String? game,
  }) =>
      Data(
        firstname: firstname ?? _firstname,
        lastname: lastname ?? _lastname,
        profilePic: profilePic ?? _profilePic,
        userId: userId ?? _userId,
        avgRating: avgRating ?? _avgRating,
        game: game ?? _game,
      );
  String? get firstname => _firstname;
  String? get lastname => _lastname;
  String? get profilePic => _profilePic;
  String? get userId => _userId;
  String? get avgRating => _avgRating;
  String? get game => _game;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstname'] = _firstname;
    map['lastname'] = _lastname;
    map['profile_pic'] = _profilePic;
    map['user_id'] = _userId;
    map['avg_rating'] = _avgRating;
    map['game'] = _game;
    return map;
  }
}
