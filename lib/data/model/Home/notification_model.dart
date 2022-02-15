class NotificationModel {
  NotificationModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
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
    this.notificationList,
    this.state,
  });

  List<NotificationDatum>? notificationList;
  State? state;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        notificationList: json["notificationData"] == null
            ? null
            : List<NotificationDatum>.from(json["notificationData"]
                .map((x) => NotificationDatum.fromJson(x))),
        state: json["state"] == null ? null : State.fromJson(json["state"]),
      );

  Map<String, dynamic> toJson() => {
        "notificationData": notificationList == null
            ? null
            : List<dynamic>.from(notificationList!.map((x) => x.toJson())),
        "state": state == null ? null : state!.toJson(),
      };
}

class NotificationDatum {
  NotificationDatum({
    this.id,
    this.title,
    this.description,
    this.notificationType,
    this.notificationData,
  });

  String? id;
  String? title;
  String? description;
  int? notificationType;
  NotificationData? notificationData;

  factory NotificationDatum.fromJson(Map<String, dynamic> json) =>
      NotificationDatum(
        id: json["_id"] == null ? null : json["_id"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        notificationType:
            json["notificationType"] == null ? null : json["notificationType"],
        notificationData: json["notificationData"] == null
            ? null
            : NotificationData.fromJson(json["notificationData"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "title": title == null ? null : title,
        "description": description,
        "notificationType": notificationType == null ? null : notificationType,
        "notificationData":
            notificationData == null ? null : notificationData!.toJson(),
      };
}

class NotificationData {
  NotificationData({
    this.type,
    this.reviewId,
    this.storeId,
    this.clickAction,
  });

  int? type;
  String? reviewId;
  String? storeId;
  String? clickAction;

  factory NotificationData.fromJson(Map<String, dynamic> json) =>
      NotificationData(
        type: json["type"] == null ? null : json["type"],
        reviewId: json["reviewId"] == null ? null : json["reviewId"],
        storeId: json["storeId"] == null ? null : json["storeId"],
        clickAction: json["click_action"] == null ? null : json["click_action"],
      );

  Map<String, dynamic> toJson() => {
        "type": type == null ? null : type,
        "reviewId": reviewId == null ? null : reviewId,
        "storeId": storeId == null ? null : storeId,
        "click_action": clickAction == null ? null : clickAction,
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
