import 'dart:convert';

import 'package:solo_luxury/data/model/country/store_views_model.dart';

class LocalStoreLanguageCurrencyModel{

  int? currentId;
  int? id;
  String? countryName;
    List<StoreViewsModel>? storeLanguageList;
  List<StoreLanguageCurrencyModel>? storeLanguageCurrencyList;

  LocalStoreLanguageCurrencyModel({this.countryName, this.id, this.storeLanguageList, this.storeLanguageCurrencyList});

  LocalStoreLanguageCurrencyModel.fromJson(Map<String?, dynamic> json) {
    currentId = json['current_id'];
    id = json['id'];
    countryName = json['name'];
      if (json['store_view_model'] != null) {
      storeLanguageList = <StoreViewsModel>[];
      json['store_view_model'].forEach((v) {
        storeLanguageList!.add(StoreViewsModel.fromJson(v));
      });
    }
    if (json['store_language_currency_model'] != null) {
      storeLanguageCurrencyList = <StoreLanguageCurrencyModel>[];
      json['store_language_currency_model'].forEach((v) {
        storeLanguageCurrencyList!.add(StoreLanguageCurrencyModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_id'] = currentId;
    data['id'] = id;
    data['name'] = countryName;
    data['store_view_model'] = storeLanguageList;
    data['store_language_currency_model'] = storeLanguageCurrencyList;

    return data;
  }
  
}



List<StoreLanguageCurrencyModel> storeViewsModelFromJson(String str) => List<StoreLanguageCurrencyModel>.from(json.decode(str).map((x) => StoreViewsModel.fromJson(x)));

String storeLanguageCurrencyToJson(List<StoreLanguageCurrencyModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class StoreLanguageCurrencyModel {

  int? id;
  String? locale;
  String? baseCurrencyCode;
  String? defaultDisplayCurrencyCode;

  StoreLanguageCurrencyModel({this.id, this.locale, this.baseCurrencyCode, this.defaultDisplayCurrencyCode});


  StoreLanguageCurrencyModel.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    locale = json['locale'];
    baseCurrencyCode = json['base_currency_code'];
    defaultDisplayCurrencyCode = json['default_display_currency_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['locale'] = locale;
    data['base_currency_code'] = baseCurrencyCode;
    data['default_display_currency_code'] = defaultDisplayCurrencyCode;

    return data;
  }



}