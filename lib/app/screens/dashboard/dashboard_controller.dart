
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/checkout_order/checkout_binding.dart';
import 'package:solo_luxury/app/screens/country/country_binding.dart';
import 'package:solo_luxury/app/screens/home/home_binding.dart';
import 'package:solo_luxury/app/screens/product_listing/product_list_binding.dart';
import 'package:solo_luxury/app/screens/profile/profile_binding.dart';


class DashboardController extends GetxController with GetSingleTickerProviderStateMixin{
  TabController? tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(initialIndex: 0, length: 5, vsync: this);
    HomeBindings().dependencies();
    ProductListBinding().dependencies();
    CheckoutOrderBindings().dependencies();
    ProfileBindings().dependencies();
  }
}
