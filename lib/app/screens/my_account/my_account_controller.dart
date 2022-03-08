import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';

class MyAccountController extends GetxController {
  Rx<Color> backgroundColorValue = const Color(0xffF7E8E1).obs;
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;
  RxString chosenValue = 'My Account'.obs;

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
  }
}
