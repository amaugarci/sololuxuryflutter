// To parse this JSON data, do
//
//     final cmsPageModel = cmsPageModelFromJson(jsonString);

import 'dart:convert';

List<CmsPageModel> cmsPageModelFromJson(String str) => List<CmsPageModel>.from(
    json.decode(str).map((x) => CmsPageModel.fromJson(x)));

String cmsPageModelToJson(List<CmsPageModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CmsPageModel {
  CmsPageModel({
    this.cmspagemanagerId,
    this.cmsId,
    this.status,
    this.extraData,
    this.cmsText,
    this.createdAt,
  });

  String? cmspagemanagerId;
  String? cmsId;
  String? status;
  dynamic extraData;
  List<CmsText>? cmsText;
  DateTime? createdAt;

  factory CmsPageModel.fromJson(Map<String, dynamic> json) => CmsPageModel(
        cmspagemanagerId: json["cmspagemanager_id"] == null
            ? null
            : json["cmspagemanager_id"],
        cmsId: json["cms_id"] == null ? null : json["cms_id"],
        status: json["status"] == null ? null : json["status"],
        extraData: json["extra_data"],
        cmsText: json["cms_text"] == null
            ? null
            : List<CmsText>.from(
                json["cms_text"].map((x) => CmsText.fromJson(x))),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "cmspagemanager_id": cmspagemanagerId == null ? null : cmspagemanagerId,
        "cms_id": cmsId == null ? null : cmsId,
        "status": status == null ? null : status,
        "extra_data": extraData,
        "cms_text": cmsText == null
            ? null
            : List<dynamic>.from(cmsText!.map((x) => x.toJson())),
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
      };
}

class CmsText {
  CmsText({
    this.title,
    this.subTitle,
    this.description,
  });

  String? title;
  String? subTitle;
  String? description;

  factory CmsText.fromJson(Map<String, dynamic> json) => CmsText(
        title: json["title"] == null ? null : json["title"],
        subTitle: json["sub_title"] == null ? null : json["sub_title"],
        description: json["description"] == null ? null : json["description"],
      );

  Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "sub_title": subTitle == null ? null : subTitle,
        "description": description == null ? null : description,
      };
}
