// To parse this JSON data, do
//
//     final orderTrackingModel = orderTrackingModelFromJson(jsonString);

import 'dart:convert';

List<OrderTrackingModel> orderTrackingModelFromJson(String str) =>
    List<OrderTrackingModel>.from(
        json.decode(str).map((x) => OrderTrackingModel.fromJson(x)));

String orderTrackingModelToJson(List<OrderTrackingModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderTrackingModel {
  OrderTrackingModel({
    this.statusCode,
    this.statusTitle,
    this.statusDate,
  });

  String? statusCode;
  String? statusTitle;
  String? statusDate;

  factory OrderTrackingModel.fromJson(Map<String, dynamic> json) =>
      OrderTrackingModel(
        statusCode: json["status_code"] == null ? null : json["status_code"],
        statusTitle: json["status_title"] == null ? null : json["status_title"],
        statusDate: json["status_date"] == null ? null : json["status_date"],
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode == null ? null : statusCode,
        "status_title": statusTitle == null ? null : statusTitle,
        "status_date": statusDate == null ? null : statusDate,
      };
}
