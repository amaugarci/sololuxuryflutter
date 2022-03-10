import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/db/shared_pref.dart';
import 'package:solo_luxury/data/model/country/local_store_language_currency/local_store_model.dart';

import '../checkout_order/checkout_binding.dart';

class ProfileController extends GetxController {
  TabController? tabController;
  String? countryName;
  String? currency;
  RxList<String> profileMenu = [
    "MY ACCOUNT",
    "MY ORDERS",
    "MY WISH LIST",
    "ADDRESS BOOK",
    "ACCOUNT INFORMATION",
    "STORED PAYMENT METHODS",
    "NEWSLETTER SUBSCRIPTIONS",
  ].obs;

  @override
  void onInit() {
    super.onInit();
    print("ProfileController -> $runtimeType");
    getCountryData();
  }

  getCountryData() async {
    String data = await getPrefStringValue(key_local_store_model);
    if (data != null && data.isNotEmpty) {
      LocalStoreModel localStoreModel = LocalStoreModel.fromJson(jsonDecode(data));
      print("Get LocalMap -> ${jsonEncode(localStoreModel)}");
      profileMenu.add("${localStoreModel.name} (${localStoreModel.currentCurrency})");
      update();
    }
  }
}
