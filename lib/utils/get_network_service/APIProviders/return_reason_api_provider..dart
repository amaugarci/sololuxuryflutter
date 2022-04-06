import 'package:get/get_connect/http/src/response/response.dart';

import 'dart:convert';

import 'package:get/get.dart';
import 'package:solo_luxury/data/model/brand_list/brand_model.dart';
import 'package:solo_luxury/main.dart';
import 'package:solo_luxury/utils/app_constants.dart';

abstract class IReturnReasonProvider {
  Future<Response> getReturnReasonAPIResponse({required String endPoint});
}

class ReturnReasonAPIProvider extends GetConnect
    implements IReturnReasonProvider {
  @override
  void onInit() {
    httpClient.defaultDecoder = (val) => jsonEncode(val);
    httpClient.baseUrl = AppConstants.apiEndPointNew2;
    httpClient.timeout = const Duration(seconds: 60);
  }

  @override
  Future<Response> getReturnReasonAPIResponse({required String endPoint}) {
    httpClient.defaultDecoder = (val) => jsonEncode(val);
    httpClient.baseUrl = AppConstants.apiEndPointNew2;
    httpClient.timeout = const Duration(seconds: 60);
    print("url country -> " + httpClient.baseUrl.toString() + endPoint);
    return get(endPoint, headers: {
      "Content-type":
          "multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW",
      "Authorization": AppConstants.defaultToken3
    });
  }
}
