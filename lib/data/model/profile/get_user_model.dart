class GetUserModel {
  int? status;
  String? message;
  Data? data;

  GetUserModel({this.status, this.message, this.data});

  GetUserModel.fromJson(Map<String, dynamic> json) {
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
  String? fullName;
  String? userName;
  String? email;
  String? phoneNumber;
  String? image;
  bool? isActive;
  bool? isBlock;
  String? sId;

  Data(
      {this.fullName,
      this.userName,
      this.email,
      this.phoneNumber,
      this.image,
      this.isActive,
      this.isBlock,
      this.sId});

  Data.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    userName = json['userName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    image = json['image'];
    isActive = json['isActive'];
    isBlock = json['isBlock'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullName'] = this.fullName;
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['image'] = this.image;
    data['isActive'] = this.isActive;
    data['isBlock'] = this.isBlock;
    data['_id'] = this.sId;
    return data;
  }
}
