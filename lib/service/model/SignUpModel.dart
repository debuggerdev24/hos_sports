import 'dart:convert';

SignUpModel signUpModelFromJson(String str) =>
    SignUpModel.fromJson(json.decode(str));
String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  SignUpModel({
    required this.success,
    required this.emailSend,
    required this.message,
    required this.data,
  });

  final String success;
  final String emailSend;
  final String message;
  final Data data;

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        success: json['success'],
        emailSend: json['email_send'] ?? "",
        message: json['message'],
        data: Data.fromJson(json['data'] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'email_send': emailSend,
        'message': message,
        'data': data.toJson(),
      };
}

class Data {
  Data({
    required this.userId,
    required this.phoneNumber,
    required this.firstname,
    required this.lastname,
    required this.areaCode,
    required this.email,
    required this.password,
    required this.userType,
    required this.gender,
    required this.calibre,
    required this.birthday,
    required this.avaliableToPlay,
    required this.kilometersToTravel,
    required this.profilePic,
    required this.levelOfGame,
    required this.rentAGoalieExperience,
    required this.rating,
    required this.totalgame,
    required this.unpaidGame,
    required this.registeredOn,
    required this.isVerify,
    required this.deviceType,
    required this.deviceToken,
    required this.ashlRegister,
    required this.isActive,
    required this.minGame60,
    required this.minGame90,
    required this.minGame120,
    required this.goalieCut,
    required this.isDelete,
    required this.isApprove,
    required this.userLatitude,
    required this.userLongitude,
    required this.userTimeZone,
    required this.deviceVersion,
  });

  final String userId;
  final String phoneNumber;
  final String firstname;
  final String lastname;
  final String areaCode;
  final String email;
  final String password;
  final String userType;
  final String gender;
  final String calibre;
  final String birthday;
  final String avaliableToPlay;
  final String kilometersToTravel;
  final String profilePic;
  final String levelOfGame;
  final String rentAGoalieExperience;
  final String rating;
  final String totalgame;
  final String unpaidGame;
  final String registeredOn;
  final String isVerify;
  final String deviceType;
  final String deviceToken;
  final String ashlRegister;
  final String isActive;
  final String minGame60;
  final String minGame90;
  final String minGame120;
  final String goalieCut;
  final String isDelete;
  final String isApprove;
  final String userLatitude;
  final String userLongitude;
  final String userTimeZone;
  final String deviceVersion;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json['user_id'] ?? "",
        phoneNumber: json['phone_number'] ?? "",
        firstname: json['firstname'] ?? "",
        lastname: json['lastname'] ?? "",
        areaCode: json['area_code'] ?? "",
        email: json['email'] ?? "",
        password: json['password'] ?? "",
        userType: json['user_type'] ?? "",
        gender: json['gender'] ?? "",
        calibre: json['calibre'] ?? "",
        birthday: json['birthday'] ?? "",
        avaliableToPlay: json['avaliable_to_play'] ?? "",
        kilometersToTravel: json['kilometers_to_travel'] != null
            ? json['kilometers_to_travel'].toString()
            : "0",
        profilePic: json['profile_pic'] ?? "",
        levelOfGame: json['level_of_game'] ?? "",
        rentAGoalieExperience: json['rent_a_goalie_experience'] ?? "",
        rating: json['rating'] ?? "",
        totalgame: json['totalgame'] ?? "",
        unpaidGame: json['unpaid_game'] ?? "",
        registeredOn: json['registered_on'] ?? "",
        isVerify: json['is_verify'] ?? "",
        deviceType: json['device_type'] ?? "",
        deviceToken: json['device_token'] ?? "",
        ashlRegister: json['ashl_register'] ?? "",
        isActive: json['is_active'] ?? "",
        minGame60: json['60_min_game'] ?? "",
        minGame90: json['90_min_game'] ?? "",
        minGame120: json['120_min_game'] ?? "",
        goalieCut: json['goalie_cut'] ?? "",
        isDelete: json['is_delete'] ?? "",
        isApprove: json['is_approve'] ?? "",
        userLatitude: json['user_latitude'] ?? "",
        userLongitude: json['user_longitude'] ?? "",
        userTimeZone: json['user_time_zone'] ?? "",
        deviceVersion: json['device_version'] ?? "",
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
