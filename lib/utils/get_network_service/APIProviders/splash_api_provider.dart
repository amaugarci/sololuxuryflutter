import 'dart:convert';

import 'package:get/get.dart';
import 'package:solo_luxury/utils/app_constants.dart';

abstract class ISplashProvider {
  Future<Response> getSplashAPIResponse({required String endPoint});
}

class SplashAPIProvider extends GetConnect implements ISplashProvider {
  @override
  void onInit() {
    httpClient.defaultDecoder = (val) => jsonEncode(val);
    httpClient.baseUrl = AppConstants.apiCountryGet;
    httpClient.timeout = const Duration(seconds: 60);
  }
  
  
  @override
  Future<Response> getSplashAPIResponse({required String endPoint}) {
    print("url -> " + httpClient.baseUrl.toString() + endPoint);
    return get(endPoint);
  }
}