// To parse this JSON data, do
//
//     final myTicketModel = myTicketModelFromJson(jsonString);

import 'dart:convert';

MyTicketModel myTicketModelFromJson(String str) =>
    MyTicketModel.fromJson(json.decode(str));

String myTicketModelToJson(MyTicketModel data) => json.encode(data.toJson());

class MyTicketModel {
  MyTicketModel({
    this.id,
    this.customerId,
    this.name,
    this.email,
    this.ticketId,
    this.subject,
    this.message,
    this.resolutionDate,
    this.assignedTo,
    this.sourceOfTicket,
    this.statusId,
    this.date,
    this.createdAt,
    this.updatedAt,
    this.typeOfInquiry,
    this.lastName,
    this.country,
    this.phoneNo,
    this.orderNo,
    this.notifyOn,
    this.amount,
    this.sku,
    this.brand,
    this.style,
    this.keyword,
    this.image,
    this.deletedAt,
    this.langCode,
    this.status,
    this.messages,
  });

  int? id;
  int? customerId;
  String? name;
  String? email;
  String? ticketId;
  String? subject;
  String? message;
  dynamic resolutionDate;
  dynamic assignedTo;
  String? sourceOfTicket;
  int? statusId;
  DateTime? date;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? typeOfInquiry;
  String? lastName;
  dynamic country;
  String? phoneNo;
  dynamic orderNo;
  dynamic notifyOn;
  dynamic amount;
  dynamic sku;
  dynamic brand;
  dynamic style;
  dynamic keyword;
  dynamic image;
  dynamic deletedAt;
  String? langCode;
  String? status;
  List<dynamic>? messages;

  factory MyTicketModel.fromJson(Map<String, dynamic> json) => MyTicketModel(
        id: json["id"] == null ? null : json["id"],
        customerId: json["customer_id"] == null ? null : json["customer_id"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        ticketId: json["ticket_id"] == null ? null : json["ticket_id"],
        subject: json["subject"] == null ? null : json["subject"],
        message: json["message"] == null ? null : json["message"],
        resolutionDate: json["resolution_date"],
        assignedTo: json["assigned_to"],
        sourceOfTicket:
            json["source_of_ticket"] == null ? null : json["source_of_ticket"],
        statusId: json["status_id"] == null ? null : json["status_id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        typeOfInquiry:
            json["type_of_inquiry"] == null ? null : json["type_of_inquiry"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        country: json["country"],
        phoneNo: json["phone_no"] == null ? null : json["phone_no"],
        orderNo: json["order_no"],
        notifyOn: json["notify_on"],
        amount: json["amount"],
        sku: json["sku"],
        brand: json["brand"],
        style: json["style"],
        keyword: json["keyword"],
        image: json["image"],
        deletedAt: json["deleted_at"],
        langCode: json["lang_code"] == null ? null : json["lang_code"],
        status: json["status"] == null ? null : json["status"],
        messages: json["messages"] == null
            ? null
            : List<dynamic>.from(json["messages"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "customer_id": customerId == null ? null : customerId,
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "ticket_id": ticketId == null ? null : ticketId,
        "subject": subject == null ? null : subject,
        "message": message == null ? null : message,
        "resolution_date": resolutionDate,
        "assigned_to": assignedTo,
        "source_of_ticket": sourceOfTicket == null ? null : sourceOfTicket,
        "status_id": statusId == null ? null : statusId,
        "date": date == null ? null : date!.toIso8601String(),
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "type_of_inquiry": typeOfInquiry == null ? null : typeOfInquiry,
        "last_name": lastName == null ? null : lastName,
        "country": country,
        "phone_no": phoneNo == null ? null : phoneNo,
        "order_no": orderNo,
        "notify_on": notifyOn,
        "amount": amount,
        "sku": sku,
        "brand": brand,
        "style": style,
        "keyword": keyword,
        "image": image,
        "deleted_at": deletedAt,
        "lang_code": langCode == null ? null : langCode,
        "status": status == null ? null : status,
        "messages": messages == null
            ? null
            : List<dynamic>.from(messages!.map((x) => x)),
      };
}
