import 'dart:convert';

import 'package:get/get.dart';
import 'package:solo_luxury/utils/app_constants.dart';

import '../../../config/global_config.dart';

abstract class ICheckOutOrderProvider {
  Future<Response> postEstimateResponseProvider({required String endPoint,required String requestJson});
  Future<Response> postShippingInformationResponseProvider({required String endPoint,required String requestJson});
}

class CheckOutOrderProvider extends GetConnect implements ICheckOutOrderProvider {

  Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    'Authorization': AppConstants.defaultToken1,
  };


  @override
  void onInit() {

    httpClient.defaultDecoder = (val) => jsonEncode(val);
    httpClient.baseUrl = AppConstants.apiEndPointNew1;
  }


  @override
  Future<Response<dynamic>> postEstimateResponseProvider({required String endPoint, required String requestJson}) {
    // TODO: implement getLoginResponseProvider
    print("url -> " + httpClient.baseUrl.toString() + endPoint);
    return post(endPoint , requestJson, headers: headers);
  }

  @override
  Future<Response> postShippingInformationResponseProvider({required String endPoint, required String requestJson}) {
    // TODO: implement postShippingInformationResponseProvider
    print("url -> " + httpClient.baseUrl.toString() + endPoint);
    return post(endPoint , requestJson, headers: headers);
  }

}