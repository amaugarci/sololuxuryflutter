class OTPVerificationModel {
  int? status;
  String? message;
  Data? data;

  OTPVerificationModel({this.status, this.message, this.data});

  OTPVerificationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? sId;
  int? otp;

  Data({this.sId, this.otp});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['otp'] = this.otp;
    return data;
  }
}