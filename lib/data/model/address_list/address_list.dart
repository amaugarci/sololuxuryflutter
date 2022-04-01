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
  DateTime? createdAt;
  DateTime? updatedAt;
  String? createdIn;
  String? email;
  String? firstname;
  String? lastname;
  int? storeId;
  int? websiteId;
  List<dynamic>? addresses;
  int? disableAutoGroupChange;
  ExtensionAttributes? extensionAttributes;

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
            : List<dynamic>.from(json["addresses"].map((x) => x)),
        disableAutoGroupChange: json["disable_auto_group_change"] == null
            ? null
            : json["disable_auto_group_change"],
        extensionAttributes: json["extension_attributes"] == null
            ? null
            : ExtensionAttributes.fromJson(json["extension_attributes"]),
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
            : List<dynamic>.from(addresses!.map((x) => x)),
        "disable_auto_group_change":
            disableAutoGroupChange == null ? null : disableAutoGroupChange,
        "extension_attributes":
            extensionAttributes == null ? null : extensionAttributes!.toJson(),
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
