import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/main.dart';
import 'package:solo_luxury/utils/app_constants.dart';

import '../../../config/global_config.dart';
import '../../../data/model/checkout_order/multi_address_model.dart';

abstract class ICheckOutOrderProvider {
  Future<dynamic> getMultiAddressResponseProvider({required String endPoint});
  Future<dynamic> postEstimateResponseProvider(
      {required String endPoint, required String requestJson});
  Future<dynamic> postGuestEstimateResponseProvider(
      {required String endPoint, required String requestJson});
  Future<dynamic> postShippingInformationResponseProvider(
      {required String endPoint, required String requestJson});
  Future<dynamic> postGuestShippingInformationResponseProvider(
      {required String endPoint, required String requestJson});
  Future<dynamic> postCreateOrderResponseProvider(
      {required String endPoint, required String requestJson});
  Future<dynamic> postAddAddressResponse(
      {required String endPoint, required String requestJson});
  Future<dynamic> getcountryListAPIResponse({required String endPoint});
}

class CheckOutOrderProvider extends GetConnect
    implements ICheckOutOrderProvider {


  Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    'Authorization': localStore.customerToken,
  };

  Map<String, String> guestHeaders = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    'Authorization': AppConstants.adminToken,
  };

  Map<String, String> adminHeader = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    'Authorization': AppConstants.adminToken,
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
  Future<dynamic> postGuestEstimateResponseProvider(
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
  Future<dynamic> postGuestShippingInformationResponseProvider(
      {required String endPoint, required String requestJson}) {
    // TODO: implement postGuestShippingInformationResponseProvider
    print("url -> " + httpClient.baseUrl.toString() + endPoint);
    return post(endPoint, requestJson, headers: guestHeaders);
  }

  @override
  Future<dynamic> postCreateOrderResponseProvider(
      {required String endPoint, required String requestJson}) {
    print("postCreateOrderResponseProvider -> ");
    print("url -> " + httpClient.baseUrl.toString() + endPoint);
    debugPrint("requestJson -> " + requestJson);
    return put(endPoint, requestJson, headers: adminHeader);
  }

  @override
  Future<dynamic> getcountryListAPIResponse({required String endPoint}) {
    httpClient.defaultDecoder = (val) => val;
    httpClient.baseUrl = AppConstants.apiEndPointLogin;
    httpClient.timeout = const Duration(seconds: 60);
    print("url country -> " + httpClient.baseUrl.toString() + endPoint);
    return get(endPoint, headers: {
      "Content-type": "application/json",
      "Authorization": AppConstants.adminToken
    });
  }

  @override
  Future<dynamic> postAddAddressResponse(
      {required String endPoint, required String requestJson}) {
    print("url -> " + httpClient.baseUrl.toString() + endPoint);
    return put(endPoint, requestJson, headers: {
      "Content-type": "application/json",
      "Authorization": localStore.customerToken
    });
  }
}
