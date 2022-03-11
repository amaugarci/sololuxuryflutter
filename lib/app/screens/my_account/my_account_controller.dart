import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';

import '../../../data/model/country/local_store_language_currency/local_store_model.dart';
import '../../db/shared_pref.dart';

class MyAccountController extends GetxController {
  Rx<Color> backgroundColorValue = const Color(0xffF7E8E1).obs;
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;
  RxString chosenValue = LanguageConstant.myAccountText.tr.obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> firstNameController = TextEditingController().obs;
  String? countryName;
  String? currency;
  RxString countryCurrency = "".obs;


  List<String> data = [
    LanguageConstant.myAccountText.tr,
    LanguageConstant.myOrdersText.tr,
    LanguageConstant.myWishlistText.tr,
    LanguageConstant.addressBookText.tr,
    LanguageConstant.accountInformationText.tr,
    LanguageConstant.myTicketsText.tr,
  ];

  @override
  void onInit() {
    super.onInit();
    getCountryData();
  }

  getCountryData() async {
    String data = await getPrefStringValue(key_local_store_model);
    if (data != null && data.isNotEmpty) {
      LocalStoreModel localStoreModel = LocalStoreModel.fromJson(jsonDecode(data));
      print("Get LocalMap -> ${jsonEncode(localStoreModel)}");
      countryCurrency.value = "${localStoreModel.name} (${localStoreModel.currentCurrency})";
      update();
    }
  }
}
