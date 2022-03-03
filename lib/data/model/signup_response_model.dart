// To parse this JSON data, do
//
//     final signUpResponseModel = signUpResponseModelFromJson(jsonString);

import 'dart:convert';

SignUpResponseModel signUpResponseModelFromJson(String str) => SignUpResponseModel.fromJson(json.decode(str));

String signUpResponseModelToJson(SignUpResponseModel data) => json.encode(data.toJson());

class SignUpResponseModel {
  SignUpResponseModel({
    this.id,
    this.groupId,
    this.defaultBilling,
    this.defaultShipping,
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
  });

  int? id;
  int? groupId;
  String? defaultBilling;
  String? defaultShipping;
  String? createdAt;
  String? updatedAt;
  String? createdIn;
  String? email;
  String? firstname;
  String? lastname;
  int? storeId;
  int? websiteId;
  List<Address>? addresses;
  int? disableAutoGroupChange;
  ExtensionAttributes? extensionAttributes;

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) => SignUpResponseModel(
    id: json["id"],
    groupId: json["group_id"],
    defaultBilling: json["default_billing"],
    defaultShipping: json["default_shipping"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    createdIn: json["created_in"],
    email: json["email"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    storeId: json["store_id"],
    websiteId: json["website_id"],
    addresses: json["addresses"] == null ? [] : List<Address>.from(json["addresses"].map((x) => Address.fromJson(x))),
    disableAutoGroupChange: json["disable_auto_group_change"],
    extensionAttributes: json["extension_attributes"] == null ? ExtensionAttributes() : ExtensionAttributes.fromJson(json["extension_attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "group_id": groupId,
    "default_billing": defaultBilling,
    "default_shipping": defaultShipping,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "created_in": createdIn,
    "email": email,
    "firstname": firstname,
    "lastname": lastname,
    "store_id": storeId,
    "website_id": websiteId,
    "addresses": List<dynamic>.from(addresses!.map((x) => x.toJson())),
    "disable_auto_group_change": disableAutoGroupChange,
    "extension_attributes": extensionAttributes!.toJson(),
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
    this.defaultShipping,
    this.defaultBilling,
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
  bool? defaultShipping;
  bool? defaultBilling;

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
    defaultShipping: json["default_shipping"],
    defaultBilling: json["default_billing"],
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
    "default_shipping": defaultShipping,
    "default_billing": defaultBilling,
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

  factory ExtensionAttributes.fromJson(Map<String, dynamic> json) => ExtensionAttributes(
    isSubscribed: json["is_subscribed"],
  );

  Map<String, dynamic> toJson() => {
    "is_subscribed": isSubscribed,
  };
}
