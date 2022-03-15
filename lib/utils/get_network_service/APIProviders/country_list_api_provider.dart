import 'package:get/get_connect/http/src/response/response.dart';

import 'dart:convert';

import 'package:get/get.dart';
import 'package:solo_luxury/data/model/country/country_model.dart';
import 'package:solo_luxury/utils/app_constants.dart';

abstract class ICountryListProvider {
  Future<Response> getcountryListAPIResponse({required String endPoint});
  Future<Response> postAddAddressResponse(
      {required String endPoint, required String requestJson});
}

class CountryListAPIProvider extends GetConnect
    implements ICountryListProvider {
  @override
  void onInit() {
    //Get All Store Model (Websites,Views and Configs)
    httpClient.defaultDecoder = (val) => CountryListModel.fromJson(val);
    httpClient.baseUrl = AppConstants.apiEndPoint;
    httpClient.timeout = const Duration(seconds: 60);
  }

  @override
  Future<Response> getcountryListAPIResponse({required String endPoint}) {
    httpClient.defaultDecoder = (val) => jsonEncode(val);
    httpClient.baseUrl = AppConstants.apiEndPoint;
    httpClient.timeout = const Duration(seconds: 60);
    print("url country -> " + httpClient.baseUrl.toString() + endPoint);
    return get(endPoint, headers: {
      "Content-type": "application/json",
      "Authorization": AppConstants.defaultToken
    });
  }

  @override
  Future<Response> postAddAddressResponse(
      {required String endPoint, required String requestJson}) {
    print("url -> " + httpClient.baseUrl.toString() + endPoint);
    return post(endPoint, requestJson, headers: {
      "Content-type": "application/json",
      "Authorization": AppConstants.defaultToken
    });
  }
}
