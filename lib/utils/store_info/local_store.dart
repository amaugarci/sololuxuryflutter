
import 'dart:convert';

import 'package:get/get.dart';
import 'package:solo_luxury/app/db/shared_pref.dart';
import 'package:solo_luxury/app/screens/country/country_binding.dart';
import 'package:solo_luxury/app/screens/country/country_controller.dart';
import 'package:solo_luxury/data/model/country/local_store_language_currency/local_store_model.dart';

import '../get_network_service/APIProviders/country_api_provider.dart';
import '../get_network_service/APIRepository/country_api_repository.dart';

class LocalStore{
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
      return true;
    }
    return false;
  }

}