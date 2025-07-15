class CheckingGameWithoutGoalieResponse {
  List<CheckingGameWithoutGoalie>? data;
  String? success;
  List<dynamic>?
      lastInterestId; // Since the type isn't specified, keeping it dynamic.
  String? serviceTime;

  CheckingGameWithoutGoalieResponse({
    this.data,
    this.success,
    this.lastInterestId,
    this.serviceTime,
  });

  factory CheckingGameWithoutGoalieResponse.fromJson(
      Map<String, dynamic> json) {
    return CheckingGameWithoutGoalieResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((item) => CheckingGameWithoutGoalie.fromJson(item))
          .toList(),
      success: json['success'],
      lastInterestId: json['last_interest_id'],
      serviceTime: json['service_time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.map((item) => item.toJson()).toList(),
      'success': success,
      'last_interest_id': lastInterestId,
      'service_time': serviceTime,
    };
  }
}

class CheckingGameWithoutGoalie {
  String? scheduleId;
  String? userId;
  String? teamName;
  String? rink;
  String? address;
  String? gender;
  String? format;
  String? caliber;
  String? goalies;
  String? playoff;
  String? saveGame;
  String? latitude;
  String? longitude;
  String? gamePayment;
  String? date;
  String? time;
  String? gameDatetime;
  String? timeZone;
  String? digitTimezone;
  String? shortTimeZone;
  String? gameDuration;
  String? instruction;
  String? remainder;
  String? placeId;
  String? registerOn;
  String? isDelete;
  String? isFavorite;
  String? isCancel;
  String? reposted;
  String? cancelGoalieId;
  String? parentScheduleId;
  String? userTimeZone;
  String? selectGoalies;
  String? totalTime;
  String? curTime;
  SelectedGoalie? selectedGoalie;

  CheckingGameWithoutGoalie({
    this.scheduleId,
    this.userId,
    this.teamName,
    this.rink,
    this.address,
    this.gender,
    this.format,
    this.caliber,
    this.goalies,
    this.playoff,
    this.saveGame,
    this.latitude,
    this.longitude,
    this.gamePayment,
    this.date,
    this.time,
    this.gameDatetime,
    this.timeZone,
    this.digitTimezone,
    this.shortTimeZone,
    this.gameDuration,
    this.instruction,
    this.remainder,
    this.placeId,
    this.registerOn,
    this.isDelete,
    this.isFavorite,
    this.isCancel,
    this.reposted,
    this.cancelGoalieId,
    this.parentScheduleId,
    this.userTimeZone,
    this.selectGoalies,
    this.totalTime,
    this.curTime,
    this.selectedGoalie,
  });

  factory CheckingGameWithoutGoalie.fromJson(Map<String, dynamic> json) {
    return CheckingGameWithoutGoalie(
      scheduleId: json['schedule_id']?.toString(),
      userId: json['user_id']?.toString(),
      teamName: json['team_name'],
      rink: json['rink'],
      address: json['address'],
      gender: json['gender'],
      format: json['format'],
      caliber: json['caliber'],
      goalies: json['goalies']?.toString(),
      playoff: json['playoff']?.toString(),
      saveGame: json['save_game']?.toString(),
      latitude: json['latitude'],
      longitude: json['longitude'],
      gamePayment: json['game_payment']?.toString(),
      date: json['date'],
      time: json['time'],
      gameDatetime: json['game_datetime'],
      timeZone: json['time_zone'],
      digitTimezone: json['digit_timezone'],
      shortTimeZone: json['short_time_zone'],
      gameDuration: json['game_duration'],
      instruction: json['instruction'],
      remainder: json['remainder'],
      placeId: json['place_id'],
      registerOn: json['register_on'],
      isDelete: json['is_delete']?.toString(),
      isFavorite: json['is_favorite']?.toString(),
      isCancel: json['is_cancel']?.toString(),
      reposted: json['reposted']?.toString(),
      cancelGoalieId: json['cancel_goalie_id']?.toString(),
      parentScheduleId: json['parent_schedule_id']?.toString(),
      userTimeZone: json['user_time_zone'],
      selectGoalies: json['select_goalies']?.toString(),
      totalTime: json['total_time'],
      curTime: json['cur_time'],
      selectedGoalie: json['selected_goalie'] != null
          ? SelectedGoalie.fromJson(json['selected_goalie'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'schedule_id': scheduleId,
      'user_id': userId,
      'team_name': teamName,
      'rink': rink,
      'address': address,
      'gender': gender,
      'format': format,
      'caliber': caliber,
      'goalies': goalies,
      'playoff': playoff,
      'save_game': saveGame,
      'latitude': latitude,
      'longitude': longitude,
      'game_payment': gamePayment,
      'date': date,
      'time': time,
      'game_datetime': gameDatetime,
      'time_zone': timeZone,
      'digit_timezone': digitTimezone,
      'short_time_zone': shortTimeZone,
      'game_duration': gameDuration,
      'instruction': instruction,
      'remainder': remainder,
      'place_id': placeId,
      'register_on': registerOn,
      'is_delete': isDelete,
      'is_favorite': isFavorite,
      'is_cancel': isCancel,
      'reposted': reposted,
      'cancel_goalie_id': cancelGoalieId,
      'parent_schedule_id': parentScheduleId,
      'user_time_zone': userTimeZone,
      'select_goalies': selectGoalies,
      'total_time': totalTime,
      'cur_time': curTime,
      'selected_goalie': selectedGoalie?.toJson(),
    };
  }
}

class SelectedGoalie {
  String? custInterestId;
  String? scheduleId;
  String? customerId;
  String? userId;
  String? approvalStatus;
  String? playGame;
  String? checkIn;
  String? additionalGame;
  String? selectGoalieCut;
  String? addedOn;
  String? isCancel;
  String? isDelete;
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
  String? totalGame;
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
  String? isApprove;
  String? userLatitude;
  String? userLongitude;
  String? userTimeZone;
  String? deviceVersion;
  String? feedback;

  SelectedGoalie({
    this.custInterestId,
    this.scheduleId,
    this.customerId,
    this.userId,
    this.approvalStatus,
    this.playGame,
    this.checkIn,
    this.additionalGame,
    this.selectGoalieCut,
    this.addedOn,
    this.isCancel,
    this.isDelete,
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
    this.totalGame,
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
    this.isApprove,
    this.userLatitude,
    this.userLongitude,
    this.userTimeZone,
    this.deviceVersion,
    this.feedback,
  });

  factory SelectedGoalie.fromJson(Map<String, dynamic> json) {
    return SelectedGoalie(
      custInterestId: json['cust_interest_id'],
      scheduleId: json['schedule_id'],
      customerId: json['customer_id'],
      userId: json['user_id'],
      approvalStatus: json['approval_status'],
      playGame: json['play_game'],
      checkIn: json['check_in'],
      additionalGame: json['additional_game'],
      selectGoalieCut: json['select_goalie_cut'],
      addedOn: json['added_on'],
      isCancel: json['is_cancel'],
      isDelete: json['is_delete'],
      phoneNumber: json['phone_number'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      areaCode: json['area_code'],
      email: json['email'],
      password: json['password'],
      userType: json['user_type'],
      gender: json['gender'],
      calibre: json['calibre'],
      birthday: json['birthday'],
      avaliableToPlay: json['avaliable_to_play'],
      kilometersToTravel: json['kilometers_to_travel'],
      profilePic: json['profile_pic'],
      levelOfGame: json['level_of_game'],
      rentAGoalieExperience: json['rent_a_goalie_experience'],
      rating: json['rating'],
      totalGame: json['totalgame'],
      unpaidGame: json['unpaid_game'],
      registeredOn: json['registered_on'],
      isVerify: json['is_verify'],
      deviceType: json['device_type'],
      deviceToken: json['device_token'],
      ashlRegister: json['ashl_register'],
      isActive: json['is_active'],
      minGame60: json['60_min_game'],
      minGame90: json['90_min_game'],
      minGame120: json['120_min_game'],
      goalieCut: json['goalie_cut'],
      isApprove: json['is_approve'],
      userLatitude: json['user_latitude'],
      userLongitude: json['user_longitude'],
      userTimeZone: json['user_time_zone'],
      deviceVersion: json['device_version'],
      feedback: json['feedback'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cust_interest_id': custInterestId,
      'schedule_id': scheduleId,
      'customer_id': customerId,
      'user_id': userId,
      'approval_status': approvalStatus,
      'play_game': playGame,
      'check_in': checkIn,
      'additional_game': additionalGame,
      'select_goalie_cut': selectGoalieCut,
      'added_on': addedOn,
      'is_cancel': isCancel,
      'is_delete': isDelete,
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
      'totalgame': totalGame,
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
      'is_approve': isApprove,
      'user_latitude': userLatitude,
      'user_longitude': userLongitude,
      'user_time_zone': userTimeZone,
      'device_version': deviceVersion,
      'feedback': feedback,
    };
  }
}
