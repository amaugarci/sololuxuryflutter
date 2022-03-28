import 'dart:convert';

List<StoreViewsModel> storeViewsModelFromJson(String str) => List<StoreViewsModel>.from(json.decode(str).map((x) => StoreViewsModel.fromJson(x)));

String storeViewsModelToJson(List<StoreViewsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StoreViewsModel {
  StoreViewsModel({
    this.id,
    this.code,
    this.name,
    this.websiteId,
    this.storeGroupId,
    this.isActive,
  });

  int? id;
  String? code;
  String? name;
  int? websiteId;
  int? storeGroupId;
  int? isActive;

  factory StoreViewsModel.fromJson(Map<String, dynamic> json) => StoreViewsModel(
    id: json["id"],
    code: json["code"],
    name: json["name"],
    websiteId: json["website_id"],
    storeGroupId: json["store_group_id"],
    isActive: json["is_active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "name": name,
    "website_id": websiteId,
    "store_group_id": storeGroupId,
    "is_active": isActive,
  };
}
