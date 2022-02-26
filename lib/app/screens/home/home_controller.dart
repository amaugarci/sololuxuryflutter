// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/data/model/Home/menu_model.dart';
import 'package:solo_luxury/data/model/Home/shipping_information_model.dart';
import 'package:solo_luxury/utils/repository/network_repository.dart';

import '../../../data/model/Home/estimate_shipping_method_model.dart';

class HomeController extends GetxController {
  RxInt index = 0.obs;
  RxObjectMixin? menuModel = MenuModel().obs;


  @override
  void onInit() {
    super.onInit();
    getMenuDataFromApi();
  }

  getMenuDataFromApi() async {
    menuModel!.value = await NetworkRepository().getMenu();
  }
}
