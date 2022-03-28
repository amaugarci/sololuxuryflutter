import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterController extends GetxController {

  Rx<Color> backgroundColorValue = const Color(0xffF7E8E1).obs;
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;
  RxBool priceClicked = true.obs;
  RxBool colorClicked = false.obs;
  RxBool brandClicked = false.obs;
  RxBool sizeClicked = false.obs;
  RxString priceFilter = '500 - 1000'.obs;

  @override
  void onInit() {
    super.onInit();
  }

}