import 'dart:convert';

InfluencerRegistrationMethodModel influencerRegistrationResponseModelFromJson(
        String str) =>
    InfluencerRegistrationMethodModel.fromJson(json.decode(str));

String influencerRegistrationResponseModelToJson(
        InfluencerRegistrationMethodModel data) =>
    json.encode(data.toJson());

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
  String? city;
  String? postcode;
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
      this.city,
      this.postcode,
      this.url,
      this.country,
      this.type,
      this.langCode});

  factory InfluencerRegistrationMethodModel.fromJson(
          Map<String, dynamic> json) =>
      InfluencerRegistrationMethodModel(
        firstName: json['first_name'],
        lastName: json['last_name'],
        website: json['website'],
        phone: json['phone'],
        emailaddress: json['emailaddress'],
        facebook: json['facebook'],
        facebookFollowers: json['facebook_followers'],
        instagram: json['instagram'],
        instagramFollowers: json['instagram_followers'],
        twitter: json['twitter'],
        twitterFollowers: json['twitter_followers'],
        youtube: json['youtube'],
        youtubeFollowers: json['youtube_followers'],
        linkedin: json['linkedin'],
        linkedinFollowers: json['linkedin_followers'],
        pinterest: json['pinterest'],
        pinterestFollowers: json['pinterest_followers'],
        workedOn: json['worked_on'],
        websiteName: json['website_name'],
        city: json['city'],
        postcode: json['postcode'],
        url: json['url'],
        country: json['country'],
        type: json['type'],
        langCode: json['lang_code'],
      );

  Map<String, dynamic> toJson() => {
        'website': website,
        'first_name': firstName,
        'last_name': lastName,
        'phone': phone,
        'emailaddress': emailaddress,
        'facebook': facebook,
        'facebook_followers': facebookFollowers,
        'instagram': instagram,
        'instagram_followers': instagramFollowers,
        'twitter': twitter,
        'twitter_followers': twitterFollowers,
        'youtube': youtube,
        'youtube_followers': youtubeFollowers,
        'linkedin': linkedin,
        'linkedin_followers': linkedinFollowers,
        'pinterest': pinterest,
        'pinterest_followers': pinterestFollowers,
        'worked_on': workedOn,
        'city': city,
        'postcode': postcode,
        'website_name': websiteName,
        'url': url,
        'country': country,
        'type': type,
        'lang_code': langCode,
      };
}
