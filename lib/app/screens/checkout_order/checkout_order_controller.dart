// ignore_for_file: invalid_use_of_protected_member

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/data/model/Home/menu_model.dart';
import 'package:solo_luxury/data/model/checkout_order/shipping_information_model.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/check_order_api_repository.dart';
import 'package:solo_luxury/utils/repository/network_repository.dart';

import '../../../data/model/checkout_order/estimate_shipping_method_model.dart';
import '../../../data/model/checkout_order/multi_address_model.dart';
import '../../../main.dart';
import '../home/home_controller.dart';

class CheckoutOrderController extends GetxController {
  Rx<EstimateShippingMethodModel>? estimateShipModel = EstimateShippingMethodModel().obs;
  Rx<ShippingInformationModel>? shipInfoModel = ShippingInformationModel().obs;
  RxList? estimatesList = [].obs;
  Rx<MultiAddressModel>? multiAddressModel = MultiAddressModel().obs;
  RxInt selectedAddressIndex = 0.obs;
  RxInt selectedShippingIndex = 0.obs;
  RxInt selectedPaymentIndex = 0.obs;
  RxBool isShowItems = true.obs;
  final formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();

  final CheckoutOrderAPIRepository checkoutOrderAPIRepository;

  CheckoutOrderController({required this.checkoutOrderAPIRepository});

  @override
  void onInit() {
    super.onInit();
    getEstimateAndShipInformationFromApi();
  }

  getEstimateAndShipInformationFromApi() async {
    Rx<MultiAddressModel>? multiAddressModel = MultiAddressModel().obs;
    RxInt selectedAddressIndex = 0.obs;
    final response = await checkoutOrderAPIRepository.getMultiAddressAPIResponse();
    if(response.isNotEmpty){
      multiAddressModel.value = MultiAddressModel.fromJson(jsonDecode(response));
    }
    if (estimatesList != null) {
      estimatesList?.value = [];
      var params = json.encode({
        "address": {
          "region": "Maharashtra",
          "region_id": 553,
          "region_code": "MH",
          "country_id": "IN",
          "street": ["123 Oak Ave"],
          "postcode": "400012",
          "city": "Mumbai",
          "firstname": "ap",
          "lastname": "test",
          "customer_id": 55,
          "email": "aptest@gmail.com",
          "telephone": "9876988111",
          "same_as_billing": 1
        }
      });
      estimatesList?.value = jsonDecode(await checkoutOrderAPIRepository.postEstimateAPIResponse(params));
      // estimatesList?.value = await NetworkRepository().postEstimateShippingMethod() ?? [];
    }

    var params = json.encode({
      "addressInformation": {
        "shipping_address": {
          "region": "Maharashtra",
          "region_id": 553,
          "region_code": "MH",
          "country_id": "IN",
          "street": ["123 Oak Ave"],
          "postcode": "400012",
          "city": "Mumbai",
          "firstname": "ap",
          "lastname": "test",
          "email": "aptest@gmail.com",
          "telephone": "9876988111"
        },
        "billing_address": {
          "region": "Maharashtra",
          "region_code": "MH",
          "country_id": "IN",
          "street": ["123 Oak Ave"],
          "postcode": "400012",
          "city": "Mumbai",
          "firstname": "ap",
          "lastname": "test",
          "email": "aptest@gmail.com",
          "telephone": "9876988111"
        },
        "shipping_carrier_code": "freeshipping",
        "shipping_method_code": "freeshipping"
      }
    });
    shipInfoModel!.value  = await checkoutOrderAPIRepository.postShippingInformationAPIResponse(params);
    // shipInfoModel!.value = await NetworkRepository().postShippingInformation();
  }

  //TODO : Payment Response using Platform

  RxString nativeCode = 'Waiting for Response...'.obs;

  Future<void> responseFromNativeCode() async {
    String response = "";
    try {
      final String result = await platform.invokeMethod('helloFromNativeCode',[]);
      response = result;
      Map<String, dynamic> map = jsonDecode(response);
      print("result -> ${map.toString()}");
      print("result -> ${map['resultCode']}");
    } on PlatformException catch (e) {
      response = "Failed to Invoke: '${e.message}'.";
    }
    nativeCode.value = response;
  }

}
