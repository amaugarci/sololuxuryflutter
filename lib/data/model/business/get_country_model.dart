class GetCountryModel {
  GetCountryModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  List<CountryData>? data;

  factory GetCountryModel.fromJson(Map<String, dynamic> json) =>
      GetCountryModel(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? null
            : List<CountryData>.from(
                json["data"].map((x) => CountryData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class CountryData {
  CountryData({
    this.id,
    this.country,
  });

  String? id;
  String? country;

  factory CountryData.fromJson(Map<String, dynamic> json) => CountryData(
        id: json["_id"] == null ? null : json["_id"],
        country: json["country"] == null ? null : json["country"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "country": country == null ? null : country,
      };
}
