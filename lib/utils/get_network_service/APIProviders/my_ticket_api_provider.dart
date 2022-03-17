import 'package:get/get_connect/http/src/response/response.dart';

import 'dart:convert';

import 'package:get/get.dart';
import 'package:solo_luxury/data/model/country/country_model.dart';
import 'package:solo_luxury/utils/app_constants.dart';
import 'package:http/http.dart' as http;

abstract class IMyTicketProvider {
  Future<dynamic> getmyTicketAPIResponse(
      {required String endPoint, required String requestJson});
}

class MyTicketAPIProvider extends GetConnect implements IMyTicketProvider {
  Map<String, String> headers = {
    "Content-Type": "application/json",
    "Cookie": "PHPSESSID=kleu1ck02qon4i2obtjo6cef2j",
    'Authorization': AppConstants.adminToken,
  };

  @override
  void onInit() {
    //Get All Store Model (Websites,Views and Configs)
    httpClient.defaultDecoder = (val) => jsonEncode(val);
    httpClient.baseUrl = AppConstants.apiEndPointLogin;
    httpClient.timeout = const Duration(seconds: 60);
  }

  @override
  Future<dynamic> getmyTicketAPIResponse(
      {required String endPoint, required dynamic requestJson}) async {
    print('Api Is ${AppConstants.apiEndPointLogin + AppConstants.myTicketApi}');
    // var request = http.MultipartRequest(
    //     "POST", Uri.parse("https://dev3.sololuxury.com/rest/V1/mytickets/"));
    var request = http.MultipartRequest("POST",
        Uri.parse(AppConstants.apiEndPointLogin + AppConstants.myTicketApi));
    request.fields["website"] = "www.sololuxury.com";
    request.fields["email"] = "devdyna@gmail.com";
    final response = await request.send().timeout(const Duration(seconds: 60));
    var res = await http.Response.fromStream(response);
    var json1 = json.decode(res.body);

    return json1;
  }
}
