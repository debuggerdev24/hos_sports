import 'dart:convert';

/// data : [{"id":"266","user_id":"2","firstname":"Admin","lastname":"Rent A Goalie","calibre":"","profile_pic":"http://example.com/pic1.jpg"},{"id":"6","user_id":"13","firstname":"Adam","lastname":"Rogaczewski","calibre":"C","profile_pic":"http://example.com/pic2.jpg"},{"id":"232","user_id":"449","firstname":"Jeff","lastname":"Ekubor","calibre":"D","profile_pic":"http://example.com/pic3.jpg"}]
/// success : "1"
/// message : "Customer favorite goalie is 3 available"
/// service_time : "0.0017411708831787 seconds"

CustomerFavoriteGoalieModel customerFavoriteGoalieModelFromJson(String str) =>
    CustomerFavoriteGoalieModel.fromJson(json.decode(str));
String customerFavoriteGoalieModelToJson(CustomerFavoriteGoalieModel data) =>
    json.encode(data.toJson());

class CustomerFavoriteGoalieModel {
  CustomerFavoriteGoalieModel({
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

  CustomerFavoriteGoalieModel.fromJson(dynamic json) {
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

  CustomerFavoriteGoalieModel copyWith({
    List<Data>? data,
    String? success,
    String? message,
    String? serviceTime,
  }) =>
      CustomerFavoriteGoalieModel(
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

/// id : "266"
/// user_id : "2"
/// firstname : "Admin"
/// lastname : "Rent A Goalie"
/// calibre : ""
/// profile_pic : "http://example.com/pic1.jpg"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    String? id,
    String? userId,
    String? firstname,
    String? lastname,
    String? calibre,
    String? profilePic, // Added profilePic parameter
  }) {
    _id = id;
    _userId = userId;
    _firstname = firstname;
    _lastname = lastname;
    _calibre = calibre;
    _profilePic = profilePic;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _firstname = json['firstname'];
    _lastname = json['lastname'];
    _calibre = json['calibre'];
    _profilePic = json['profile_pic'];
  }

  String? _id;
  String? _userId;
  String? _firstname;
  String? _lastname;
  String? _calibre;
  String? _profilePic; // Added profilePic field

  Data copyWith({
    String? id,
    String? userId,
    String? firstname,
    String? lastname,
    String? calibre,
    String? profilePic, // Added profilePic parameter
  }) =>
      Data(
        id: id ?? _id,
        userId: userId ?? _userId,
        firstname: firstname ?? _firstname,
        lastname: lastname ?? _lastname,
        calibre: calibre ?? _calibre,
        profilePic: profilePic ?? _profilePic, // Added profilePic assignment
      );

  String? get id => _id;
  String? get userId => _userId;
  String? get firstname => _firstname;
  String? get lastname => _lastname;
  String? get calibre => _calibre;
  String? get profilePic => _profilePic; // Getter for profilePic

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['firstname'] = _firstname;
    map['lastname'] = _lastname;
    map['calibre'] = _calibre;
    map['profile_pic'] = _profilePic; // Added profilePic to map
    return map;
  }
}
