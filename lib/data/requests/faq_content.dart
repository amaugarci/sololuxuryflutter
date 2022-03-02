import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:solo_luxury/data/model/Faq/faq_model.dart';

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
}
