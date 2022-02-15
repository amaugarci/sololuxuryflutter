class User {
  User({
    this.id,
    this.fullName,
    this.image,
  });

  String? id;
  String? fullName;
  String? image;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"] == null ? null : json["_id"],
        fullName: json["fullName"] == null ? null : json["fullName"],
        image: json["image"] == null ? null : json["image"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "fullName": fullName == null ? null : fullName,
        "image": image == null ? null : image,
      };
}
