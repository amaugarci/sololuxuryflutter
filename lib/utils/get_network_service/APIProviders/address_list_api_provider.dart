import 'package:get/get_connect/http/src/response/response.dart';

import 'dart:convert';

import 'package:get/get.dart';
import 'package:solo_luxury/data/model/brand_list/brand_model.dart';
import 'package:solo_luxury/main.dart';
import 'package:solo_luxury/utils/app_constants.dart';

abstract class IAddressListProvider {
  Future<Response> getAddressListAPIResponse({required String endPoint});
}

class AddressListAPIProvider extends GetConnect
    implements IAddressListProvider {
  @override
  void onInit() {
    httpClient.defaultDecoder = (val) => jsonEncode(val);
    httpClient.baseUrl = AppConstants.apiEndPointLogin;
    httpClient.timeout = const Duration(seconds: 60);
  }

  @override
  Future<Response> getAddressListAPIResponse({required String endPoint}) {
    httpClient.defaultDecoder = (val) => jsonEncode(val);
    httpClient.baseUrl = AppConstants.apiEndPointLogin;
    httpClient.timeout = const Duration(seconds: 60);
    print("url country -> " + httpClient.baseUrl.toString() + endPoint);
    return get(endPoint, headers: {
      "Content-type": "application/json",
      "Authorization": localStore.customerToken
    });
  }
}
