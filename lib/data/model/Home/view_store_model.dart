// ignore: unused_import
import 'package:get/get.dart';

class ViewStoreModel {
  int? status;
  String? message;
  Data? data;

  ViewStoreModel({this.status, this.message, this.data});

  factory ViewStoreModel.fromJson(Map<String, dynamic> json) => ViewStoreModel(
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

  List<ViewStoreData>? storeData;
  State? state;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        storeData: json["store_data"] == null
            ? null
            : List<ViewStoreData>.from(
                json["store_data"].map((x) => ViewStoreData.fromJson(x))),
        state: json["state"] == null ? null : State.fromJson(json["state"]),
      );

  Map<String, dynamic> toJson() => {
        "store_data": storeData == null
            ? null
            : List<dynamic>.from(storeData!.map((x) => x.toJson())),
        "state": state == null ? null : state!.toJson(),
      };
}

class ViewStoreData {
  String? id;
  String? storeName;
  int? heart;
  int? smile;
  int? sad;
  int? angry;
  String? storeImage;
  String? categoryName;
  bool? isCollect;

  ViewStoreData({
    this.id,
    this.storeName,
    this.heart,
    this.smile,
    this.sad,
    this.angry,
    this.storeImage,
    this.categoryName,
    this.isCollect,
  });

  factory ViewStoreData.fromJson(Map<String, dynamic> json) => ViewStoreData(
        id: json["_id"] == null ? null : json["_id"],
        storeName: json["storeName"] == null ? null : json["storeName"],
        heart: json["heart"] == null ? null : json["heart"],
        smile: json["smile"] == null ? null : json["smile"],
        sad: json["sad"] == null ? null : json["sad"],
        angry: json["angry"] == null ? null : json["angry"],
        storeImage: json["storeImage"] == null ? null : json["storeImage"],
        categoryName:
            json["categoryName"] == null ? null : json["categoryName"],
        isCollect: json["isCollect"] == null ? null : json["isCollect"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "storeName": storeName == null ? null : storeName,
        "heart": heart == null ? null : heart,
        "smile": smile == null ? null : smile,
        "sad": sad == null ? null : sad,
        "angry": angry == null ? null : angry,
        "storeImage": storeImage == null ? null : storeImage,
        "categoryName": categoryName == null ? null : categoryName,
        "isCollect": isCollect == null ? null : isCollect,
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
