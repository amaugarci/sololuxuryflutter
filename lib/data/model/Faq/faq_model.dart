// To parse this JSON data, do
//
//     final faqModel = faqModelFromJson(jsonString);

import 'dart:convert';

List<FaqModel> faqModelFromJson(String str) =>
    List<FaqModel>.from(json.decode(str).map((x) => FaqModel.fromJson(x)));

String faqModelToJson(List<FaqModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FaqModel {
  FaqModel({
    this.id,
    this.identifier,
    this.title,
    this.pageLayout,
    this.metaTitle,
    this.metaKeywords,
    this.metaDescription,
    this.contentHeading,
    this.content,
    this.creationTime,
    this.updateTime,
    this.sortOrder,
    this.layoutUpdateXml,
    this.customTheme,
    this.customRootTemplate,
    this.active,
  });

  int? id;
  String? identifier;
  String? title;
  String? pageLayout;
  String? metaTitle;
  String? metaKeywords;
  String? metaDescription;
  String? contentHeading;
  String? content;
  DateTime? creationTime;
  DateTime? updateTime;
  String? sortOrder;
  String? layoutUpdateXml;
  String? customTheme;
  String? customRootTemplate;
  bool? active;

  factory FaqModel.fromJson(Map<String, dynamic> json) => FaqModel(
        id: json["id"],
        identifier: json["identifier"],
        title: json["title"],
        pageLayout: json["page_layout"],
        metaTitle: json["meta_title"],
        metaKeywords: json["meta_keywords"],
        metaDescription: json["meta_description"],
        contentHeading: json["content_heading"],
        content: json["content"],
        creationTime: DateTime.parse(json["creation_time"]),
        updateTime: DateTime.parse(json["update_time"]),
        sortOrder: json["sort_order"],
        layoutUpdateXml: json["layout_update_xml"],
        customTheme: json["custom_theme"],
        customRootTemplate: json["custom_root_template"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "identifier": identifier,
        "title": title,
        "page_layout": pageLayout,
        "meta_title": metaTitle,
        "meta_keywords": metaKeywords,
        "meta_description": metaDescription,
        "content_heading": contentHeading,
        "content": content,
        "creation_time": creationTime?.toIso8601String(),
        "update_time": updateTime?.toIso8601String(),
        "sort_order": sortOrder,
        "layout_update_xml": layoutUpdateXml,
        "custom_theme": customTheme,
        "custom_root_template": customRootTemplate,
        "active": active,
      };
}
