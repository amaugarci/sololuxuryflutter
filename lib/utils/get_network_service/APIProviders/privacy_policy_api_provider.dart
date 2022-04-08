import 'dart:convert';
import 'package:get/get.dart';
import '../../app_constants.dart';

abstract class IPrivacyPolicyProvider {
  Future<dynamic> getPrivacyPolicyAPIResponse({required String endPoint});
}

class PrivacyPolicyAPIProvider extends GetConnect
    implements IPrivacyPolicyProvider {
  @override
  void onInit() {
    //Get All Store Model (Websites,Views and Configs)
    httpClient.defaultDecoder = (val) => jsonEncode(val);
    httpClient.baseUrl = "https://www.sololuxury.com/rest/V1/";
    httpClient.timeout = const Duration(seconds: 60);
  }

  @override
  Future<dynamic> getPrivacyPolicyAPIResponse({required String endPoint}) {
    httpClient.defaultDecoder = (val) => jsonEncode(val);
    httpClient.baseUrl = "https://www.sololuxury.com/rest/V1/";
    httpClient.timeout = const Duration(seconds: 60);
    print("url country -> " + httpClient.baseUrl.toString() + endPoint);
    return get(endPoint, headers: {
      "Content-type": "application/json",
      "Authorization": AppConstants.defaultToken
    });
  }
}
