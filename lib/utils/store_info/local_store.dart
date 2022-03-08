
import 'dart:convert';

import '../../app/db/shared_pref.dart';
import '../../data/model/country/local_store_language_currency/local_store_model.dart';

class LocalStore {
  static final LocalStore _singleton = LocalStore._internal();
  factory LocalStore() {
    return _singleton;
  }
  LocalStore._internal();

  var currentCode = "";
  var currentCurrency = "";

  getStore() async {
    print("getStore -> ");
    String data = await getPrefStringValue(key_local_store_model);
    if(data!=null && data.isNotEmpty) {
      LocalStoreModel localStoreModel = LocalStoreModel.fromJson(jsonDecode(data));
      currentCode = localStoreModel.currentCode!;
      currentCurrency = localStoreModel.currentCurrency!;
      print("currentCode -> " + currentCode);
      print("currentCurrency -> " + currentCurrency);
    }
  }

}