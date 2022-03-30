import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/data/model/orderConfirmation/order_confirmation_model.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/order_confirmation_api_repository.dart';

class OrderConfirmationController extends GetxController {
  Rx<Color> backgroundColorValue = const Color(0xffF7E8E1).obs;
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  Rx<OrderConfirmationModel>? orderConfirmation = OrderConfirmationModel().obs;
  final OrderConfirmationApiRepository orderConfirmationApiRepository;

  OrderConfirmationController({required this.orderConfirmationApiRepository});

  @override
  void onInit() {
    super.onInit();
    getOrderConfirmationData();
  }

  void getOrderConfirmationData({var orderId}) async {
    orderConfirmation?.value = await orderConfirmationApiRepository
        .getOrderConfirmationApiResponse(orderId: "1");
  }
}
