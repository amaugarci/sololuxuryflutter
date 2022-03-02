class GetCollectionModel {
  GetCollectionModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory GetCollectionModel.fromJson(Map<String, dynamic> json) =>
      GetCollectionModel(
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
    this.collectionData,
    this.state,
  });

  List<CollectionData>? collectionData;
  State? state;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    collectionData: json["collection_data"] == null
        ? null
        : List<CollectionData>.from(
        json["collection_data"].map((x) => CollectionData.fromJson(x))),
    state: json["state"] == null ? null : State.fromJson(json["state"]),
  );

  Map<String, dynamic> toJson() => {
    "collection_data": collectionData == null
        ? null
        : List<dynamic>.from(collectionData!.map((x) => x.toJson())),
    "state": state == null ? null : state!.toJson(),
  };
}

class CollectionData {
  CollectionData({
    this.id,
    this.store,
  });

  String? id;
  List<Store>? store;

  factory CollectionData.fromJson(Map<String, dynamic> json) => CollectionData(
    id: json["_id"] == null ? null : json["_id"],
    store: json["store"] == null
        ? null
        : List<Store>.from(json["store"].map((x) => Store.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id,
    "store": store == null
        ? null
        : List<dynamic>.from(store!.map((x) => x.toJson())),
  };
}

class Store {
  Store({
    this.id,
    this.storeName,
    this.description,
    this.totalRating,
    this.rating,
    this.storeImage,
    this.categoryName,
  });

  String? id;
  String? storeName;
  String? description;
  dynamic totalRating;
  dynamic rating;
  String? storeImage;
  String? categoryName;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    id: json["_id"] == null ? null : json["_id"],
    storeName: json["storeName"] == null ? null : json["storeName"],
    description: json["description"] == null ? null : json["description"],
    totalRating: json["totalRating"] == null ? null : json["totalRating"],
    rating: json["rating"] == null ? null : json["rating"],
    storeImage: json["storeImage"] == null ? null : json["storeImage"],
    categoryName:
    json["categoryName"] == null ? null : json["categoryName"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id,
    "storeName": storeName == null ? null : storeName,
    "description": description == null ? null : description,
    "totalRating": totalRating == null ? null : totalRating,
    "rating": rating == null ? null : rating,
    "storeImage": storeImage == null ? null : storeImage,
    "categoryName": categoryName == null ? null : categoryName,
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