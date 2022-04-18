// To parse this JSON data, do
//
//     final optionModel = optionModelFromJson(jsonString);

import 'dart:convert';

List<OptionModel> optionModelFromJson(String str) => List<OptionModel>.from(json.decode(str).map((x) => OptionModel.fromJson(x)));

String optionModelToJson(List<OptionModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OptionModel {
  OptionModel({
    this.label,
    this.value,
  });

  String? label;
  String? value;

  factory OptionModel.fromJson(Map<String, dynamic> json) => OptionModel(
    label: json["label"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "label": label,
    "value": value,
  };
}
