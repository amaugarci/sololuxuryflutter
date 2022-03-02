import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../config/global_config.dart';

class FaqContentReq {
  static Future<String> fetchFaqData() async {
    String url = "$golobalURL/rest/default/V1/snowdog/cmsPage/16";
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $token',
    };

    final client = http.Client();

    final response = await client.get(Uri.parse(url), headers: headers);
    String apiData = '';
    try {
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        apiData = data['content'].toString();

        print(apiData.toString());
      }
    } on FormatException catch (e) {
      print(e);
    }
    return apiData.toString();
    // return apiData.map((e) => FaqModel.fromJson(e)).toList();
  }

  // static Future<List<FaqModel>?> fetchFaqData() async {
  //   //String url = "https://dev5.sololuxury.com/rest/V1/snowdog/cmsPage/16";
  //   String url = "$golobalURL/rest/default/V1/snowdog/cmsPage/16";
  //   var client = http.Client();
  //   var response = await client.get(Uri.parse(url));
  //   if (response.statusCode == 200) {
  //     var jsonString = response.body;
  //     var api
  //     return faqModelFromJson(jsonString);
  //   }

  //   return null;
  // }
}
