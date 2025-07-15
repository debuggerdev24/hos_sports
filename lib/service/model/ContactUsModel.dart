import 'dart:convert';

/// success : "1"
/// message : "success"
/// data : [{"contact_us_id":"2","contact_type":"email","label":"Email:","value":"hossports@gmail.com","is_deleted":"0","added_on":"0000-00-00 00:00:00"},{"contact_us_id":"3","contact_type":"web","label":"URL","value":"http://www.hockeyrentagoalie.com/","is_deleted":"0","added_on":"0000-00-00 00:00:00"},{"contact_us_id":"4","contact_type":"mobile","label":"Phone","value":"4168073138","is_deleted":"0","added_on":"0000-00-00 00:00:00"}]
/// service_time : "0.019450902938843 seconds"

ContactUsModel contactUsModelFromJson(String str) =>
    ContactUsModel.fromJson(json.decode(str));
String contactUsModelToJson(ContactUsModel data) => json.encode(data.toJson());

class ContactUsModel {
  ContactUsModel({
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

  ContactUsModel.fromJson(dynamic json) {
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
  ContactUsModel copyWith({
    String? success,
    String? message,
    List<Data>? data,
    String? serviceTime,
  }) =>
      ContactUsModel(
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

/// contact_us_id : "2"
/// contact_type : "email"
/// label : "Email:"
/// value : "hossports@gmail.com"
/// is_deleted : "0"
/// added_on : "0000-00-00 00:00:00"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    String? contactUsId,
    String? contactType,
    String? label,
    String? value,
    String? isDeleted,
    String? addedOn,
  }) {
    _contactUsId = contactUsId;
    _contactType = contactType;
    _label = label;
    _value = value;
    _isDeleted = isDeleted;
    _addedOn = addedOn;
  }

  Data.fromJson(dynamic json) {
    _contactUsId = json['contact_us_id'];
    _contactType = json['contact_type'];
    _label = json['label'];
    _value = json['value'];
    _isDeleted = json['is_deleted'];
    _addedOn = json['added_on'];
  }
  String? _contactUsId;
  String? _contactType;
  String? _label;
  String? _value;
  String? _isDeleted;
  String? _addedOn;
  Data copyWith({
    String? contactUsId,
    String? contactType,
    String? label,
    String? value,
    String? isDeleted,
    String? addedOn,
  }) =>
      Data(
        contactUsId: contactUsId ?? _contactUsId,
        contactType: contactType ?? _contactType,
        label: label ?? _label,
        value: value ?? _value,
        isDeleted: isDeleted ?? _isDeleted,
        addedOn: addedOn ?? _addedOn,
      );
  String? get contactUsId => _contactUsId;
  String? get contactType => _contactType;
  String? get label => _label;
  String? get value => _value;
  String? get isDeleted => _isDeleted;
  String? get addedOn => _addedOn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['contact_us_id'] = _contactUsId;
    map['contact_type'] = _contactType;
    map['label'] = _label;
    map['value'] = _value;
    map['is_deleted'] = _isDeleted;
    map['added_on'] = _addedOn;
    return map;
  }
}
