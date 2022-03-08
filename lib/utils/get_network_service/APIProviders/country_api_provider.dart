import 'dart:convert';

import 'package:get/get.dart';
import 'package:solo_luxury/data/model/signup_request_model.dart';
import 'package:solo_luxury/data/model/signup_response_model.dart';
import 'package:solo_luxury/utils/app_constants.dart';

import '../../../data/model/Home/menu_model.dart';

abstract class ICountryProvider {
  Future<Response> getStoreAPIResponse({required String endPoint});
}

class CountryAPIProvider extends GetConnect implements ICountryProvider {
  @override
  void onInit() {
    //Get All Store Model (Websites,Views and Configs)
    httpClient.defaultDecoder = (val) => jsonEncode(val);
    httpClient.baseUrl = AppConstants.apiEndPointNew2;
    httpClient.timeout = const Duration(seconds: 60);
  }

  @override
  Future<Response> getStoreAPIResponse({required String endPoint}) {
    httpClient.defaultDecoder = (val) => jsonEncode(val);
    httpClient.baseUrl = AppConstants.apiEndPointNew2;
    print("url -> " + httpClient.baseUrl.toString() + endPoint);
    return get(endPoint, headers: {"Content-type": "application/json", "Authorization": AppConstants.defaultToken});
  }
}
