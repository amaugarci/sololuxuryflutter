import 'dart:convert';

import 'package:get/get.dart';
import 'package:solo_luxury/data/model/cart/cart_model.dart';
import 'package:solo_luxury/utils/app_constants.dart';

import '../../../main.dart';

abstract class ICartProvider {
  Future<Response> getCartGetDataResponseProvider({required String endPoint});
  Future<dynamic> deleteCartQtyDataResponseProvider({required String endPoint});
}

class CartGetDataProvider extends GetConnect implements ICartProvider {
  @override
  void onInit() {
    httpClient.defaultDecoder = (val) => jsonEncode(val);
    httpClient.baseUrl = AppConstants.apiEndPointLogin;
  }

  @override
  Future<Response> getCartGetDataResponseProvider({required String endPoint}) {
    print("url -> " + httpClient.baseUrl.toString() + endPoint);
    return get(endPoint, headers: {
      "Content-type": "application/json",
      "Authorization": localStore.customerToken
    });
  }

  Future<dynamic> deleteCartQtyDataResponseProvider(
      {required String endPoint}) {
    print("url -> " + httpClient.baseUrl.toString() + endPoint);
    return delete(endPoint, headers: {
      "Content-type": "application/json",
      "Authorization": localStore.customerToken
    });
  }
}
