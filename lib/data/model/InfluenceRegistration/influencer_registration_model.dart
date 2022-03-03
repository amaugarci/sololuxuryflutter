class InfluencerRegistrationMethodModel {
  String? website;
  String? firstName;
  String? lastName;
  String? phone;
  String? emailaddress;
  String? facebook;
  String? facebookFollowers;
  String? instagram;
  String? instagramFollowers;
  String? twitter;
  String? twitterFollowers;
  String? youtube;
  String? youtubeFollowers;
  String? linkedin;
  String? linkedinFollowers;
  String? pinterest;
  String? pinterestFollowers;
  String? workedOn;
  String? websiteName;
  String? url;
  String? country;
  String? type;
  String? langCode;

  InfluencerRegistrationMethodModel(
      {this.website,
      this.firstName,
      this.lastName,
      this.phone,
      this.emailaddress,
      this.facebook,
      this.facebookFollowers,
      this.instagram,
      this.instagramFollowers,
      this.twitter,
      this.twitterFollowers,
      this.youtube,
      this.youtubeFollowers,
      this.linkedin,
      this.linkedinFollowers,
      this.pinterest,
      this.pinterestFollowers,
      this.workedOn,
      this.websiteName,
      this.url,
      this.country,
      this.type,
      this.langCode});

  InfluencerRegistrationMethodModel.fromJson(Map<String, dynamic> json) {
    website = json['website'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    emailaddress = json['emailaddress'];
    facebook = json['facebook'];
    facebookFollowers = json['facebook_followers'];
    instagram = json['instagram'];
    instagramFollowers = json['instagram_followers'];
    twitter = json['twitter'];
    twitterFollowers = json['twitter_followers'];
    youtube = json['youtube'];
    youtubeFollowers = json['youtube_followers'];
    linkedin = json['linkedin'];
    linkedinFollowers = json['linkedin_followers'];
    pinterest = json['pinterest'];
    pinterestFollowers = json['pinterest_followers'];
    workedOn = json['worked_on'];
    websiteName = json['website_name'];
    url = json['url'];
    country = json['country'];
    type = json['type'];
    langCode = json['lang_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['website'] = website;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phone'] = phone;
    data['emailaddress'] = emailaddress;
    data['facebook'] = facebook;
    data['facebook_followers'] = facebookFollowers;
    data['instagram'] = instagram;
    data['instagram_followers'] = instagramFollowers;
    data['twitter'] = twitter;
    data['twitter_followers'] = twitterFollowers;
    data['youtube'] = youtube;
    data['youtube_followers'] = youtubeFollowers;
    data['linkedin'] = linkedin;
    data['linkedin_followers'] = linkedinFollowers;
    data['pinterest'] = pinterest;
    data['pinterest_followers'] = pinterestFollowers;
    data['worked_on'] = workedOn;
    data['website_name'] = websiteName;
    data['url'] = url;
    data['country'] = country;
    data['type'] = type;
    data['lang_code'] = langCode;
    return data;
  }
}
