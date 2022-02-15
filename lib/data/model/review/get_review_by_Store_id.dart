import 'comment_class.dart';

class GetReviewByStoreIdModel {
  GetReviewByStoreIdModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory GetReviewByStoreIdModel.fromJson(Map<String, dynamic> json) =>
      GetReviewByStoreIdModel(
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
    this.reviewData,
    this.state,
  });

  List<ReviewDataByStoreId>? reviewData;
  State? state;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        reviewData: json["review_data"] == null
            ? null
            : List<ReviewDataByStoreId>.from(json["review_data"]
                .map((x) => ReviewDataByStoreId.fromJson(x))),
        state: json["state"] == null ? null : State.fromJson(json["state"]),
      );

  Map<String, dynamic> toJson() => {
        "review_data": reviewData == null
            ? null
            : List<dynamic>.from(reviewData!.map((x) => x.toJson())),
        "state": state == null ? null : state!.toJson(),
      };
}

class ReviewDataByStoreId {
  ReviewDataByStoreId({
    this.id,
    this.review,
    this.images,
    this.reaction,
    this.createdAt,
    this.user,
    this.comment,
  });

  String? id;
  String? review;
  List<String>? images;
  String? reaction;
  String? createdAt;
  List<User>? user;
  List<Comment>? comment;

  factory ReviewDataByStoreId.fromJson(Map<String, dynamic> json) =>
      ReviewDataByStoreId(
        id: json["_id"] == null ? null : json["_id"],
        review: json["review"] == null ? null : json["review"],
        images: json["images"] == null
            ? null
            : List<String>.from(json["images"].map((x) => x)),
        reaction: json["reaction"] == null ? null : json["reaction"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]).toString(),
        user: json["user"] == null
            ? null
            : List<User>.from(json["user"].map((x) => User.fromJson(x))),
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
        "user": user == null
            ? null
            : List<dynamic>.from(user!.map((x) => x.toJson())),
        "comment": comment == null
            ? null
            : List<dynamic>.from(comment!.map((x) => x.toJson())),
      };
}

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

class State {
  State({
    this.page,
    this.limit,
    this.pageLimit,
  });

  int? page;
  int? limit;
  int? pageLimit;

  factory State.fromJson(Map<String, dynamic> json) => State(
        page: json["page"] == null ? null : json["page"],
        limit: json["limit"] == null ? null : json["limit"],
        pageLimit: json["page_limit"] == null ? null : json["page_limit"],
      );

  Map<String, dynamic> toJson() => {
        "page": page == null ? null : page,
        "limit": limit == null ? null : limit,
        "page_limit": pageLimit == null ? null : pageLimit,
      };
}
