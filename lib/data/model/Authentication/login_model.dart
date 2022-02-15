class LoginModel {
  int? status;
  String? message;
  LoginData? data;

  LoginModel({
    this.status,
    this.message,
    this.data,
  });

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new LoginData.fromJson(json['data']) : null;
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

class LoginData {
  String? phoneNumber;
  int? userType;
  String? sId;
  String? email;
  String? image;
  String? token;
  String? refreshToken;
  bool? isEmailVerified;

  LoginData(
      {this.phoneNumber,
      this.userType,
      this.sId,
      this.email,
      this.image,
      this.token,
      this.isEmailVerified,
      this.refreshToken});

  LoginData.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phoneNumber'];
    userType = json['userType'];
    sId = json['_id'];
    email = json['email'];
    image = json['image'];
    token = json['token'];
    refreshToken = json['refresh_token'];
    isEmailVerified = json['isEmailVerified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phoneNumber'] = this.phoneNumber;
    data['userType'] = this.userType;
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['image'] = this.image;
    data['token'] = this.token;
    data['refresh_token'] = this.refreshToken;
    data['isEmailVerified'] = this.isEmailVerified;
    return data;
  }
}
