class HomeScreenSearchModel {
  int? status;
  String? message;
  Data? data;

  HomeScreenSearchModel({this.status, this.message, this.data});

  factory HomeScreenSearchModel.fromJson(Map<String, dynamic> json) =>
      HomeScreenSearchModel(
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
  List<SearchStoreData>? storeData;
  State? state;

  Data({this.storeData, this.state});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        storeData: json["store_data"] == null
            ? null
            : List<SearchStoreData>.from(
                json["store_data"].map((x) => SearchStoreData.fromJson(x))),
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
  int? page;
  int? limit;
  int? pageLimit;

  State({this.page, this.limit, this.pageLimit});

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

class SearchStoreData {
  String? id;
  dynamic location;
  String? storeName;
  String? description;
  dynamic totalRating;
  String? storeImage;
  String? categoryName;
  bool? isCollect;

  SearchStoreData(
      {this.id,
      this.location,
      this.storeName,
      this.description,
      this.totalRating,
      this.storeImage,
      this.categoryName,
      this.isCollect});

  factory SearchStoreData.fromJson(Map<String, dynamic> json) =>
      SearchStoreData(
        id: json["_id"] == null ? null : json["_id"],
        location: json["location"] == null ? null : json["location"],
        storeName: json["storeName"] == null ? null : json["storeName"],
        description: json["description"] == null ? null : json["description"],
        totalRating: json["totalRating"] == null ? null : json["totalRating"],
        storeImage: json["storeImage"] == null ? null : json["storeImage"],
        categoryName:
            json["categoryName"] == null ? null : json["categoryName"],
        isCollect: json["isCollect"] == null ? null : json["isCollect"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "location": location == null ? null : location!.toJson(),
        "storeName": storeName == null ? null : storeName,
        "description": description == null ? null : description,
        "totalRating": totalRating == null ? null : totalRating,
        "storeImage": storeImage == null ? null : storeImage,
        "categoryName": categoryName == null ? null : categoryName,
        "isCollect": isCollect == null ? null : isCollect,
      };
}

class Location {
  String? type;
  List<double>? coordinates;

  Location({this.type, this.coordinates});

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        type: json["type"] == null ? null : json["type"],
        coordinates: json["coordinates"] == null
            ? null
            : List<double>.from(json["coordinates"].map((x) => x.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "type": type == null ? null : type,
        "coordinates": coordinates == null
            ? null
            : List<dynamic>.from(coordinates!.map((x) => x)),
      };
}
