import 'package:get/get_connect/http/src/response/response.dart';

import 'dart:convert';

import 'package:get/get.dart';
import 'package:solo_luxury/data/model/brand_list/brand_model.dart';
import 'package:solo_luxury/main.dart';
import 'package:solo_luxury/utils/app_constants.dart';
import 'package:http/http.dart' as http;

abstract class IReturnReasonProvider {
  Future<Response> getReturnReasonAPIResponse({required String endPoint});
  Future<Response> getOrderTeakingAPIResponse({required String endPoint});
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
    httpClient.baseUrl = AppConstants.apiEndPointLogin;
    httpClient.timeout = const Duration(seconds: 60);
    print("url country -> " + httpClient.baseUrl.toString() + endPoint);
    return get(endPoint, headers: {
      "Content-type":
          "multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW",
      "Authorization": AppConstants.defaultToken
    });
  }

  @override
  Future<dynamic> postReturnItemResponseProvider({
    required String orderId,
    required String productsku,
    required String email,
    required String reason,
    required String langCode,
  }) async {
    var request = http.MultipartRequest(
        "POST",
        Uri.parse(
            AppConstants.apiEndPointLogin + AppConstants.postReturnReasonApi));
    request.fields["returnForm[order_id]"] = "${orderId.toString()}";
    request.fields["returnForm[product_sku]"] = "${productsku.toString()}";
    request.fields["returnForm[customer_email]"] = "${email.toString()}";
    request.fields["returnForm[type]"] = "return";
    request.fields["returnForm[reason]"] = "${reason.toString()}";
    request.fields["returnForm[lang_code]"] = "${langCode.toString()}";
    request.fields["returnForm[website]"] = "www.sololuxury.com";

    // request.fields["sku"] = "${sku.toString()}";
    final response = await request.send().timeout(const Duration(seconds: 60));
    var res = await http.Response.fromStream(response);
    print("response -> " + res.body);
    var json1 = json.decode(res.body);
    return json1;
  }

  @override
  Future<Response> getOrderTeakingAPIResponse({required String endPoint}) {
    httpClient.defaultDecoder = (val) => jsonEncode(val);
    httpClient.baseUrl = AppConstants.apiEndPointLogin;
    httpClient.timeout = const Duration(seconds: 60);
    print("url country -> " + httpClient.baseUrl.toString() + endPoint);
    return get(endPoint, headers: {
      "Content-type":
          "multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW",
      "Authorization": AppConstants.defaultToken
    });
  }
}
