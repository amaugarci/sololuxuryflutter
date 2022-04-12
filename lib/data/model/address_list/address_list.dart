// To parse this JSON data, do
//
//     final addressListModel = addressListModelFromJson(jsonString);

import 'dart:convert';

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
    this.dob,
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
  dynamic dob;
  String? email;
  String? firstname;
  String? lastname;
  int? storeId;
  int? websiteId;
  List<Address>? addresses;
  int? disableAutoGroupChange;
  ExtensionAttributes? extensionAttributes;
  List<dynamic>? customAttributes;

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
        dob: json["dob"] == null ? null : json["dob"],
        email: json["email"] == null ? null : json["email"],
        firstname: json["firstname"] == null ? null : json["firstname"],
        lastname: json["lastname"] == null ? null : json["lastname"],
        storeId: json["store_id"] == null ? null : json["store_id"],
        websiteId: json["website_id"] == null ? null : json["website_id"],
        addresses: json["addresses"] == null
            ? null
            : List<Address>.from(json["addresses"].map((x) => x)),
        disableAutoGroupChange: json["disable_auto_group_change"] == null
            ? null
            : json["disable_auto_group_change"],
        extensionAttributes: json["extension_attributes"] == null
            ? null
            : ExtensionAttributes.fromJson(json["extension_attributes"]),
        customAttributes: json["custom_attributes"] == null
            ? null
            : List<dynamic>.from(json["custom_attributes"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "group_id": groupId == null ? null : groupId,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "created_in": createdIn == null ? null : createdIn,
        "dob": dob == null ? null : dob,
        "email": email == null ? null : email,
        "firstname": firstname == null ? null : firstname,
        "lastname": lastname == null ? null : lastname,
        "store_id": storeId == null ? null : storeId,
        "website_id": websiteId == null ? null : websiteId,
        "addresses": addresses == null
            ? null
            : List<Address>.from(addresses!.map((x) => x)),
        "disable_auto_group_change":
            disableAutoGroupChange == null ? null : disableAutoGroupChange,
        "extension_attributes":
            extensionAttributes == null ? null : extensionAttributes!.toJson(),
        "custom_attributes": customAttributes == null
            ? null
            : List<dynamic>.from(customAttributes!.map((x) => x)),
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

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        customerId: json["customer_id"],
        region: Region.fromJson(json["region"]),
        regionId: json["region_id"],
        countryId: json["country_id"],
        street: List<String>.from(json["street"].map((x) => x)),
        telephone: json["telephone"],
        postcode: json["postcode"],
        city: json["city"],
        firstname: json["firstname"],
        lastname: json["lastname"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "region": region!.toJson(),
        "region_id": regionId,
        "country_id": countryId,
        "street": List<dynamic>.from(street!.map((x) => x)),
        "telephone": telephone,
        "postcode": postcode,
        "city": city,
        "firstname": firstname,
        "lastname": lastname,
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
        regionCode: json["region_code"],
        region: json["region"],
        regionId: json["region_id"],
      );

  Map<String, dynamic> toJson() => {
        "region_code": regionCode,
        "region": region,
        "region_id": regionId,
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
