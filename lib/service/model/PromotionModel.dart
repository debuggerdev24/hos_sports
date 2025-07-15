import 'dart:convert';
/// data : [{"id":"4","promotion_title":"Want to save $10 off your next Rental - Google Offer","promotion_desc":"Leave us a quick 5-star Google review - https://g.page/r/CYwkbDeBFAp1EB0/review and we’ll knock $10 off your next rental.    Text us at (416) 807-3138 to validate the post, at least 4 hours before an upcoming on-ice session.   The discount must be approved and communicated to the goalie before the next rental by our Admin team to be honoured.     *** This is a one-time offer and cannot be combined with other promotions","user_type":"1","start_date":"2024-01-23","end_date":"2024-12-31","promotion_type_id":"3","value1":"","value2":"","value3":"","value4":"","promotion_image":"","image_width":"0","image_height":"0","added_on":"2024-01-23 22:21:40","is_deleted":"0","is_redeemed":""}]
/// success : "1"
/// message : "Promotion list"
/// service_time : "0.005155086517334 seconds"

PromotionModel promotionModelFromJson(String str) => PromotionModel.fromJson(json.decode(str));
String promotionModelToJson(PromotionModel data) => json.encode(data.toJson());
class PromotionModel {
  PromotionModel({
      List<Data>? data, 
      String? success, 
      String? message, 
      String? serviceTime,}){
    _data = data;
    _success = success;
    _message = message;
    _serviceTime = serviceTime;
}

  PromotionModel.fromJson(dynamic json) {
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
PromotionModel copyWith({  List<Data>? data,
  String? success,
  String? message,
  String? serviceTime,
}) => PromotionModel(  data: data ?? _data,
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

/// id : "4"
/// promotion_title : "Want to save $10 off your next Rental - Google Offer"
/// promotion_desc : "Leave us a quick 5-star Google review - https://g.page/r/CYwkbDeBFAp1EB0/review and we’ll knock $10 off your next rental.    Text us at (416) 807-3138 to validate the post, at least 4 hours before an upcoming on-ice session.   The discount must be approved and communicated to the goalie before the next rental by our Admin team to be honoured.     *** This is a one-time offer and cannot be combined with other promotions"
/// user_type : "1"
/// start_date : "2024-01-23"
/// end_date : "2024-12-31"
/// promotion_type_id : "3"
/// value1 : ""
/// value2 : ""
/// value3 : ""
/// value4 : ""
/// promotion_image : ""
/// image_width : "0"
/// image_height : "0"
/// added_on : "2024-01-23 22:21:40"
/// is_deleted : "0"
/// is_redeemed : ""

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? id, 
      String? promotionTitle, 
      String? promotionDesc, 
      String? userType, 
      String? startDate, 
      String? endDate, 
      String? promotionTypeId, 
      String? value1, 
      String? value2, 
      String? value3, 
      String? value4, 
      String? promotionImage, 
      String? imageWidth, 
      String? imageHeight, 
      String? addedOn, 
      String? isDeleted, 
      String? isRedeemed,}){
    _id = id;
    _promotionTitle = promotionTitle;
    _promotionDesc = promotionDesc;
    _userType = userType;
    _startDate = startDate;
    _endDate = endDate;
    _promotionTypeId = promotionTypeId;
    _value1 = value1;
    _value2 = value2;
    _value3 = value3;
    _value4 = value4;
    _promotionImage = promotionImage;
    _imageWidth = imageWidth;
    _imageHeight = imageHeight;
    _addedOn = addedOn;
    _isDeleted = isDeleted;
    _isRedeemed = isRedeemed;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _promotionTitle = json['promotion_title'];
    _promotionDesc = json['promotion_desc'];
    _userType = json['user_type'];
    _startDate = json['start_date'];
    _endDate = json['end_date'];
    _promotionTypeId = json['promotion_type_id'];
    _value1 = json['value1'];
    _value2 = json['value2'];
    _value3 = json['value3'];
    _value4 = json['value4'];
    _promotionImage = json['promotion_image'];
    _imageWidth = json['image_width'];
    _imageHeight = json['image_height'];
    _addedOn = json['added_on'];
    _isDeleted = json['is_deleted'];
    _isRedeemed = json['is_redeemed'];
  }
  String? _id;
  String? _promotionTitle;
  String? _promotionDesc;
  String? _userType;
  String? _startDate;
  String? _endDate;
  String? _promotionTypeId;
  String? _value1;
  String? _value2;
  String? _value3;
  String? _value4;
  String? _promotionImage;
  String? _imageWidth;
  String? _imageHeight;
  String? _addedOn;
  String? _isDeleted;
  String? _isRedeemed;
Data copyWith({  String? id,
  String? promotionTitle,
  String? promotionDesc,
  String? userType,
  String? startDate,
  String? endDate,
  String? promotionTypeId,
  String? value1,
  String? value2,
  String? value3,
  String? value4,
  String? promotionImage,
  String? imageWidth,
  String? imageHeight,
  String? addedOn,
  String? isDeleted,
  String? isRedeemed,
}) => Data(  id: id ?? _id,
  promotionTitle: promotionTitle ?? _promotionTitle,
  promotionDesc: promotionDesc ?? _promotionDesc,
  userType: userType ?? _userType,
  startDate: startDate ?? _startDate,
  endDate: endDate ?? _endDate,
  promotionTypeId: promotionTypeId ?? _promotionTypeId,
  value1: value1 ?? _value1,
  value2: value2 ?? _value2,
  value3: value3 ?? _value3,
  value4: value4 ?? _value4,
  promotionImage: promotionImage ?? _promotionImage,
  imageWidth: imageWidth ?? _imageWidth,
  imageHeight: imageHeight ?? _imageHeight,
  addedOn: addedOn ?? _addedOn,
  isDeleted: isDeleted ?? _isDeleted,
  isRedeemed: isRedeemed ?? _isRedeemed,
);
  String? get id => _id;
  String? get promotionTitle => _promotionTitle;
  String? get promotionDesc => _promotionDesc;
  String? get userType => _userType;
  String? get startDate => _startDate;
  String? get endDate => _endDate;
  String? get promotionTypeId => _promotionTypeId;
  String? get value1 => _value1;
  String? get value2 => _value2;
  String? get value3 => _value3;
  String? get value4 => _value4;
  String? get promotionImage => _promotionImage;
  String? get imageWidth => _imageWidth;
  String? get imageHeight => _imageHeight;
  String? get addedOn => _addedOn;
  String? get isDeleted => _isDeleted;
  String? get isRedeemed => _isRedeemed;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['promotion_title'] = _promotionTitle;
    map['promotion_desc'] = _promotionDesc;
    map['user_type'] = _userType;
    map['start_date'] = _startDate;
    map['end_date'] = _endDate;
    map['promotion_type_id'] = _promotionTypeId;
    map['value1'] = _value1;
    map['value2'] = _value2;
    map['value3'] = _value3;
    map['value4'] = _value4;
    map['promotion_image'] = _promotionImage;
    map['image_width'] = _imageWidth;
    map['image_height'] = _imageHeight;
    map['added_on'] = _addedOn;
    map['is_deleted'] = _isDeleted;
    map['is_redeemed'] = _isRedeemed;
    return map;
  }

}