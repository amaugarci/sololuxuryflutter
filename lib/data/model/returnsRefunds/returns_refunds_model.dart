class ReturnsAndRefundsModel {
  final String? cmspagemanagerId;
  final String? cmsId;
  final String? status;
  final dynamic extraData;
  final List<CmsText>? cmsText;
  final String? createdAt;

  ReturnsAndRefundsModel({
    this.cmspagemanagerId,
    this.cmsId,
    this.status,
    this.extraData,
    this.cmsText,
    this.createdAt,
  });

  ReturnsAndRefundsModel.fromJson(Map<String, dynamic> json)
      : cmspagemanagerId = json['cmspagemanager_id'] as String?,
        cmsId = json['cms_id'] as String?,
        status = json['status'] as String?,
        extraData = json['extra_data'],
        cmsText = (json['cms_text'] as List?)?.map((dynamic e) => CmsText.fromJson(e as Map<String,dynamic>)).toList(),
        createdAt = json['created_at'] as String?;

  Map<String, dynamic> toJson() => {
    'cmspagemanager_id' : cmspagemanagerId,
    'cms_id' : cmsId,
    'status' : status,
    'extra_data' : extraData,
    'cms_text' : cmsText?.map((e) => e.toJson()).toList(),
    'created_at' : createdAt
  };
}

class CmsText {
  final String? title;
  final String? subTitle;
  final String? description;

  CmsText({
    this.title,
    this.subTitle,
    this.description,
  });

  CmsText.fromJson(Map<String, dynamic> json)
      : title = json['title'] as String?,
        subTitle = json['sub_title'] as String?,
        description = json['description'] as String?;

  Map<String, dynamic> toJson() => {
    'title' : title,
    'sub_title' : subTitle,
    'description' : description
  };
}