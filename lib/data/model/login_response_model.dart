import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
  LoginResponseModel({
    this.code,
    this.success,
    this.message,
    this.data,
    this.err,
  });

  int? code;
  bool? success;
  String? message;
  LoginData? data;
  Err? err;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
    code: json["code"],
    success: json["success"],
    message: json["message"],
    data: LoginData.fromJson(json["data"]),
    err: Err.fromJson(json["err"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "success": success,
    "message": message,
    "data": data!.toJson(),
    "err": err!.toJson(),
  };
}

class LoginData {
  LoginData({
    this.code,
  });

  String? code;

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
    code: json["otp"],
  );

  Map<String, dynamic> toJson() => {
    "otp": code,
  };
}

class Err {
  Err();

  factory Err.fromJson(Map<String, dynamic> json) => Err(
  );

  Map<String, dynamic> toJson() => {
  };
}