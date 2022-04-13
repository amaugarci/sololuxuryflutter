// To parse this JSON data, do
//
//     final addressListModel = addressListModelFromJson(jsonString);

import 'dart:convert';

import 'package:get/get.dart';

AddressListModel addressListModelFromJson(String str) =>
    AddressListModel.fromJson(json.decode(str));

String addressListModelToJson(AddressListModel data) =>
    json.encode(data.toJson());

class AddressListModel {
  AddressListModel({
    this.id,
    this.groupId,
    this.createdAt,
    this.updatedAt,
    this.createdIn,
    this.email,
    this.firstname,
    this.lastname,
    this.storeId,
    this.websiteId,
    this.addresses,
    this.disableAutoGroupChange,
    this.extensionAttributes,
    this.customAttributes,
  });

  int? id;
  int? groupId;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? createdIn;
  String? email;
  String? firstname;
  String? lastname;
  int? storeId;
  int? websiteId;
  List<Address>? addresses;
  int? disableAutoGroupChange;
  ExtensionAttributes? extensionAttributes;
  List<CustomAttribute>? customAttributes;

  factory AddressListModel.fromJson(Map<String, dynamic> json) =>
      AddressListModel(
        id: json["id"] == null ? null : json["id"],
        groupId: json["group_id"] == null ? null : json["group_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdIn: json["created_in"] == null ? null : json["created_in"],
        email: json["email"] == null ? null : json["email"],
        firstname: json["firstname"] == null ? null : json["firstname"],
        lastname: json["lastname"] == null ? null : json["lastname"],
        storeId: json["store_id"] == null ? null : json["store_id"],
        websiteId: json["website_id"] == null ? null : json["website_id"],
        addresses: json["addresses"] == null
            ? null
            : List<Address>.from(
                json["addresses"].map((x) => Address.fromJson(x))),
        disableAutoGroupChange: json["disable_auto_group_change"] == null
            ? null
            : json["disable_auto_group_change"],
        extensionAttributes: json["extension_attributes"] == null
            ? null
            : ExtensionAttributes.fromJson(json["extension_attributes"]),
        customAttributes: json["custom_attributes"] == null
            ? null
            : List<CustomAttribute>.from(json["custom_attributes"]
                .map((x) => CustomAttribute.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "group_id": groupId == null ? null : groupId,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "created_in": createdIn == null ? null : createdIn,
        "email": email == null ? null : email,
        "firstname": firstname == null ? null : firstname,
        "lastname": lastname == null ? null : lastname,
        "store_id": storeId == null ? null : storeId,
        "website_id": websiteId == null ? null : websiteId,
        "addresses": addresses == null
            ? null
            : List<dynamic>.from(addresses!.map((x) => x.toJson())),
        "disable_auto_group_change":
            disableAutoGroupChange == null ? null : disableAutoGroupChange,
        "extension_attributes":
            extensionAttributes == null ? null : extensionAttributes!.toJson(),
        "custom_attributes": customAttributes == null
            ? null
            : List<dynamic>.from(customAttributes!.map((x) => x.toJson())),
      };
}

class Address {
  Address({
    this.id,
    this.customerId,
    this.region,
    this.regionId,
    this.countryId,
    this.street,
    this.telephone,
    this.postcode,
    this.city,
    this.firstname,
    this.lastname,
  });

  int? id;
  int? customerId;
  Region? region;
  int? regionId;
  String? countryId;
  List<String>? street;
  String? telephone;
  String? postcode;
  String? city;
  String? firstname;
  String? lastname;
  RxBool isBinding = false.obs;
  RxBool isShiipng = false.obs;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"] == null ? null : json["id"],
        customerId: json["customer_id"] == null ? null : json["customer_id"],
        region: json["region"] == null ? null : Region.fromJson(json["region"]),
        regionId: json["region_id"] == null ? null : json["region_id"],
        countryId: json["country_id"] == null ? null : json["country_id"],
        street: json["street"] == null
            ? null
            : List<String>.from(json["street"].map((x) => x)),
        telephone: json["telephone"] == null ? null : json["telephone"],
        postcode: json["postcode"] == null ? null : json["postcode"],
        city: json["city"] == null ? null : json["city"],
        firstname: json["firstname"] == null ? null : json["firstname"],
        lastname: json["lastname"] == null ? null : json["lastname"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "customer_id": customerId == null ? null : customerId,
        "region": region == null ? null : region!.toJson(),
        "region_id": regionId == null ? null : regionId,
        "country_id": countryId == null ? null : countryId,
        "street":
            street == null ? null : List<dynamic>.from(street!.map((x) => x)),
        "telephone": telephone == null ? null : telephone,
        "postcode": postcode == null ? null : postcode,
        "city": city == null ? null : city,
        "firstname": firstname == null ? null : firstname,
        "lastname": lastname == null ? null : lastname,
      };
}

class Region {
  Region({
    this.regionCode,
    this.region,
    this.regionId,
  });

  String? regionCode;
  String? region;
  int? regionId;

  factory Region.fromJson(Map<String, dynamic> json) => Region(
        regionCode: json["region_code"] == null ? null : json["region_code"],
        region: json["region"] == null ? null : json["region"],
        regionId: json["region_id"] == null ? null : json["region_id"],
      );

  Map<String, dynamic> toJson() => {
        "region_code": regionCode == null ? null : regionCode,
        "region": region == null ? null : region,
        "region_id": regionId == null ? null : regionId,
      };
}

class CustomAttribute {
  CustomAttribute({
    this.attributeCode,
    this.value,
  });

  String? attributeCode;
  String? value;

  factory CustomAttribute.fromJson(Map<String, dynamic> json) =>
      CustomAttribute(
        attributeCode:
            json["attribute_code"] == null ? null : json["attribute_code"],
        value: json["value"] == null ? null : json["value"],
      );

  Map<String, dynamic> toJson() => {
        "attribute_code": attributeCode == null ? null : attributeCode,
        "value": value == null ? null : value,
      };
}

class ExtensionAttributes {
  ExtensionAttributes({
    this.isSubscribed,
  });

  bool? isSubscribed;

  factory ExtensionAttributes.fromJson(Map<String, dynamic> json) =>
      ExtensionAttributes(
        isSubscribed:
            json["is_subscribed"] == null ? null : json["is_subscribed"],
      );

  Map<String, dynamic> toJson() => {
        "is_subscribed": isSubscribed == null ? null : isSubscribed,
      };
}
