// To parse this JSON data, do
//
//     final storeConfigModel = storeConfigModelFromJson(jsonString);

// ignore_for_file: prefer_conditional_assignment, constant_identifier_names

import 'dart:convert';

List<StoreConfigModel> storeConfigModelFromJson(String str) => List<StoreConfigModel>.from(json.decode(str).map((x) => StoreConfigModel.fromJson(x)));

String storeConfigModelToJson(List<StoreConfigModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StoreConfigModel {
  StoreConfigModel({
    this.id,
    this.code,
    this.websiteId,
    this.locale,
    this.baseCurrencyCode,
    this.defaultDisplayCurrencyCode,
    this.timezone,
    this.weightUnit,
    this.baseUrl,
    this.baseLinkUrl,
    this.baseStaticUrl,
    this.baseMediaUrl,
    this.secureBaseUrl,
    this.secureBaseLinkUrl,
    this.secureBaseStaticUrl,
    this.secureBaseMediaUrl,
  });

  int? id;
  String? code;
  int? websiteId;
  String? locale;
  String? baseCurrencyCode;
  String? defaultDisplayCurrencyCode;
  String? timezone;
  String? weightUnit;
  String? baseUrl;
  String? baseLinkUrl;
  String? baseStaticUrl;
  String? baseMediaUrl;
  String? secureBaseUrl;
  String? secureBaseLinkUrl;
  String? secureBaseStaticUrl;
  String? secureBaseMediaUrl;

  factory StoreConfigModel.fromJson(Map<String, dynamic> json) => StoreConfigModel(
    id: json["id"],
    code: json["code"],
    websiteId: json["website_id"],
    locale: json["locale"],
    baseCurrencyCode: json["base_currency_code"],
    defaultDisplayCurrencyCode: json["default_display_currency_code"],
    timezone: json["timezone"],
    weightUnit: json["weight_unit"],
    baseUrl: json["base_url"],
    baseLinkUrl: json["base_link_url"],
    baseStaticUrl: json["base_static_url"],
    baseMediaUrl: json["base_media_url"],
    secureBaseUrl: json["secure_base_url"],
    secureBaseLinkUrl: json["secure_base_link_url"],
    secureBaseStaticUrl: json["secure_base_static_url"],
    secureBaseMediaUrl: json["secure_base_media_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "website_id": websiteId,
    "locale": locale,
    "base_currency_code": baseCurrencyCode,
    "default_display_currency_code": defaultDisplayCurrencyCode,
    "timezone": timezone,
    "weight_unit": weightUnit,
    "base_url": baseUrl,
    "base_link_url": baseLinkUrl,
    "base_static_url": baseStaticUrl,
    "base_media_url": baseMediaUrl,
    "secure_base_url": secureBaseUrl,
    "secure_base_link_url": secureBaseLinkUrl,
    "secure_base_static_url": secureBaseStaticUrl,
    "secure_base_media_url": secureBaseMediaUrl,
  };
}
