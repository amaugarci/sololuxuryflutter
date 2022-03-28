import 'dart:convert';

RecommendedProductModel recommendedProductResponseModelFromJson(String str) =>
    RecommendedProductModel.fromJson(json.decode(str));

String recommendedProductResponseModelToJson(RecommendedProductModel data) =>
    json.encode(data.toJson());

class RecommendedProductModel {
  String? productId;
  String? sku;
  String? typeId;
  String? name;
  String? productUrl;
  String? imageUrl;
  String? brandName;
  String? price;
  String? status;
  int? storeId;

  RecommendedProductModel(
      {this.productId,
      this.sku,
      this.typeId,
      this.name,
      this.productUrl,
      this.imageUrl,
      this.brandName,
      this.price,
      this.status,
      this.storeId});

  RecommendedProductModel.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    sku = json['sku'];
    typeId = json['type_id'];
    name = json['name'];
    productUrl = json['product_url'];
    imageUrl = json['image_url'];
    brandName = json['brand_name'];
    price = json['price'];
    status = json['status'];
    storeId = json['store_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['sku'] = this.sku;
    data['type_id'] = this.typeId;
    data['name'] = this.name;
    data['product_url'] = this.productUrl;
    data['image_url'] = this.imageUrl;
    data['brand_name'] = this.brandName;
    data['price'] = this.price;
    data['status'] = this.status;
    data['store_id'] = this.storeId;
    return data;
  }
}
