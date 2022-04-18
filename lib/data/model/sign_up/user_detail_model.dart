// To parse this JSON data, do
//
//     final userDetail = userDetailFromJson(jsonString);

import 'dart:convert';

UserDetail userDetailFromJson(String str) => UserDetail.fromJson(json.decode(str));

String userDetailToJson(UserDetail data) => json.encode(data.toJson());

class UserDetail {
  UserDetail({
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
  DateTime? dob;
  String? email;
  String? firstname;
  String? lastname;
  int? storeId;
  int? websiteId;
  List<dynamic>? addresses;
  int? disableAutoGroupChange;
  ExtensionAttributes? extensionAttributes;
  List<CustomAttribute>? customAttributes;

  factory UserDetail.fromJson(Map<String, dynamic> json) => UserDetail(
    id: json["id"],
    groupId: json["group_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    createdIn: json["created_in"],
    dob: DateTime.parse(json["dob"]),
    email: json["email"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    storeId: json["store_id"],
    websiteId: json["website_id"],
    addresses: List<dynamic>.from(json["addresses"].map((x) => x)),
    disableAutoGroupChange: json["disable_auto_group_change"],
    extensionAttributes: ExtensionAttributes.fromJson(json["extension_attributes"]),
    customAttributes: List<CustomAttribute>.from(json["custom_attributes"].map((x) => CustomAttribute.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "group_id": groupId,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "created_in": createdIn,
    "dob": "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
    "email": email,
    "firstname": firstname,
    "lastname": lastname,
    "store_id": storeId,
    "website_id": websiteId,
    "addresses": List<dynamic>.from(addresses!.map((x) => x)),
    "disable_auto_group_change": disableAutoGroupChange,
    "extension_attributes": extensionAttributes!.toJson(),
    "custom_attributes": List<dynamic>.from(customAttributes!.map((x) => x.toJson())),
  };
}

class CustomAttribute {
  CustomAttribute({
    this.attributeCode,
    this.value,
  });

  String? attributeCode;
  String? value;

  factory CustomAttribute.fromJson(Map<String, dynamic> json) => CustomAttribute(
    attributeCode: json["attribute_code"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "attribute_code": attributeCode,
    "value": value,
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
