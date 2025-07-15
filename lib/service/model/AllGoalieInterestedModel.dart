import 'dart:convert';

/// data : [{"interest_id":"2759","schedule_id":"2322","user_id":"3","approval_status":"1","approval_status_changed_on":"2024-05-23 09:25:04","added_on":"2024-05-23 09:25:04","is_delete":"0","phone_number":"4166272100","firstname":"Ryan","lastname":"Hosford","area_code":"L6c1a5","email":"hossports@gmail.com","password":"R29hbGllMjRAQA==","user_type":"2","gender":"Male","calibre":"C","birthday":"1975-09-05","avaliable_to_play":"5 vs 5,3 vs 3,Co-Ed","kilometers_to_travel":"100","profile_pic":"http://app.hockeyrentagoalie.com/web_services/upload/thumb/5d83b90a95e74.jpg","level_of_game":"AA","rent_a_goalie_experience":"1","rating":"5.0","totalgame":"21","unpaid_game":"5","registered_on":"2019-05-01 02:17:18","is_verify":"1","device_type":"1","device_token":"fb4MC7KlTVWxksRGVt8hCc:APA91bFZ-hgRb8LiL2Kms8NbNtBbW9XyvgI2r6fSIomKejVjaf1HanvjT5ML2K4gmTuXqmHuXowSsEMrj61eg9AadtbmqkGhRKvTmgx_nFtbedtyinBHdHybj1KGa4W68JebPtplN7ck","ashl_register":"1","is_active":"1","60_min_game":"50","90_min_game":"65","120_min_game":"75","goalie_cut":"15","is_approve":"1","user_latitude":"43.653225","user_longitude":"-79.383183","user_time_zone":"Asia/Calcutta","device_version":"12|3.4|sdk_gphone64_x86_64|GMT 05:30","feedback":"Most flexible goalie I’ve ever encountered|Ryan stepped up to fill a vacancy. Thx Ryan. |Nice win after being under siege in the late third. |Tough OT lose, but great battle to get us into the overage|Stellar shutout performance|Another outstanding performance |Awesome, great compete level|Amazing, got us the win with a short bench|Playoff ringer, enough said!|Available on super short notice. Thanks!|Awesome tendy and nice guy"}]
/// success : "1"
/// message : "Your have associated with this goalies game."
/// service_time : "0.33901596069336 seconds"

AllGoalieInterestedModel allGoalieInterestedModelFromJson(String str) =>
    AllGoalieInterestedModel.fromJson(json.decode(str));

String allGoalieInterestedModelToJson(AllGoalieInterestedModel data) =>
    json.encode(data.toJson());

class AllGoalieInterestedModel {
  AllGoalieInterestedModel({
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

  AllGoalieInterestedModel.fromJson(dynamic json) {
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

  AllGoalieInterestedModel copyWith({
    List<Data>? data,
    String? success,
    String? message,
    String? serviceTime,
  }) =>
      AllGoalieInterestedModel(
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

/// interest_id : "2759"
/// schedule_id : "2322"
/// user_id : "3"
/// approval_status : "1"
/// approval_status_changed_on : "2024-05-23 09:25:04"
/// added_on : "2024-05-23 09:25:04"
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
/// totalgame : "21"
/// unpaid_game : "5"
/// registered_on : "2019-05-01 02:17:18"
/// is_verify : "1"
/// device_type : "1"
/// device_token : "fb4MC7KlTVWxksRGVt8hCc:APA91bFZ-hgRb8LiL2Kms8NbNtBbW9XyvgI2r6fSIomKejVjaf1HanvjT5ML2K4gmTuXqmHuXowSsEMrj61eg9AadtbmqkGhRKvTmgx_nFtbedtyinBHdHybj1KGa4W68JebPtplN7ck"
/// ashl_register : "1"
/// is_active : "1"
/// 60_min_game : "50"
/// 90_min_game : "65"
/// 120_min_game : "75"
/// goalie_cut : "15"
/// is_approve : "1"
/// user_latitude : "43.653225"
/// user_longitude : "-79.383183"
/// user_time_zone : "Asia/Calcutta"
/// device_version : "12|3.4|sdk_gphone64_x86_64|GMT 05:30"
/// feedback : "Most flexible goalie I’ve ever encountered|Ryan stepped up to fill a vacancy. Thx Ryan. |Nice win after being under siege in the late third. |Tough OT lose, but great battle to get us into the overage|Stellar shutout performance|Another outstanding performance |Awesome, great compete level|Amazing, got us the win with a short bench|Playoff ringer, enough said!|Available on super short notice. Thanks!|Awesome tendy and nice guy"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    String? interestId,
    String? scheduleId,
    String? userId,
    String? customerId,
    String? approvalStatus,
    String? approvalStatusChangedOn,
    String? addedOn,
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
    String? isFavorite,
    String? age,
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
    _interestId = interestId;
    _scheduleId = scheduleId;
    _userId = userId;
    _customerId = customerId;
    _approvalStatus = approvalStatus;
    _approvalStatusChangedOn = approvalStatusChangedOn;
    _addedOn = addedOn;
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
    _age = age;
    _isFavorite = isFavorite;
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

  Data.fromJson(dynamic json) {
    _interestId = json['interest_id'];
    _scheduleId = json['schedule_id'];
    _userId = json['user_id'];
    _customerId = json['customer_id'];
    _approvalStatus = json['approval_status'];
    _approvalStatusChangedOn = json['approval_status_changed_on'];
    _addedOn = json['added_on'];
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
    _age = json['age'];
    _isFavorite = json['is_favorite'];
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

  String? _interestId;
  String? _scheduleId;
  String? _userId;
  String? _customerId;
  String? _approvalStatus;
  String? _approvalStatusChangedOn;
  String? _addedOn;
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
  String? _age;
  String? _isFavorite;
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

  Data copyWith({
    String? interestId,
    String? scheduleId,
    String? userId,
    String? customerId,
    String? approvalStatus,
    String? approvalStatusChangedOn,
    String? addedOn,
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
      Data(
        interestId: interestId ?? _interestId,
        scheduleId: scheduleId ?? _scheduleId,
        userId: userId ?? _userId,
        customerId: customerId ?? _customerId,
        approvalStatus: approvalStatus ?? _approvalStatus,
        approvalStatusChangedOn:
            approvalStatusChangedOn ?? _approvalStatusChangedOn,
        addedOn: addedOn ?? _addedOn,
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
        age: age ?? _age,
        isFavorite: isFavorite ?? _isFavorite,
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

  String? get interestId => _interestId;

  String? get scheduleId => _scheduleId;

  String? get userId => _userId;

  String? get customerId => _customerId;

  String? get approvalStatus => _approvalStatus;

  String? get approvalStatusChangedOn => _approvalStatusChangedOn;

  String? get addedOn => _addedOn;

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

  String? get age => _age;
  String? get isFavorite => _isFavorite;

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
    map['interest_id'] = _interestId;
    map['schedule_id'] = _scheduleId;
    map['user_id'] = _userId;
    map['customer_id'] = _customerId;
    map['approval_status'] = _approvalStatus;
    map['approval_status_changed_on'] = _approvalStatusChangedOn;
    map['added_on'] = _addedOn;
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
    map['age'] = _age;
    map['is_favorite'] = _isFavorite;
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
