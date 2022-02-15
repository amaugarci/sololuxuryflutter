import 'comment_class.dart';
import 'store_class.dart';
import 'user_class.dart';

class GetReviewByUserIdModel {
  GetReviewByUserIdModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory GetReviewByUserIdModel.fromJson(Map<String, dynamic> json) =>
      GetReviewByUserIdModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null ? null : data!.toJson(),
      };
}

class Data {
  Data({
    this.user,
    this.review,
  });

  User? user;
  List<ReviewByUserId>? review;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        review: json["review"] == null
            ? null
            : List<ReviewByUserId>.from(
                json["review"].map((x) => ReviewByUserId.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "user": user == null ? null : user!.toJson(),
        "review": review == null
            ? null
            : List<dynamic>.from(review!.map((x) => x.toJson())),
      };
}

class ReviewByUserId {
  ReviewByUserId({
    this.id,
    this.review,
    this.images,
    this.reaction,
    this.createdAt,
    this.store,
    this.comment,
  });

  String? id;
  String? review;
  List<String>? images;
  String? reaction;
  String? createdAt;
  List<Store>? store;
  List<Comment>? comment;

  factory ReviewByUserId.fromJson(Map<String, dynamic> json) => ReviewByUserId(
        id: json["_id"] == null ? null : json["_id"],
        review: json["review"] == null ? null : json["review"],
        images: json["images"] == null
            ? null
            : List<String>.from(json["images"].map((x) => x)),
        reaction: json["reaction"] == null ? null : json["reaction"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]).toString(),
        store: json["store"] == null
            ? null
            : List<Store>.from(json["store"].map((x) => Store.fromJson(x))),
        comment: json["comment"] == null
            ? null
            : List<Comment>.from(
                json["comment"].map((x) => Comment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "review": review == null ? null : review,
        "images":
            images == null ? null : List<dynamic>.from(images!.map((x) => x)),
        "reaction": reaction == null ? null : reaction,
        "createdAt": createdAt == null ? null : createdAt.toString(),
        "store": store == null
            ? null
            : List<dynamic>.from(store!.map((x) => x.toJson())),
        "comment": comment == null
            ? null
            : List<dynamic>.from(comment!.map((x) => x.toJson())),
      };
}
