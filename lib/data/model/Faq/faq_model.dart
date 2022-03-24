
class FaqModel {
  String? cmspagemanagerId;
  String? cmsId;
  String? status;
  Null? extraData;
  List<CmsText>? cmsText;
  String? createdAt;

  FaqModel(
      {this.cmspagemanagerId,
        this.cmsId,
        this.status,
        this.extraData,
        this.cmsText,
        this.createdAt});

  FaqModel.fromJson(Map<String, dynamic> json) {
    cmspagemanagerId = json['cmspagemanager_id'];
    cmsId = json['cms_id'];
    status = json['status'];
    extraData = json['extra_data'];
    if (json['cms_text'] != null) {
      cmsText = <CmsText>[];
      json['cms_text'].forEach((v) {
        cmsText!.add(new CmsText.fromJson(v));
      });
    }
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cmspagemanager_id'] = this.cmspagemanagerId;
    data['cms_id'] = this.cmsId;
    data['status'] = this.status;
    data['extra_data'] = this.extraData;
    if (this.cmsText != null) {
      data['cms_text'] = this.cmsText!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = this.createdAt;
    return data;
  }
}

class CmsText {
  String? title;
  String? subTitle;
  String? description;

  CmsText({this.title, this.subTitle, this.description});

  CmsText.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subTitle = json['sub_title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['sub_title'] = this.subTitle;
    data['description'] = this.description;
    return data;
  }
}

/*
// To parse this JSON data, do
//
//     final faqModel = faqModelFromJson(jsonString);



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
*/
