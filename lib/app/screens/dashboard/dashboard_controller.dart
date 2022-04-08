import 'dart:convert';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/brand_list/brand_binding.dart';
import 'package:solo_luxury/app/screens/checkout_order/checkout_binding.dart';
import 'package:solo_luxury/app/screens/country/country_binding.dart';
import 'package:solo_luxury/app/screens/home/home_binding.dart';
import 'package:solo_luxury/app/screens/my_account/my_account_binding.dart';
import 'package:solo_luxury/app/screens/my_orders/my_orders_binding.dart';
import 'package:solo_luxury/app/screens/product_detail/product_detail_binding.dart';
import 'package:solo_luxury/app/screens/product_detail/product_detail_controller.dart';
import 'package:solo_luxury/app/screens/product_listing/product_list_binding.dart';
import 'package:solo_luxury/app/screens/profile/profile_binding.dart';
import 'package:solo_luxury/app/screens/search/search_binding.dart';
import 'package:solo_luxury/app/screens/wishlist/wishlist_binding.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';

import '../../../data/model/Home/menu_model.dart';
import '../../../utils/get_network_service/APIRepository/dashboard_api_repository.dart';

class DashboardController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TabController? tabController;

  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  Rx<MenuModel>? menuModel = MenuModel().obs;
  RxString appbarTitle = "".obs;

  RxString chosenValue = "ENG".obs;
  final DashboardAPIRepository dashboardAPIRepository;
  DashboardController({required this.dashboardAPIRepository});

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(initialIndex: 0, length: 5, vsync: this);
    HomeBindings().dependencies();
    ProductListBinding().dependencies();
    CheckoutOrderBindings().dependencies();
    ProfileBindings().dependencies();
    WishlistBindings().dependencies();
    MyAccountBinding().dependencies();
    SearchBinding().dependencies();
    MyOrdersBinding().dependencies();
    ProductDetailsBindings().dependencies();
    BrandBinding().dependencies();
    getMenuDataFromApi();
  }

  getMenuDataFromApi() async {
    print("getMenuDataFromApi -> ");
    //menuModel!.value = await NetworkRepository().getMenu();

    var data = await dashboardAPIRepository.getMenuAPIResponse();

    if (data != null) {

      String dataString = jsonEncode(data);
      menuModel!.value = MenuModel.fromJson(jsonDecode(dataString));
    }
  }

  List<String> data = [
    "ENG",
    "EUR",
  ];
}
