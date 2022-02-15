class GetStateModel {
  GetStateModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  List<StateData>? data;

  factory GetStateModel.fromJson(Map<String, dynamic> json) => GetStateModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : List<StateData>.from(
                json["data"].map((x) => StateData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class StateData {
  StateData({
    this.id,
    this.state,
  });

  String? id;
  String? state;

  factory StateData.fromJson(Map<String, dynamic> json) => StateData(
        id: json["_id"] == null ? null : json["_id"],
        state: json["state"] == null ? null : json["state"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "state": state == null ? null : state,
      };
}
