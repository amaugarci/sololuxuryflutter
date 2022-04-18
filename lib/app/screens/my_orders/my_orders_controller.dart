import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/data/model/MyOrders/MyOrdersData.dart';
import 'package:solo_luxury/data/requests/get_my_orders.dart';

import '../../../utils/get_network_service/APIRepository/my_orders_api_repository.dart';

class MyOrdersController extends GetxController {
  var myOrdersList = <MyOrdersData>[].obs;
  RxInt index = 0.obs;
  Rx<MyOrdersData>? myOrdersModel = MyOrdersData().obs;
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;

  final MyOrdersAPIRepository myOrdersAPIRepository;
  MyOrdersController({required this.myOrdersAPIRepository});
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getMyOrders();
  }

  // void getMyOrders() async {
  //   List<MyOrdersData> myOrders = await GetMyOrdersRequest.fetchMyOrdersData();
  //   if (myOrders != null) {
  //     myOrdersList.value = myOrders;
  //   }
  // }

  void getMyOrders() async {
    isLoading.value = true;
    myOrdersModel?.value = await myOrdersAPIRepository.getMyOrdersApiResponse();
    isLoading.value = false;
  }
}
