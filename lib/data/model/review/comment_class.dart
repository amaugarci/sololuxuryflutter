import 'user_class.dart';

class Comment {
  Comment({
    this.id,
    this.message,
    this.createdAt,
    this.user,
  });

  String? id;
  String? message;
  String? createdAt;
  List<User>? user;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    id: json["_id"] == null ? null : json["_id"],
    message: json["message"] == null ? null : json["message"],
    createdAt: json["createdAt"] == null
        ? null
        : DateTime.parse(json["createdAt"]).toString(),
    user: json["user"] == null
        ? null
        : List<User>.from(json["user"].map((x) => User.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id,
    "message": message == null ? null : message,
    "createdAt": createdAt == null ? null : createdAt.toString(),
    "user": user == null
        ? null
        : List<dynamic>.from(user!.map((x) => x.toJson())),
  };
}