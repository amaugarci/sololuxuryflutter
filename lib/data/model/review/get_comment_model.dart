import 'comment_class.dart';

class GetCommentModel {
  int? status;
  String? message;
  List<Comment>? data;

  GetCommentModel({this.status, this.message, this.data});

  factory GetCommentModel.fromJson(Map<String, dynamic> json) =>
      GetCommentModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : List<Comment>.from(json["data"].map((x) => Comment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "data": data == null
        ? null
        : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}