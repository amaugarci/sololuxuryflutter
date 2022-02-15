class GetCategoryModel {
  GetCategoryModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  List<CategoryData>? data;

  factory GetCategoryModel.fromJson(Map<String, dynamic> json) =>
      GetCategoryModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : List<CategoryData>.from(
                json["data"].map((x) => CategoryData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class CategoryData {
  CategoryData({
    this.image,
    this.backgroundImage,
    this.id,
    this.name,
  });

  String? image;
  String? backgroundImage;
  String? id;
  String? name;

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
        image: json["image"] == null ? null : json["image"],
        backgroundImage:
            json["backgroundImage"] == null ? null : json["backgroundImage"],
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "image": image == null ? null : image,
        "backgroundImage": backgroundImage == null ? null : backgroundImage,
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
      };
}
