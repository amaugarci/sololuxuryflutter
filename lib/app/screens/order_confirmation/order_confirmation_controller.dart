import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/data/model/orderConfirmation/order_confirmation_model.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/order_confirmation_api_repository.dart';

class OrderConfirmationController extends GetxController {
  Rx<Color> backgroundColorValue = const Color(0xffF7E8E1).obs;
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  RxList<Items> items = RxList<Items>();
  var stringParams = <String, dynamic>{};
  RxString orderId = "".obs;
  final OrderConfirmationApiRepository orderConfirmationApiRepository;

  OrderConfirmationController({required this.orderConfirmationApiRepository});

  @override
  void onInit() {
    super.onInit();
    orderId.value = Get.arguments;
    if(orderId.value != null){
      getOrderConfirmationData(orderId: orderId.value);
    }
  }

  void getOrderConfirmationData({var orderId}) async {
    stringParams = await orderConfirmationApiRepository
        .getOrderConfirmationApiResponse(orderId: orderId);
    final subList = stringParams["items"];
    print("this is subList -> $subList");
    items.value = List<Items>.from(
        subList.map((countryList) => Items.fromJson(countryList)));
   // print("DATADATTATATTA=======${items[0].name}");
  }
}
