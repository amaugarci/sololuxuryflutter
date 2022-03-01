class UpdateImageModel {
  int? status;
  String? message;
  Data? data;

  UpdateImageModel({this.status, this.message, this.data});

  factory UpdateImageModel.fromJson(Map<String, dynamic> json) =>
      UpdateImageModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "data": data == null ? null : data!.toJson(),
  };
}

class Data {
  String? image;
  Data({
    this.image,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    image: json["image"] == null ? null : json["image"],
  );

  Map<String, dynamic> toJson() => {
    "image": image == null ? null : image,
  };
}