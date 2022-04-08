import 'dart:convert';

import 'package:get/get.dart';
import 'package:solo_luxury/data/model/signup_request_model.dart';
import 'package:solo_luxury/data/model/signup_response_model.dart';
import 'package:solo_luxury/utils/app_constants.dart';

import '../../../data/model/Home/menu_model.dart';
import '../../../main.dart';

abstract class ICountryProvider {
  Future<dynamic> getStoreAPIResponse({required String endPoint});
}

class CountryAPIProvider extends GetConnect implements ICountryProvider {
  @override
  void onInit() {
    //Get All Store Model (Websites,Views and Configs)
    httpClient.defaultDecoder = (val) => val;
    httpClient.baseUrl = AppConstants.apiEndPointLogin;
    httpClient.timeout = const Duration(seconds: 60);
  }

  @override
  Future<dynamic> getStoreAPIResponse({required String endPoint}) {
    print("url -> " + httpClient.baseUrl.toString() + endPoint);
    return get(endPoint, headers: {"Content-type": "application/json", "Authorization": AppConstants.adminToken});
  }
}
