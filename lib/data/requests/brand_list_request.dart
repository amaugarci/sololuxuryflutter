import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:solo_luxury/data/model/brand_list/BrandData.dart';

import '../../config/global_config.dart';

class BrandListRequest {
  static Future<List<BrandData>> fetchBrands() async {
    String url = "$golobalURL/rest/V1/brandList";
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $token',
    };

    final client = http.Client();

    final response = await client.get(Uri.parse(url), headers: headers);
    List apiData = [];

    try {
      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);
        print(data);
        apiData = data;
      }
    } on FormatException catch (e) {
      print(e);
    }
    // return apiData.toString();
    return apiData.map((e) => BrandData.fromJson(e)).toList();
  }
}
