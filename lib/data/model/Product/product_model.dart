class ProductModel {

  int? id;
  String? name;
  String? image;
  String? description;
  double? price;
  double? rating;
  List<dynamic>? images;
  double? discount;
  int? discountType;
  int? isCountDown;
  bool? hasCoupon;
  int? reviewCount;
  String? unit;
  int? amount;
  int? count;
  int? startTime;
  int? endTime;

  ProductModel(
  {this.id,
      this.name,
      this.image,
      this.description,
      this.price,
      this.rating,
      this.images,
      this.discount,
      this.discountType,
      this.isCountDown,
      this.hasCoupon,
      this.reviewCount,
      this.unit,
      this.amount,
      this.count,
      this.startTime,
      this.endTime});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    price = json['price'];
    rating = json['rating'];
    images = json['images'];
    discount = json['discount'];
    discountType = json['discountType'];
    isCountDown = json['isCountDown'];
    hasCoupon = json['hasCoupon'];
    reviewCount = json['reviewCount'];
    unit = json['unit'];
    amount = json['amount'];
    count = json['count'];
    startTime = json['startTime'];
    endTime = json['endTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['description'] = this.description;
    data['price'] = this.price;
    data['rating'] = this.rating;
    data['images'] = this.images;
    data['discount'] = this.discount;
    data['discountType'] = this.discountType;
    data['isCountDown'] = this.isCountDown;
    data['hasCoupon'] = this.hasCoupon;
    data['reviewCount'] = this.reviewCount;
    data['unit'] = this.unit;
    data['amount'] = this.amount;
    data['count'] = this.count;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    return data;
  }
}