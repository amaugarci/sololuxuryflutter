// To parse this JSON data, do
//
//     final returnReasonModel = returnReasonModelFromJson(jsonString);

import 'dart:convert';

List<ReturnReasonModel> returnReasonModelFromJson(String str) =>
    List<ReturnReasonModel>.from(
        json.decode(str).map((x) => ReturnReasonModel.fromJson(x)));

String returnReasonModelToJson(List<ReturnReasonModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReturnReasonModel {
  ReturnReasonModel({
    this.orderreturnId,
    this.orderId,
    this.productSku,
    this.customerEmail,
    this.type,
    this.reason,
    this.langCode,
    this.website,
    this.erpReturnStatus,
    this.createdAt,
  });

  String? orderreturnId;
  String? orderId;
  String? productSku;
  String? customerEmail;
  dynamic type;
  String? reason;
  String? langCode;
  String? website;
  String? erpReturnStatus;
  DateTime? createdAt;

  factory ReturnReasonModel.fromJson(Map<String, dynamic> json) =>
      ReturnReasonModel(
        orderreturnId:
            json["orderreturn_id"] == null ? null : json["orderreturn_id"],
        orderId: json["order_id"] == null ? null : json["order_id"],
        productSku: json["product_sku"] == null ? null : json["product_sku"],
        customerEmail:
            json["customer_email"] == null ? null : json["customer_email"],
        type: json["type"],
        reason: json["reason"] == null ? null : json["reason"],
        langCode: json["lang_code"] == null ? null : json["lang_code"],
        website: json["website"] == null ? null : json["website"],
        erpReturnStatus: json["erp_return_status"] == null
            ? null
            : json["erp_return_status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "orderreturn_id": orderreturnId == null ? null : orderreturnId,
        "order_id": orderId == null ? null : orderId,
        "product_sku": productSku == null ? null : productSku,
        "customer_email": customerEmail == null ? null : customerEmail,
        "type": type,
        "reason": reason == null ? null : reason,
        "lang_code": langCode == null ? null : langCode,
        "website": website == null ? null : website,
        "erp_return_status": erpReturnStatus == null ? null : erpReturnStatus,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
      };
}
