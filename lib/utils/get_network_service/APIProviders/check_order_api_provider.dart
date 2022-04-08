import 'dart:convert';

import 'package:get/get.dart';
import 'package:solo_luxury/main.dart';
import 'package:solo_luxury/utils/app_constants.dart';

import '../../../config/global_config.dart';
import '../../../data/model/checkout_order/multi_address_model.dart';

abstract class ICheckOutOrderProvider {
  Future<dynamic> getMultiAddressResponseProvider({required String endPoint});
  Future<dynamic> postEstimateResponseProvider(
      {required String endPoint, required String requestJson});
  Future<dynamic> postShippingInformationResponseProvider(
      {required String endPoint, required String requestJson});
  Future<dynamic> postCreateOrderResponseProvider(
      {required String endPoint, required String requestJson});
}

class CheckOutOrderProvider extends GetConnect
    implements ICheckOutOrderProvider {
  Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    'Authorization': localStore.customerToken,
  };

  @override
  void onInit() {
    httpClient.defaultDecoder = (val) => val;
    //httpClient.baseUrl = AppConstants.apiEndPointNew1;
    httpClient.timeout = Duration(seconds: 60);
    httpClient.baseUrl = AppConstants.apiEndPointLogin;
  }

  @override
  Future<dynamic> getMultiAddressResponseProvider({required String endPoint}) {
    print("url -> " + httpClient.baseUrl.toString() + endPoint);
    print("headers -> " + headers.toString());
    // httpClient.defaultDecoder = (val) => MultiAddressModel.fromJson(val);
    return get(endPoint, headers: headers);
  }

  @override
  Future<dynamic> postEstimateResponseProvider(
      {required String endPoint, required String requestJson}) {
    // TODO: implement getLoginResponseProvider
    print("url -> " + httpClient.baseUrl.toString() + endPoint);
    return post(endPoint, requestJson, headers: headers);
  }

  @override
  Future<dynamic> postShippingInformationResponseProvider(
      {required String endPoint, required String requestJson}) {
    // TODO: implement postShippingInformationResponseProvider
    print("url -> " + httpClient.baseUrl.toString() + endPoint);
    return post(endPoint, requestJson, headers: headers);
  }

  @override
  Future<dynamic> postCreateOrderResponseProvider(
      {required String endPoint, required String requestJson}) {
    print("url -> " + httpClient.baseUrl.toString() + endPoint);
    return put(endPoint, requestJson, headers: {
      "Content-Type": "application/json",
      'Authorization': AppConstants.defaultToken,
    });
  }
}
