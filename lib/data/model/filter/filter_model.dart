// To parse this JSON data, do
//
//     final filterModel = filterModelFromJson(jsonString);

import 'dart:convert';

import 'package:get/get.dart';

List<FilterModel> filterModelFromJson(String str) =>
    List<FilterModel>.from(json.decode(str).map((x) => FilterModel.fromJson(x)));

String filterModelToJson(List<FilterModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FilterModel {
  FilterModel({
    this.attrCode,
    this.attrLabel,
    this.category,
    this.minPrice,
    this.maxPrice,
  });

  String? attrCode;
  String? attrLabel;
  List<Category>? category;
  double? minPrice;
  double? maxPrice;

  factory FilterModel.fromJson(Map<String, dynamic> json) => FilterModel(
        attrCode: json["attr_code"],
        attrLabel: json["attr_label"],
        category: List<Category>.from(json["values"].map((x) => Category.fromJson(x))),
        minPrice: json["min_price"] == null ? null : json["min_price"].toDouble(),
        maxPrice: json["max_price"] == null ? null : json["max_price"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "attr_code": attrCode,
        "attr_label": attrLabel,
        "values": List<dynamic>.from(category!.map((x) => x.toJson())),
        "min_price": minPrice == null ? null : minPrice,
        "max_price": maxPrice == null ? null : maxPrice,
      };
}

class Category {
  Category({this.display, this.value, this.count, isSelected});

  String? display;
  String? value;
  String? count;
  RxBool isSelected = false.obs;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        display: json["display"],
        value: json["value"],
        count: json["count"],
        isSelected: json["is_selected"],
      );

  Map<String, dynamic> toJson() => {
        "display": display,
        "value": value,
        "count": count,
        "is_selected": isSelected,
      };
}
