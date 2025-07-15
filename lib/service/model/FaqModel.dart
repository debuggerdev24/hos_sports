import 'dart:convert';

/// success : "1"
/// message : "success"
/// data : [{"faq_id":"27","user_type":"1","question":"The selected goalie was not the caliber represented","answer":"As we expand our business, is it difficult to make sure all represented fairly. Our current solution, please provide honest feedback via the app and we'll re-qualify their caliber. Please email hockeyrentagoalie@gmail.com if the goalie was significantly misrepresented and we'll make things right.","is_deleted":"0","added_on":"0000-00-00 00:00:00"},{"faq_id":"26","user_type":"2","question":"Game Default","answer":"If a game defaults for any reason within the last hour before the scceduled time, the goalie will be paid $35 for showing up. We realize it's beyond the team's control most times, but the goalie did commit to the session and arrived to play.","is_deleted":"0","added_on":"0000-00-00 00:00:00"},{"faq_id":"25","user_type":"1","question":"Game Default","answer":"If a game defaults for any reason within the last hour before the scceduled time, the goalie will be paid $35 for showing up. We realize it's beyond the team's control most times, but the goalie did commit to the session and arrived to play.","is_deleted":"0","added_on":"0000-00-00 00:00:00"},{"faq_id":"24","user_type":"2","question":"I am not getting Push notifications","answer":"Commonly logging out from the Setting page and back into the app will resolve, if not double check your setting on the app and your phone allowing notifications.    APP -> Settings -> Notifications -> email/push -> On.  IOS -> Settings -> Notifications -> Hossports -> Always/Persistent","is_deleted":"0","added_on":"0000-00-00 00:00:00"},{"faq_id":"23","user_type":"1","question":"I am not getting Push notifications","answer":"Commonly logging out from the Setting page and back into the app resolves, if not double check your setting on the app and your phone allowing notifications.    APP -> Settings -> Notifications -> email/push -> On.  IOS -> Settings -> Notifications -> Hossports -> Always/Persistent","is_deleted":"0","added_on":"0000-00-00 00:00:00"},{"faq_id":"22","user_type":"2","question":"How does a \"Goalie\" make payment to Hossports","answer":"Payment is to be made via e-transfer to hossports@gmail.com. Please send a text to 416-807-3138 notifying of the payment.","is_deleted":"0","added_on":"0000-00-00 00:00:00"},{"faq_id":"21","user_type":"2","question":"Outstanding Feedback","answer":"Navigate to \"Manage Games\" -> \"Outstanding Feedback\" and submit feedback for a previously completed game.","is_deleted":"0","added_on":"0000-00-00 00:00:00"},{"faq_id":"20","user_type":"1","question":"Outstanding Feedback","answer":"Navigate to \"Manage Games\" -> \"Outstanding Feedback\" and submit feedback for a previously completed game.","is_deleted":"0","added_on":"0000-00-00 00:00:00"},{"faq_id":"19","user_type":"1","question":"What does the green dot mean under Submitted games?","answer":"At a glance, this indicates there is a goalie interested in playing that particular game.","is_deleted":"0","added_on":"0000-00-00 00:00:00"},{"faq_id":"17","user_type":"2","question":"Is \"Rink Check-In\" a required step?","answer":"Rink check-in notifies the customer that the goalie has arrived at the rink and communicates your availability for additional games at the same facility. In addition, it tells the App the game was played.","is_deleted":"0","added_on":"0000-00-00 00:00:00"},{"faq_id":"16","user_type":"2","question":"What is \"Schedule Availability\" under settings?","answer":"This feature allows you to turn off notifications for games that take place when you know you are unavailable, such as 9am-5pm for your primary job. Games will still appear in the app.","is_deleted":"0","added_on":"0000-00-00 00:00:00"},{"faq_id":"15","user_type":"2","question":"What if I \"the goalie\" cancels too many games?","answer":"We ask the goalies only accept games they can play. If you cancel 3 scheduled games, you will be removed from the app.","is_deleted":"0","added_on":"0000-00-00 00:00:00"},{"faq_id":"14","user_type":"2","question":"Will I know if my scheduled game is canceled?","answer":"Games can be canceled 4 hours prior to the rental and the app will notify you. If the request is within 4 hours, they must contact us directly as a fees may apply.","is_deleted":"0","added_on":"0000-00-00 00:00:00"},{"faq_id":"13","user_type":"2","question":"What if a client asks for my contact information?","answer":"At no time should a goalie share their personal contact details. All management is handle via the app with zero tolerance.","is_deleted":"0","added_on":"0000-00-00 00:00:00"},{"faq_id":"12","user_type":"2","question":"My account has been suspended awaiting payment?","answer":"The Admin put a default of 2 games on each new goalies account and new games cannot be schedule until payment has been made.","is_deleted":"0","added_on":"0000-00-00 00:00:00"},{"faq_id":"11","user_type":"1","question":"How does payment work?","answer":"Please pay the goalie cash directly before or after the rental in full.","is_deleted":"0","added_on":"0000-00-00 00:00:00"},{"faq_id":"10","user_type":"2","question":"How does payment work?","answer":"Customers pay you directly before or after each rental in cash.","is_deleted":"0","added_on":"0000-00-00 00:00:00"},{"faq_id":"9","user_type":"2","question":"What should I do if a customer does not pay?","answer":"Simply contact us with the games details and we will follow-up with the client for payment.","is_deleted":"0","added_on":"0000-00-00 00:00:00"},{"faq_id":"8","user_type":"2","question":"Should I provide Feedback?","answer":"Honest feedback allows us to avoid problematic customers for our goalies.","is_deleted":"0","added_on":"0000-00-00 00:00:00"},{"faq_id":"7","user_type":"1","question":"What if I need to cancel a rental?","answer":"You can cancel a rental 4 hours prior to the rental and the app will notify the goalie. If you're within 4 hours, you must contact us direct as fees may apply.","is_deleted":"0","added_on":"0000-00-00 00:00:00"},{"faq_id":"6","user_type":"1","question":"What if I get an “un-paid game” notification?","answer":"This means a payment was missed after the rental, please call (416) 807-3138 to resolve.","is_deleted":"0","added_on":"0000-00-00 00:00:00"},{"faq_id":"5","user_type":"1","question":"What does \"Goalies\" mean in my dashboard?","answer":"This indicates the number of goalies available for your \"next\" submitted game.","is_deleted":"0","added_on":"0000-00-00 00:00:00"},{"faq_id":"4","user_type":"1","question":"Should I provide Feedback?","answer":"Honest feedback allows us to provide a qualified and a reliable staff of goalies.","is_deleted":"0","added_on":"0000-00-00 00:00:00"},{"faq_id":"3","user_type":"1","question":"What is Manage Favorites?","answer":"See preferred goalies from previous games and a list of recent rinks, which auto-populate when scheduling your next game.","is_deleted":"0","added_on":"0000-00-00 00:00:00"},{"faq_id":"2","user_type":"1","question":"Will I know if my scheduled goalie cancels?","answer":"Yes, the app will notify you of any cancelations and automatically re-posts your game.","is_deleted":"0","added_on":"0000-00-00 00:00:00"},{"faq_id":"1","user_type":"1","question":"Will I know when my goalie arrives?","answer":"Yes, goalies are required to check-in once they arrive at the rink and you will receive an in-app notification.","is_deleted":"0","added_on":"0000-00-00 00:00:00"}]
/// service_time : "0.0054059028625488 seconds"

FaqModel faqModelFromJson(String str) => FaqModel.fromJson(json.decode(str));
String faqModelToJson(FaqModel data) => json.encode(data.toJson());

class FaqModel {
  FaqModel({
    String? success,
    String? message,
    List<Data>? data,
    String? serviceTime,
  }) {
    _success = success;
    _message = message;
    _data = data;
    _serviceTime = serviceTime;
  }

  FaqModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _serviceTime = json['service_time'];
  }
  String? _success;
  String? _message;
  List<Data>? _data;
  String? _serviceTime;
  FaqModel copyWith({
    String? success,
    String? message,
    List<Data>? data,
    String? serviceTime,
  }) =>
      FaqModel(
        success: success ?? _success,
        message: message ?? _message,
        data: data ?? _data,
        serviceTime: serviceTime ?? _serviceTime,
      );
  String? get success => _success;
  String? get message => _message;
  List<Data>? get data => _data;
  String? get serviceTime => _serviceTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['service_time'] = _serviceTime;
    return map;
  }
}

/// faq_id : "27"
/// user_type : "1"
/// question : "The selected goalie was not the caliber represented"
/// answer : "As we expand our business, is it difficult to make sure all represented fairly. Our current solution, please provide honest feedback via the app and we'll re-qualify their caliber. Please email hockeyrentagoalie@gmail.com if the goalie was significantly misrepresented and we'll make things right."
/// is_deleted : "0"
/// added_on : "0000-00-00 00:00:00"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    String? faqId,
    String? userType,
    String? question,
    String? answer,
    String? isDeleted,
    String? addedOn,
  }) {
    _faqId = faqId;
    _userType = userType;
    _question = question;
    _answer = answer;
    _isDeleted = isDeleted;
    _addedOn = addedOn;
  }

  Data.fromJson(dynamic json) {
    _faqId = json['faq_id'];
    _userType = json['user_type'];
    _question = json['question'];
    _answer = json['answer'];
    _isDeleted = json['is_deleted'];
    _addedOn = json['added_on'];
  }
  String? _faqId;
  String? _userType;
  String? _question;
  String? _answer;
  String? _isDeleted;
  String? _addedOn;
  Data copyWith({
    String? faqId,
    String? userType,
    String? question,
    String? answer,
    String? isDeleted,
    String? addedOn,
  }) =>
      Data(
        faqId: faqId ?? _faqId,
        userType: userType ?? _userType,
        question: question ?? _question,
        answer: answer ?? _answer,
        isDeleted: isDeleted ?? _isDeleted,
        addedOn: addedOn ?? _addedOn,
      );
  String? get faqId => _faqId;
  String? get userType => _userType;
  String? get question => _question;
  String? get answer => _answer;
  String? get isDeleted => _isDeleted;
  String? get addedOn => _addedOn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['faq_id'] = _faqId;
    map['user_type'] = _userType;
    map['question'] = _question;
    map['answer'] = _answer;
    map['is_deleted'] = _isDeleted;
    map['added_on'] = _addedOn;
    return map;
  }
}
