import 'dart:convert';

/// success : ""
/// message : ""

CommonModel commonModelFromJson(String str) =>
    CommonModel.fromJson(json.decode(str));
String commonModelToJson(CommonModel data) => json.encode(data.toJson());

class CommonModel {
  CommonModel({
    String? success,
    String? message,
  }) {
    _success = success;
    _message = message;
  }

  CommonModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
  }
  String? _success;
  String? _message;

  String? get success => _success;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    return map;
  }
}
