class Store {
  Store({
    this.id,
    this.storeName,
    this.storeImage,
  });

  String? id;
  String? storeName;
  String? storeImage;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        id: json["_id"] == null ? null : json["_id"],
        storeName: json["storeName"] == null ? null : json["storeName"],
        storeImage: json["storeImage"] == null ? null : json["storeImage"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "storeName": storeName == null ? null : storeName,
        "storeImage": storeImage == null ? null : storeImage,
      };
}
