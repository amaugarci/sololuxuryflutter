import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/data/get_my_orders.dart';

class MyOrdersController extends GetxController {
  var myOrdersList = [].obs;

  RxInt index = 0.obs;
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;

  @override
  void onInit() {
    super.onInit();
    getMyOrders();
  }

  void getMyOrders() async {
    List myOrders = await GetMyOrdersRequest.fetchMyOrdersData();
    if (myOrders != null) {
      myOrdersList.value = myOrders;
    }
  }
}
