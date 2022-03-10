import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactUsController extends GetxController {
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;
  RxInt index = 0.obs;
  
  @override
  void onInit() {
    super.onInit();
  }
}
