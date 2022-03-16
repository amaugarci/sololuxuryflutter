import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

List<List<BrandData>> brandDataFromJson(String str) =>
    List<List<BrandData>>.from(json
        .decode(str)
        .map((x) => List<BrandData>.from(x.map((x) => BrandData.fromJson(x)))));

String brandDataToJson(List<List<BrandData>> data) =>
    json.encode(List<dynamic>.from(
        data.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))));

class BrandData {
  BrandData({
    this.brandId,
    this.attributeId,
    this.name,
    this.description,
    this.urlKey,
    this.logoPath,
    this.sortOrder,
    this.isActive,
    this.isFeatured,
    this.seoTitle,
    this.seoDesc,
    this.seoKeyword,
    this.updatedAt,
    this.createdAt,
  });

  String? brandId;
  String? attributeId;
  String? name;
  String? description;
  String? urlKey;
  String? logoPath;
  String? sortOrder;
  String? isActive;
  String? isFeatured;
  String? seoTitle;
  String? seoDesc;
  String? seoKeyword;
  DateTime? updatedAt;
  DateTime? createdAt;

  factory BrandData.fromJson(Map<String, dynamic> json) => BrandData(
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
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
      };

  void add(BrandData brand) {}
}
