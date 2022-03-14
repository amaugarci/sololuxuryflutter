// To parse this JSON data, do
//
//     final countryListModel = countryListModelFromJson(jsonString);

import 'dart:convert';

List<CountryListModel> countryListModelFromJson(String str) =>
    List<CountryListModel>.from(
        json.decode(str).map((x) => CountryListModel.fromJson(x)));

String countryListModelToJson(List<CountryListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryListModel {
  CountryListModel({
    this.id,
    this.twoLetterAbbreviation,
    this.threeLetterAbbreviation,
    this.fullNameLocale,
    this.fullNameEnglish,
    this.availableRegions,
  });

  String? id;
  String? twoLetterAbbreviation;
  String? threeLetterAbbreviation;
  String? fullNameLocale;
  String? fullNameEnglish;
  List<AvailableRegion>? availableRegions;

  factory CountryListModel.fromJson(Map<String, dynamic> json) =>
      CountryListModel(
        id: json["id"] == null ? null : json["id"],
        twoLetterAbbreviation: json["two_letter_abbreviation"] == null
            ? null
            : json["two_letter_abbreviation"],
        threeLetterAbbreviation: json["three_letter_abbreviation"] == null
            ? null
            : json["three_letter_abbreviation"],
        fullNameLocale:
            json["full_name_locale"] == null ? null : json["full_name_locale"],
        fullNameEnglish: json["full_name_english"] == null
            ? null
            : json["full_name_english"],
        availableRegions: json["available_regions"] == null
            ? null
            : List<AvailableRegion>.from(json["available_regions"]
                .map((x) => AvailableRegion.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "two_letter_abbreviation":
            twoLetterAbbreviation == null ? null : twoLetterAbbreviation,
        "three_letter_abbreviation":
            threeLetterAbbreviation == null ? null : threeLetterAbbreviation,
        "full_name_locale": fullNameLocale == null ? null : fullNameLocale,
        "full_name_english": fullNameEnglish == null ? null : fullNameEnglish,
        "available_regions": availableRegions == null
            ? null
            : List<dynamic>.from(availableRegions!.map((x) => x.toJson())),
      };
}

class AvailableRegion {
  AvailableRegion({
    this.id,
    this.code,
    this.name,
  });

  String? id;
  String? code;
  String? name;

  factory AvailableRegion.fromJson(Map<String, dynamic> json) =>
      AvailableRegion(
        id: json["id"] == null ? null : json["id"],
        code: json["code"] == null ? null : json["code"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "code": code == null ? null : code,
        "name": name == null ? null : name,
      };
}
