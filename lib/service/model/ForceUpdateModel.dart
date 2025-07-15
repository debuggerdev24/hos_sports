class UpdateApiResponse {
  String success;
  UpdateData data;
  String message;
  String serviceTime;

  UpdateApiResponse({
    required this.success,
    required this.data,
    required this.message,
    required this.serviceTime,
  });

  factory UpdateApiResponse.fromJson(Map<String, dynamic> json) {
    return UpdateApiResponse(
      success: json['success'],
      data: UpdateData.fromJson(json['data']),
      message: json['message'],
      serviceTime: json['service_time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data.toJson(),
      'message': message,
      'service_time': serviceTime,
    };
  }
}

class UpdateData {
  String apkVersionAndroid;
  String apkLinkAndroid;
  String apkLinkIos;
  String apkVersionIos;
  String forceUpdate;
  String ignoreUpdate;

  UpdateData({
    required this.apkVersionAndroid,
    required this.apkLinkAndroid,
    required this.apkLinkIos,
    required this.apkVersionIos,
    required this.forceUpdate,
    required this.ignoreUpdate,
  });

  factory UpdateData.fromJson(Map<String, dynamic> json) {
    return UpdateData(
      apkVersionAndroid: json['apk_version_android'],
      apkLinkAndroid: json['apk_link_android'],
      apkLinkIos: json['apk_link_ios'],
      apkVersionIos: json['apk_version_ios'],
      forceUpdate: json['force_update'],
      ignoreUpdate: json['ignore_update'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'apk_version_android': apkVersionAndroid,
      'apk_link_android': apkLinkAndroid,
      'apk_link_ios': apkLinkIos,
      'apk_version_ios': apkVersionIos,
      'force_update': forceUpdate,
      'ignore_update': ignoreUpdate,
    };
  }
}
