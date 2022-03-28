class BannerListModel {
  String? id;
  String? sliderId;
  String? status;
  String? showTitle;
  String? title;
  String? description;
  String? altText;
  String? url;
  String? customContent;
  String? image;
  String? mobileImage;
  String? thumbImage;
  String? video;
  String? validFrom;
  String? validTo;
  String? gaPromoId;
  String? gaPromoName;
  String? gaPromoCreative;
  String? gaPromoPosition;

  BannerListModel(
      {id,
      sliderId,
      status,
      showTitle,
      title,
      description,
      altText,
      url,
      customContent,
      image,
      mobileImage,
      thumbImage,
      video,
      validFrom,
      validTo,
      gaPromoId,
      gaPromoName,
      gaPromoCreative,
      gaPromoPosition});

  BannerListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sliderId = json['slider_id'];
    status = json['status'];
    showTitle = json['show_title'];
    title = json['title'];
    description = json['description'];
    altText = json['alt_text'];
    url = json['url'];
    customContent = json['custom_content'];
    image = json['image'];
    mobileImage = json['mobile_image'];
    thumbImage = json['thumb_image'];
    video = json['video'];
    validFrom = json['valid_from'];
    validTo = json['valid_to'];
    gaPromoId = json['ga_promo_id'];
    gaPromoName = json['ga_promo_name'];
    gaPromoCreative = json['ga_promo_creative'];
    gaPromoPosition = json['ga_promo_position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slider_id'] = sliderId;
    data['status'] = status;
    data['show_title'] = showTitle;
    data['title'] = title;
    data['description'] = description;
    data['alt_text'] = altText;
    data['url'] = url;
    data['custom_content'] = customContent;
    data['image'] = image;
    data['mobile_image'] = mobileImage;
    data['thumb_image'] = thumbImage;
    data['video'] = video;
    data['valid_from'] = validFrom;
    data['valid_to'] = validTo;
    data['ga_promo_id'] = gaPromoId;
    data['ga_promo_name'] = gaPromoName;
    data['ga_promo_creative'] = gaPromoCreative;
    data['ga_promo_position'] = gaPromoPosition;
    return data;
  }
}
