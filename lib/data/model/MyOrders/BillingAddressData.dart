// To parse this JSON data, do
//
//     final billingAddressDataDart = billingAddressDataDartFromJson(jsonString);

import 'dart:convert';

List<BillingAddressDataDart> billingAddressDataDartFromJson(String str) =>
    List<BillingAddressDataDart>.from(
        json.decode(str).map((x) => BillingAddressDataDart.fromJson(x)));

String billingAddressDataDartToJson(List<BillingAddressDataDart> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BillingAddressDataDart {
  BillingAddressDataDart({
    required this.addressType,
    required this.city,
    required this.countryId,
    required this.email,
    required this.entityId,
    required this.firstname,
    required this.lastname,
    required this.parentId,
    required this.postcode,
    required this.region,
    required this.regionCode,
    required this.regionId,
    required this.street,
    required this.telephone,
  });

  String addressType;
  String city;
  String countryId;
  String email;
  int entityId;
  String firstname;
  String lastname;
  int parentId;
  String postcode;
  String region;
  String regionCode;
  int regionId;
  List<String> street;
  String telephone;

  factory BillingAddressDataDart.fromJson(Map<String, dynamic> json) =>
      BillingAddressDataDart(
        addressType: json["address_type"],
        city: json["city"],
        countryId: json["country_id"],
        email: json["email"],
        entityId: json["entity_id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        parentId: json["parent_id"],
        postcode: json["postcode"],
        region: json["region"],
        regionCode: json["region_code"],
        regionId: json["region_id"],
        street: List<String>.from(json["street"].map((x) => x)),
        telephone: json["telephone"],
      );

  Map<String, dynamic> toJson() => {
        "address_type": addressType,
        "city": city,
        "country_id": countryId,
        "email": email,
        "entity_id": entityId,
        "firstname": firstname,
        "lastname": lastname,
        "parent_id": parentId,
        "postcode": postcode,
        "region": region,
        "region_code": regionCode,
        "region_id": regionId,
        "street": List<dynamic>.from(street.map((x) => x)),
        "telephone": telephone,
      };
}
