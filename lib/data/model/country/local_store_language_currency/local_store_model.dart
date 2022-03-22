// To parse this JSON data, do
//
//     final localStoreModel = localStoreModelFromJson(jsonString?);

import 'dart:convert';

LocalStoreModel localStoreModelFromJson(String? str) => LocalStoreModel.fromJson(json.decode(str!));

String? localStoreModelToJson(LocalStoreModel data) => json.encode(data.toJson());

class LocalStoreModel {
  LocalStoreModel({
    this.id,
    this.name,
    this.currentCode,
    this.currentCurrency,
    this.languageList,
    this.currencyList,
    this.storeViewModelList,
    this.storeLanguageCurrencyModelList,
  });

  int? id;
  String? name;
  String? currentCode;
  String? currentCurrency;
  List<dynamic>? languageList;
  List<dynamic>? currencyList;
  List<LocalStoreViewModel>? storeViewModelList;
  List<LocalStoreLanguageCurrencyModel>? storeLanguageCurrencyModelList;

  factory LocalStoreModel.fromJson(Map<String?, dynamic> json) {
    return LocalStoreModel(
    id: json["id"],
    name: json["name"],
    currentCode: json["current_code"],
    currentCurrency: json["current_currency"],
    languageList: json["language_list"],
    currencyList: json["currency_list"],
    storeViewModelList: List<LocalStoreViewModel>.from(json["store_view_model"].map((x) => LocalStoreViewModel.fromJson(x))),
    storeLanguageCurrencyModelList: List<LocalStoreLanguageCurrencyModel>.from(json["store_language_currency_model"].map((x) => LocalStoreLanguageCurrencyModel.fromJson(x))),
  );
  }

  Map<String?, dynamic> toJson() => {
    "id": id,
    "name": name,
    "current_code": currentCode,
    "current_currency": currentCurrency,
    "language_list": languageList,
    "currency_list": currencyList,
    "store_view_model": List<dynamic>.from(storeViewModelList!.map((x) => x.toJson())),
    "store_language_currency_model": List<dynamic>.from(storeLanguageCurrencyModelList!.map((x) => x.toJson())),
  };

  LocalStoreViewModel? getStore(code){
    LocalStoreViewModel localStoreViewModel = storeViewModelList!.firstWhere((element) => element.code == code);
    return localStoreViewModel;
  }

}

class LocalStoreLanguageCurrencyModel {
  LocalStoreLanguageCurrencyModel({
    this.id,
    this.locale,
    this.baseCurrencyCode,
    this.defaultDisplayCurrencyCode,
  });

  int? id;
  String? locale;
  String? baseCurrencyCode;
  String? defaultDisplayCurrencyCode;

  factory LocalStoreLanguageCurrencyModel.fromJson(Map<String?, dynamic> json) => LocalStoreLanguageCurrencyModel(
    id: json["id"],
    locale: json["locale"],
    baseCurrencyCode: json["base_currency_code"],
    defaultDisplayCurrencyCode: json["default_display_currency_code"],
  );

  Map<String?, dynamic> toJson() => {
    "id": id,
    "locale": locale,
    "base_currency_code": baseCurrencyCode,
    "default_display_currency_code": defaultDisplayCurrencyCode,
  };
}

class LocalStoreViewModel {
  LocalStoreViewModel({
    this.id,
    this.code,
    this.name,
    this.websiteId,
    this.storeGroupId,
    this.isActive,
  });

  int? id;
  String? code;
  String? name;
  int? websiteId;
  int? storeGroupId;
  int? isActive;

  factory LocalStoreViewModel.fromJson(Map<String?, dynamic> json) => LocalStoreViewModel(
    id: json["id"],
    code: json["code"],
    name: json["name"],
    websiteId: json["website_id"],
    storeGroupId: json["store_group_id"],
    isActive: json["is_active"],
  );

  Map<String?, dynamic> toJson() => {
    "id": id,
    "code": code,
    "name": name,
    "website_id": websiteId,
    "store_group_id": storeGroupId,
    "is_active": isActive,
  };
}
