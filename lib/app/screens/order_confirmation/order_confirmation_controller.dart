import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/data/model/orderConfirmation/order_confirmation_model.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/order_confirmation_api_repository.dart';

class OrderConfirmationController extends GetxController {
  Rx<Color> backgroundColorValue = const Color(0xffF7E8E1).obs;
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  RxList<Items> items = RxList<Items>();
  var stringParams = <String, dynamic>{};
  final OrderConfirmationApiRepository orderConfirmationApiRepository;

  OrderConfirmationController({required this.orderConfirmationApiRepository});

  @override
  void onInit() {
    super.onInit();
    getOrderConfirmationData();
  }

  void getOrderConfirmationData({var orderId}) async {
    stringParams = await orderConfirmationApiRepository
        .getOrderConfirmationApiResponse(orderId: "1");
    final subList = stringParams["items"];
    items.value = List<Items>.from(
        subList.map((countryList) => Items.fromJson(countryList)));
    print("DATADATTATATTA=======${items[0].name}");
  }
}
