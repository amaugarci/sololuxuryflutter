import 'comment_class.dart';
import 'store_class.dart';

class GetReviewModel {
  int? status;
  String? message;
  Data? data;

  GetReviewModel({this.status, this.message, this.data});

  factory GetReviewModel.fromJson(Map<String, dynamic> json) => GetReviewModel(
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

  List<ReviewData>? reviewData;
  State? state;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        reviewData: json["review_data"] == null
            ? null
            : List<ReviewData>.from(
                json["review_data"].map((x) => ReviewData.fromJson(x))),
        state: json["state"] == null ? null : State.fromJson(json["state"]),
      );

  Map<String, dynamic> toJson() => {
        "review_data": reviewData == null
            ? null
            : List<dynamic>.from(reviewData!.map((x) => x.toJson())),
        "state": state == null ? null : state!.toJson(),
      };
}

class ReviewData {
  String? id;
  String? review;
  List<String>? images;
  String? reaction;
  String? createdAt;
  List<Store>? store;
  List<Comment>? comment;

  ReviewData(
      {this.id,
      this.review,
      this.images,
      this.reaction,
      this.createdAt,
      this.store,
      this.comment});

  factory ReviewData.fromJson(Map<String, dynamic> json) => ReviewData(
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
        "createdAt": createdAt == null ? null : createdAt!.toString(),
        "store": store == null
            ? null
            : List<dynamic>.from(store!.map((x) => x.toJson())),
        "comment": comment == null
            ? null
            : List<dynamic>.from(comment!.map((x) => x.toJson())),
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
