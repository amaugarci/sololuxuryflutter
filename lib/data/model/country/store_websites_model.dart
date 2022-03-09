// To parse this JSON data, do
//
//     final storeWebSitesModel = storeWebSitesModelFromJson(jsonString);

import 'dart:convert';

List<StoreWebSitesModel> storeWebSitesModelFromJson(String str) => List<StoreWebSitesModel>.from(json.decode(str).map((x) => StoreWebSitesModel.fromJson(x)));

String storeWebSitesModelToJson(List<StoreWebSitesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StoreWebSitesModel {
  StoreWebSitesModel({
    this.id,
    this.code,
    this.name,
    this.defaultGroupId,
  });

  int? id;
  String? code;
  String? name;
  int? defaultGroupId;

  factory StoreWebSitesModel.fromJson(Map<String, dynamic> json) => StoreWebSitesModel(
    id: json["id"],
    code: json["code"],
    name: json["name"],
    defaultGroupId: json["default_group_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "name": name,
    "default_group_id": defaultGroupId,
  };
}
