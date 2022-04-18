import 'package:get/get_connect/http/src/response/response.dart';

import 'dart:convert';

import 'package:get/get.dart';
import 'package:solo_luxury/data/model/country/country_model.dart';
import 'package:solo_luxury/main.dart';
import 'package:solo_luxury/utils/app_constants.dart';

abstract class ICountryListProvider {
  Future<dynamic> getcountryListAPIResponse({required String endPoint});
  Future<dynamic> postAddAddressResponse(
      {required String endPoint, required String requestJson});
}

class CountryListAPIProvider extends GetConnect
    implements ICountryListProvider {
  @override
  void onInit() {
    //Get All Store Model (Websites,Views and Configs)
    httpClient.defaultDecoder = (val) => CountryListModel.fromJson(val);
    httpClient.baseUrl = AppConstants.apiEndPointLogin;
    httpClient.timeout = const Duration(seconds: 60);
  }

  @override
  Future<dynamic> getcountryListAPIResponse({required String endPoint}) {
    httpClient.defaultDecoder = (val) => jsonEncode(val);
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
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': localStore.customerToken,
    });
  }
}
