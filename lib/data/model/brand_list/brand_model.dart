import 'package:meta/meta.dart';
import 'dart:convert';

List<List<BrandModel>> brandModelFromJson(String str) =>
    List<List<BrandModel>>.from(json.decode(str).map(
        (x) => List<BrandModel>.from(x.map((x) => BrandModel.fromJson(x)))));

String brandModelToJson(List<List<BrandModel>> data) =>
    json.encode(List<dynamic>.from(
        data.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))));

class BrandModel {
  BrandModel({
    required this.brandId,
    required this.attributeId,
    required this.name,
    required this.description,
    required this.urlKey,
    required this.logoPath,
    required this.sortOrder,
    required this.isActive,
    required this.isFeatured,
    required this.seoTitle,
    required this.seoDesc,
    required this.seoKeyword,
    required this.updatedAt,
    required this.createdAt,
  });

  String brandId;
  String attributeId;
  String name;
  String description;
  String urlKey;
  String logoPath;
  String sortOrder;
  String isActive;
  String isFeatured;
  String seoTitle;
  String seoDesc;
  String seoKeyword;
  DateTime updatedAt;
  DateTime createdAt;

  factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
        brandId: json["brand_id"],
        attributeId: json["attribute_id"],
        name: json["name"],
        description: json["description"],
        urlKey: json["url_key"],
        logoPath: json["logo_path"],
        sortOrder: json["sort_order"],
        isActive: json["is_active"],
        isFeatured: json["is_featured"],
        seoTitle: json["seo_title"],
        seoDesc: json["seo_desc"],
        seoKeyword: json["seo_keyword"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "brand_id": brandId,
        "attribute_id": attributeId,
        "name": name,
        "description": description,
        "url_key": urlKey,
        "logo_path": logoPath,
        "sort_order": sortOrder,
        "is_active": isActive,
        "is_featured": isFeatured,
        "seo_title": seoTitle,
        "seo_desc": seoDesc,
        "seo_keyword": seoKeyword,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
      };

  void add(BrandModel brand) {}
}
