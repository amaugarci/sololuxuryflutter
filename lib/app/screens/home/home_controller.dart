import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/components/expandable_container.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/data/model/Home/menu_model.dart';
import 'package:solo_luxury/data/model/checkout_order/shipping_information_model.dart';
import 'package:solo_luxury/utils/repository/network_repository.dart';

import '../../../data/model/checkout_order/estimate_shipping_method_model.dart';
import '../../../utils/get_network_service/APIRepository/home_api_repository.dart';

class HomeController extends GetxController {
  RxInt index = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getMenuDataFromApi();
  }

  getMenuDataFromApi() async {
    print("getMenuDataFromApi -> ");
  }
}
