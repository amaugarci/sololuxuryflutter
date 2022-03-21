// To parse this JSON data, do
//
//     final signUpRequestModel = signUpRequestModelFromJson(jsonString);

import 'dart:convert';

SignUpRequestModel signUpRequestModelFromJson(String str) => SignUpRequestModel.fromJson(json.decode(str));

String signUpRequestModelToJson(SignUpRequestModel data) => json.encode(data.toJson());

class SignUpRequestModel {
  SignUpRequestModel({
    this.customer,
    this.password,
  });

  Customer? customer;
  String? password;

  factory SignUpRequestModel.fromJson(Map<String, dynamic> json) => SignUpRequestModel(
    customer: Customer.fromJson(json["customer"]),
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "customer": customer!.toJson(),
    "password": password,
  };
}

class Customer {
  Customer({
    this.email,
    this.firstname,
    this.lastname,
    this.websiteId,
    this.addresses,
    this.dob,
    this.extensionAttributes,
  });

  String? email;
  String? firstname;
  String? lastname;
  int? websiteId;
  List<AddressRequest>? addresses;
  String? dob;
  RequestExtensionAttributes? extensionAttributes;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    email: json["email"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    websiteId: json["website_id"],
    addresses: List<AddressRequest>.from(json["addresses"].map((x) => AddressRequest.fromJson(x))),
    dob: json["dob"],
    extensionAttributes: RequestExtensionAttributes.fromJson(json["extension_attributes"]),
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "firstname": firstname,
    "lastname": lastname,
    "website_id": websiteId,
    "addresses": List<dynamic>.from(addresses!.map((x) => x.toJson())),
    "dob": dob,
    "extension_attributes": extensionAttributes!.toJson(),
  };
}

class RequestExtensionAttributes {
  RequestExtensionAttributes({
    this.dom,
  });

  String? dom;

  factory RequestExtensionAttributes.fromJson(Map<String, dynamic> json) => RequestExtensionAttributes(
    dom: json["dom"],
  );

  Map<String, dynamic> toJson() => {
    "dom": dom,
  };
}


class AddressRequest {
  AddressRequest({
    this.defaultShipping,
    this.defaultBilling,
    this.firstname,
    this.lastname,
    this.region,
    this.postcode,
    this.street,
    this.city,
    this.telephone,
    this.countryId,
  });

  bool? defaultShipping;
  bool? defaultBilling;
  String? firstname;
  String? lastname;
  RegionRequest? region;
  String? postcode;
  List<String>? street;
  String? city;
  String? telephone;
  String? countryId;

  factory AddressRequest.fromJson(Map<String, dynamic> json) => AddressRequest(
    defaultShipping: json["defaultShipping"],
    defaultBilling: json["defaultBilling"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    region: RegionRequest.fromJson(json["region"]),
    postcode: json["postcode"],
    street: List<String>.from(json["street"].map((x) => x)),
    city: json["city"],
    telephone: json["telephone"],
    countryId: json["countryId"],
  );

  Map<String, dynamic> toJson() => {
    "defaultShipping": defaultShipping,
    "defaultBilling": defaultBilling,
    "firstname": firstname,
    "lastname": lastname,
    "region": region!.toJson(),
    "postcode": postcode,
    "street": List<dynamic>.from(street!.map((x) => x)),
    "city": city,
    "telephone": telephone,
    "countryId": countryId,
  };
}

class RegionRequest {
  RegionRequest({
    this.regionCode,
    this.region,
    this.regionId,
  });

  String? regionCode;
  String? region;
  int? regionId;

  factory RegionRequest.fromJson(Map<String, dynamic> json) => RegionRequest(
    regionCode: json["regionCode"],
    region: json["region"],
    regionId: json["regionId"],
  );

  Map<String, dynamic> toJson() => {
    "regionCode": regionCode,
    "region": region,
    "regionId": regionId,
  };
}
