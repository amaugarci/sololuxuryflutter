class StoreByCategoryIdModel {
  StoreByCategoryIdModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory StoreByCategoryIdModel.fromJson(Map<String, dynamic> json) =>
      StoreByCategoryIdModel(
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
  Data({
    this.storeData,
    this.state,
  });

  List<StoreDatum>? storeData;
  State? state;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        storeData: json["store_data"] == null
            ? null
            : List<StoreDatum>.from(
                json["store_data"].map((x) => StoreDatum.fromJson(x))),
        state: json["state"] == null ? null : State.fromJson(json["state"]),
      );

  Map<String, dynamic> toJson() => {
        "store_data": storeData == null
            ? null
            : List<dynamic>.from(storeData!.map((x) => x.toJson())),
        "state": state == null ? null : state!.toJson(),
      };
}

class State {
  State({
    this.page,
    this.limit,
    this.pageLimit,
  });

  int? page;
  int? limit;
  int? pageLimit;

  factory State.fromJson(Map<String, dynamic> json) => State(
        page: json["page"] == null ? null : json["page"],
        limit: json["limit"] == null ? null : json["limit"],
        pageLimit: json["page_limit"] == null ? null : json["page_limit"],
      );

  Map<String, dynamic> toJson() => {
        "page": page == null ? null : page,
        "limit": limit == null ? null : limit,
        "page_limit": pageLimit == null ? null : pageLimit,
      };
}

class StoreDatum {
  StoreDatum({
    this.id,
    this.storeName,
    this.description,
    this.totalRating,
    this.rating,
    this.storeImage,
    this.categoryName,
    this.isCollect,
  });

  String? id;
  String? storeName;
  String? description;
  dynamic totalRating;
  dynamic rating;
  String? storeImage;
  String? categoryName;
  bool? isCollect;

  factory StoreDatum.fromJson(Map<String, dynamic> json) => StoreDatum(
        id: json["_id"] == null ? null : json["_id"],
        storeName: json["storeName"] == null ? null : json["storeName"],
        description: json["description"] == null ? null : json["description"],
        totalRating: json["totalRating"] == null ? null : json["totalRating"],
        rating: json["rating"] == null ? null : json["rating"],
        storeImage: json["storeImage"] == null ? null : json["storeImage"],
        categoryName:
            json["categoryName"] == null ? null : json["categoryName"],
        isCollect: json["isCollect"] == null ? null : json["isCollect"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "storeName": storeName == null ? null : storeName,
        "description": description == null ? null : description,
        "totalRating": totalRating == null ? null : totalRating,
        "rating": rating == null ? null : rating,
        "storeImage": storeImage == null ? null : storeImage,
        "categoryName": categoryName == null ? null : categoryName,
        "isCollect": isCollect == null ? null : isCollect,
      };
}
