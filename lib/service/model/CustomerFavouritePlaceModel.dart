import 'dart:convert';

/// data : [{"rink":"Toronto","place_id":"ChIJpTvG15DL1IkRd8S0KlBVNTI","address":"Toronto, ON, Canada","latitude":"43.653226","longitude":"-79.3831843","favourite_place":"8"},{"rink":"Nanded City","place_id":"ChIJUzUJgZmVwjsR934GZhNplhI","address":"Nanded City, Nanded, Pune, Maharashtra, India","latitude":"18.4601246","longitude":"73.7858437","favourite_place":"2"},{"rink":"Ajax Community Centre","place_id":"ChIJ0-gnsNff1IkRZBtFCtCDf70","address":"75 Centennial Rd, Ajax, ON L1S 4S4, Canada","latitude":"43.839333","longitude":"-79.020111","favourite_place":"2"},{"rink":"Canlan Sports","place_id":"ChIJUduwBxw6K4gR-hSQCUcrT4o","address":"1120 Martin Grove Rd, Etobicoke, ON M9W 4W1, Canada","latitude":"43.699757","longitude":"-79.576118","favourite_place":"1"},{"rink":"Canlan Sports","place_id":"ChIJ6827TtrW1IkRrEeePYzWg_w","address":"159 Dynamic Dr, Scarborough, ON M1V 5L8, Canada","latitude":"43.829132","longitude":"-79.251636","favourite_place":"2"}]
/// success : "1"
/// message : "Customer favorite place is 5 available"
/// service_time : "0.0095009803771973 seconds"

CustomerFavouritePlaceModel customerFavouritePlaceModelFromJson(String str) =>
    CustomerFavouritePlaceModel.fromJson(json.decode(str));
String customerFavouritePlaceModelToJson(CustomerFavouritePlaceModel data) =>
    json.encode(data.toJson());

class CustomerFavouritePlaceModel {
  CustomerFavouritePlaceModel({
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

  CustomerFavouritePlaceModel.fromJson(dynamic json) {
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
  CustomerFavouritePlaceModel copyWith({
    List<Data>? data,
    String? success,
    String? message,
    String? serviceTime,
  }) =>
      CustomerFavouritePlaceModel(
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

/// rink : "Toronto"
/// place_id : "ChIJpTvG15DL1IkRd8S0KlBVNTI"
/// address : "Toronto, ON, Canada"
/// latitude : "43.653226"
/// longitude : "-79.3831843"
/// favourite_place : "8"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    String? rink,
    String? placeId,
    String? address,
    String? latitude,
    String? longitude,
    String? favouritePlace,
  }) {
    _rink = rink;
    _placeId = placeId;
    _address = address;
    _latitude = latitude;
    _longitude = longitude;
    _favouritePlace = favouritePlace;
  }

  Data.fromJson(dynamic json) {
    _rink = json['rink'];
    _placeId = json['place_id'];
    _address = json['address'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _favouritePlace = json['favourite_place'];
  }
  String? _rink;
  String? _placeId;
  String? _address;
  String? _latitude;
  String? _longitude;
  String? _favouritePlace;
  Data copyWith({
    String? rink,
    String? placeId,
    String? address,
    String? latitude,
    String? longitude,
    String? favouritePlace,
  }) =>
      Data(
        rink: rink ?? _rink,
        placeId: placeId ?? _placeId,
        address: address ?? _address,
        latitude: latitude ?? _latitude,
        longitude: longitude ?? _longitude,
        favouritePlace: favouritePlace ?? _favouritePlace,
      );
  String? get rink => _rink;
  String? get placeId => _placeId;
  String? get address => _address;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  String? get favouritePlace => _favouritePlace;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rink'] = _rink;
    map['place_id'] = _placeId;
    map['address'] = _address;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['favourite_place'] = _favouritePlace;
    return map;
  }
}
