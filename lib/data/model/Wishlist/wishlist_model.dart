// To parse this JSON data, do
//
//     final wishListProductModel = wishListProductModelFromJson(jsonString);

import 'dart:convert';

WishListProductModel wishListProductModelFromJson(String str) => WishListProductModel.fromJson(json.decode(str));

String wishListProductModelToJson(WishListProductModel data) => json.encode(data.toJson());

class WishListProductModel {
  WishListProductModel({
    this.itemsCount,
    this.items,
  });

  int? itemsCount;
  List<Item>? items;

  factory WishListProductModel.fromJson(Map<String, dynamic> json) => WishListProductModel(
    itemsCount: json["items_count"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "items_count": itemsCount,
    "items": List<dynamic>.from(items!.map((x) => x.toJson())),
  };
}

class Item {
  Item({
    this.id,
    this.product,
  });

  int? id;
  Product? product;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    product: Product.fromJson(json["product"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product": product!.toJson(),
  };
}

class Product {
  Product({
    this.id,
    this.sku,
    this.name,
    this.attributeSetId,
    this.price,
    this.status,
    this.visibility,
    this.typeId,
    this.createdAt,
    this.updatedAt,
    this.productLinks,
    this.tierPrices,
    this.customAttributes,
  });

  int? id;
  String? sku;
  String? name;
  int? attributeSetId;
  int? price;
  int? status;
  int? visibility;
  String? typeId;
  String? createdAt;
  String? updatedAt;
  List<dynamic>? productLinks;
  List<dynamic>? tierPrices;
  List<CustomAttribute>? customAttributes;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    sku: json["sku"],
    name: json["name"],
    attributeSetId: json["attribute_set_id"],
    price: json["price"],
    status: json["status"],
    visibility: json["visibility"],
    typeId: json["type_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    productLinks: List<dynamic>.from(json["product_links"].map((x) => x)),
    tierPrices: List<dynamic>.from(json["tier_prices"].map((x) => x)),
    customAttributes: List<CustomAttribute>.from(json["custom_attributes"].map((x) => CustomAttribute.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sku": sku,
    "name": name,
    "attribute_set_id": attributeSetId,
    "price": price,
    "status": status,
    "visibility": visibility,
    "type_id": typeId,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "product_links": List<dynamic>.from(productLinks!.map((x) => x)),
    "tier_prices": List<dynamic>.from(tierPrices!.map((x) => x)),
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
