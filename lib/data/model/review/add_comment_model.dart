import 'comment_class.dart';

class AddCommentModel {
  int? status;
  String? message;
  Comment? data;

  AddCommentModel({this.status, this.message, this.data});

  factory AddCommentModel.fromJson(Map<String, dynamic> json) =>
      AddCommentModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : Comment.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message == null ? null : message,
    "data": data == null ? null : data!.toJson(),
  };
}