import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));
String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.userId,
    this.phoneNumber,
    this.firstname,
    this.lastname,
    this.areaCode,
    this.email,
    this.password,
    this.userType,
    this.gender,
    this.calibre,
    this.birthday,
    this.avaliableToPlay,
    this.kilometersToTravel,
    this.profilePic,
    this.levelOfGame,
    this.rentAGoalieExperience,
    this.rating,
    this.totalgame,
    this.unpaidGame,
    this.registeredOn,
    this.isVerify,
    this.deviceType,
    this.deviceToken,
    this.ashlRegister,
    this.isActive,
    this.minGame60,
    this.minGame90,
    this.minGame120,
    this.goalieCut,
    this.isDelete,
    this.isApprove,
    this.userLatitude,
    this.userLongitude,
    this.userTimeZone,
    this.deviceVersion,
  });

  String? userId;
  String? phoneNumber;
  String? firstname;
  String? lastname;
  String? areaCode;
  String? email;
  String? password;
  String? userType;
  String? gender;
  String? calibre;
  String? birthday;
  String? avaliableToPlay;
  String? kilometersToTravel;
  String? profilePic;
  String? levelOfGame;
  String? rentAGoalieExperience;
  String? rating;
  String? totalgame;
  String? unpaidGame;
  String? registeredOn;
  String? isVerify;
  String? deviceType;
  String? deviceToken;
  String? ashlRegister;
  String? isActive;
  String? minGame60;
  String? minGame90;
  String? minGame120;
  String? goalieCut;
  String? isDelete;
  String? isApprove;
  String? userLatitude;
  String? userLongitude;
  String? userTimeZone;
  String? deviceVersion;

  factory UserModel.fromJson(Map<String, dynamic>? json) => UserModel(
        userId: json?['user_id'],
        phoneNumber: json?['phone_number'],
        firstname: json?['firstname'],
        lastname: json?['lastname'],
        areaCode: json?['area_code'],
        email: json?['email'],
        password: json?['password'],
        userType: json?['user_type'],
        gender: json?['gender'],
        calibre: json?['calibre'],
        birthday: json?['birthday'],
        avaliableToPlay: json?['avaliable_to_play'],
        kilometersToTravel: json?['kilometers_to_travel'],
        profilePic: json?['profile_pic'],
        levelOfGame: json?['level_of_game'],
        rentAGoalieExperience: json?['rent_a_goalie_experience'],
        rating: json?['rating'],
        totalgame: json?['totalgame'],
        unpaidGame: json?['unpaid_game'],
        registeredOn: json?['registered_on'],
        isVerify: json?['is_verify'],
        deviceType: json?['device_type'],
        deviceToken: json?['device_token'],
        ashlRegister: json?['ashl_register'],
        isActive: json?['is_active'],
        minGame60: json?['60_min_game'],
        minGame90: json?['90_min_game'],
        minGame120: json?['120_min_game'],
        goalieCut: json?['goalie_cut'],
        isDelete: json?['is_delete'],
        isApprove: json?['is_approve'],
        userLatitude: json?['user_latitude'],
        userLongitude: json?['user_longitude'],
        userTimeZone: json?['user_time_zone'],
        deviceVersion: json?['device_version'],
      );

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'phone_number': phoneNumber,
        'firstname': firstname,
        'lastname': lastname,
        'area_code': areaCode,
        'email': email,
        'password': password,
        'user_type': userType,
        'gender': gender,
        'calibre': calibre,
        'birthday': birthday,
        'avaliable_to_play': avaliableToPlay,
        'kilometers_to_travel': kilometersToTravel,
        'profile_pic': profilePic,
        'level_of_game': levelOfGame,
        'rent_a_goalie_experience': rentAGoalieExperience,
        'rating': rating,
        'totalgame': totalgame,
        'unpaid_game': unpaidGame,
        'registered_on': registeredOn,
        'is_verify': isVerify,
        'device_type': deviceType,
        'device_token': deviceToken,
        'ashl_register': ashlRegister,
        'is_active': isActive,
        '60_min_game': minGame60,
        '90_min_game': minGame90,
        '120_min_game': minGame120,
        'goalie_cut': goalieCut,
        'is_delete': isDelete,
        'is_approve': isApprove,
        'user_latitude': userLatitude,
        'user_longitude': userLongitude,
        'user_time_zone': userTimeZone,
        'device_version': deviceVersion,
      };
}
