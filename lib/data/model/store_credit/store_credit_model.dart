import 'dart:convert';

List<StoreCreditModel> storeCreditModelFromJson(String str) =>
    List<StoreCreditModel>.from(
        json.decode(str).map((x) => StoreCreditModel.fromJson(x)));

String storeCreditModelToJson(List<StoreCreditModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StoreCreditModel {
  StoreCreditModel({
    this.transactionId,
    this.customerId,
    this.amount,
    this.balance,
    this.used,
    this.orderId,
    this.invoiceId,
    this.creditmemoId,
    this.suppressNotification,
    this.atTime,
    this.summary,
    this.type,
  });

  String? transactionId;
  String? customerId;
  int? amount;
  int? balance;
  int? used;
  String? orderId;
  String? invoiceId;
  dynamic creditmemoId;
  bool? suppressNotification;
  DateTime? atTime;
  String? summary;
  String? type;

  factory StoreCreditModel.fromJson(Map<String, dynamic> json) =>
      StoreCreditModel(
        transactionId:
            json["transaction_id"] == null ? null : json["transaction_id"],
        customerId: json["customer_id"] == null ? null : json["customer_id"],
        amount: json["amount"] == null ? null : json["amount"],
        balance: json["balance"] == null ? null : json["balance"],
        used: json["used"] == null ? null : json["used"],
        orderId: json["order_id"] == null ? null : json["order_id"],
        invoiceId: json["invoice_id"] == null ? null : json["invoice_id"],
        creditmemoId: json["creditmemo_id"],
        suppressNotification: json["suppress_notification"] == null
            ? null
            : json["suppress_notification"],
        atTime:
            json["at_time"] == null ? null : DateTime.parse(json["at_time"]),
        summary: json["summary"] == null ? null : json["summary"],
        type: json["type"] == null ? null : json["type"],
      );

  Map<String, dynamic> toJson() => {
        "transaction_id": transactionId == null ? null : transactionId,
        "customer_id": customerId == null ? null : customerId,
        "amount": amount == null ? null : amount,
        "balance": balance == null ? null : balance,
        "used": used == null ? null : used,
        "order_id": orderId == null ? null : orderId,
        "invoice_id": invoiceId == null ? null : invoiceId,
        "creditmemo_id": creditmemoId,
        "suppress_notification":
            suppressNotification == null ? null : suppressNotification,
        "at_time": atTime == null ? null : atTime!.toIso8601String(),
        "summary": summary == null ? null : summary,
        "type": type == null ? null : type,
      };
}
