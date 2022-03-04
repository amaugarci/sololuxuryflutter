import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../checkout_order/checkout_binding.dart';

class ProfileController extends GetxController {
  TabController? tabController;
  List<String> profileMenu = [
    "MY ACCOUNT",
    "MY ORDERS",
    "MY WISH LIST",
    "ADDRESS BOOK",
    "ACCOUNT INFORMATION",
    "STORED PAYMENT METHODS",
    "NEWSLETTER SUBSCRIPTIONS"
  ];

  @override
  void onInit() {
    super.onInit();
    print("ProfileController -> $runtimeType");
  }
}
