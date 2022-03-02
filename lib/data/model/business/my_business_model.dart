class MyBusinessModel {
  MyBusinessModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  List<MyBusinessData>? data;

  factory MyBusinessModel.fromJson(Map<String, dynamic> json) =>
      MyBusinessModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : List<MyBusinessData>.from(
            json["data"].map((x) => MyBusinessData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "data": data == null
        ? null
        : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class MyBusinessData {
  MyBusinessData({
    this.id,
    this.location,
    this.storeName,
    this.description,
    this.phoneNumber,
    this.webLink,
    this.email,
    this.facebook,
    this.twitter,
    this.googlePlus,
    this.keyword,
    this.amenity,
    this.storeOwnerId,
    this.categoryId,
    this.storeImages,
    this.address,
    this.state,
    this.city,
    this.country,
    this.zipCode,
    this.heart,
    this.smile,
    this.sad,
    this.angry,
    this.totalRating,
    this.rating,
    this.isActive,
    this.isEnable,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.paymentMethods,
    this.instagram,
    this.category,
    this.status,
    this.isDeliveryAvailable,
  });

  String? id;
  Location? location;
  String? storeName;
  String? description;
  String? phoneNumber;
  String? webLink;
  String? email;
  String? facebook;
  String? twitter;
  String? googlePlus;
  List<String>? keyword;
  List<String>? amenity;
  String? storeOwnerId;
  List<dynamic>? categoryId;
  List<String>? storeImages;
  String? address;
  String? state;
  String? city;
  String? country;
  String? zipCode;
  int? heart;
  int? smile;
  int? sad;
  int? angry;
  int? totalRating;
  String? status;
  double? rating;
  bool? isActive;
  bool? isEnable;
  String? createdBy;
  String? updatedBy;
  String? createdAt;
  String? updatedAt;
  int? v;
  List<String>? paymentMethods;
  String? instagram;
  List<Category>? category;
  bool? isDeliveryAvailable;

  factory MyBusinessData.fromJson(Map<String, dynamic> json) => MyBusinessData(
    id: json["_id"] == null ? null : json["_id"],
    location: json["location"] == null
        ? null
        : Location.fromJson(json["location"]),
    storeName: json["storeName"] == null ? null : json["storeName"],
    description: json["description"] == null ? null : json["description"],
    phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
    webLink: json["webLink"] == null ? null : json["webLink"],
    email: json["email"] == null ? null : json["email"],
    facebook: json["facebook"] == null ? null : json["facebook"],
    twitter: json["twitter"] == null ? null : json["twitter"],
    googlePlus: json["googlePlus"] == null ? null : json["googlePlus"],
    keyword: json["keyword"] == null
        ? null
        : List<String>.from(json["keyword"].map((x) => x)),
    amenity: json["amenity"] == null
        ? null
        : List<String>.from(json["amenity"].map((x) => x)),
    storeOwnerId:
    json["storeOwnerId"] == null ? null : json["storeOwnerId"],
    categoryId: json["categoryId"] == null ? null : json["categoryId"],
    storeImages: json["storeImages"] == null
        ? null
        : List<String>.from(json["storeImages"].map((x) => x)),
    address: json["address"] == null ? null : json["address"],
    state: json["state"] == null ? null : json["state"],
    city: json["city"] == null ? null : json["city"],
    country: json["country"] == null ? null : json["country"],
    zipCode: json["zipCode"] == null ? null : json["zipCode"],
    heart: json["heart"] == null ? null : json["heart"],
    smile: json["smile"] == null ? null : json["smile"],
    sad: json["sad"] == null ? null : json["sad"],
    angry: json["angry"] == null ? null : json["angry"],
    totalRating: json["totalRating"] == null ? null : json["totalRating"],
    rating: json["rating"] == null ? null : json["rating"].toDouble(),
    isActive: json["isActive"] == null ? null : json["isActive"],
    isEnable: json["isEnable"] == null ? null : json["isEnable"],
    createdBy: json["createdBy"] == null ? null : json["createdBy"],
    updatedBy: json["updatedBy"] == null ? null : json["updatedBy"],
    createdAt: json["createdAt"] == null
        ? null
        : DateTime.parse(json["createdAt"]).toString(),
    updatedAt: json["updatedAt"] == null
        ? null
        : DateTime.parse(json["updatedAt"]).toString(),
    v: json["__v"] == null ? null : json["__v"],
    paymentMethods: json["paymentMethods"] == null
        ? null
        : List<String>.from(json["paymentMethods"].map((x) => x)),
    instagram: json["instagram"] == null ? null : json["instagram"],
    status: json["status"] == null ? null : json["status"],
    isDeliveryAvailable: json['isDeliveryAvailable'] == null
        ? null
        : json["isDeliveryAvailable"],
    category: json["category"] == null
        ? null
        : List<Category>.from(
        json["category"].map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id,
    "location": location == null ? null : location!.toJson(),
    "storeName": storeName == null ? null : storeName,
    "description": description == null ? null : description,
    "phoneNumber": phoneNumber == null ? null : phoneNumber,
    "webLink": webLink == null ? null : webLink,
    "email": email == null ? null : email,
    "facebook": facebook == null ? null : facebook,
    "twitter": twitter == null ? null : twitter,
    "googlePlus": googlePlus == null ? null : googlePlus,
    "keyword":
    keyword == null ? null : List<dynamic>.from(keyword!.map((x) => x)),
    "amenity":
    amenity == null ? null : List<dynamic>.from(amenity!.map((x) => x)),
    "storeOwnerId": storeOwnerId == null ? null : storeOwnerId,
    "categoryId": categoryId == null ? null : categoryId,
    "storeImages": storeImages == null
        ? null
        : List<dynamic>.from(storeImages!.map((x) => x)),
    "address": address == null ? null : address,
    "state": state == null ? null : state,
    "city": city == null ? null : city,
    "country": country == null ? null : country,
    "zipCode": zipCode == null ? null : zipCode,
    "heart": heart == null ? null : heart,
    "smile": smile == null ? null : smile,
    "sad": sad == null ? null : sad,
    "angry": angry == null ? null : angry,
    "totalRating": totalRating == null ? null : totalRating,
    "rating": rating == null ? null : rating,
    "isActive": isActive == null ? null : isActive,
    "isEnable": isEnable == null ? null : isEnable,
    "createdBy": createdBy == null ? null : createdBy,
    "updatedBy": updatedBy == null ? null : updatedBy,
    "createdAt": createdAt == null ? null : createdAt.toString(),
    "updatedAt": updatedAt == null ? null : updatedAt.toString(),
    "__v": v == null ? null : v,
    "paymentMethods": paymentMethods == null
        ? null
        : List<dynamic>.from(paymentMethods!.map((x) => x)),
    "instagram": instagram == null ? null : instagram,
    "status": status == null ? null : status,
    "isDeliveryAvailable":
    isDeliveryAvailable == null ? null : isDeliveryAvailable,
    "category": category == null
        ? null
        : List<dynamic>.from(category!.map((x) => x.toJson())),
  };
}

class Category {
  Category({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["_id"] == null ? null : json["_id"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id,
    "name": name == null ? null : name,
  };
}

class Location {
  Location({
    this.type,
    this.coordinates,
  });

  String? type;
  List<double>? coordinates;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    type: json["type"] == null ? null : json["type"],
    coordinates: json["coordinates"] == null
        ? null
        : List<double>.from(json["coordinates"].map((x) => x.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "type": type == null ? null : type,
    "coordinates": coordinates == null
        ? null
        : List<dynamic>.from(coordinates!.map((x) => x)),
  };
}