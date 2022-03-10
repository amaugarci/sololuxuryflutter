import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:solo_luxury/config/global_config.dart';
import 'package:solo_luxury/data/model/MyOrders/MyOrdersData.dart';

class GetMyOrdersRequest {
  static Future<List<MyOrdersData>> fetchMyOrdersData() async {
    String url =
        "$golobalURL/rest/default/V1/orders?searchCriteria[filter_groups][0][filters][0][field]=customer_email&searchCriteria[filter_groups][0][filters][0][value]=devdyna@gmail.com";
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      'Authorization': 'Bearer $token',
    };

    final client = http.Client();

    final response = await client.get(Uri.parse(url), headers: headers);
    List apiData = [];
    Iterable itemData = [];

    try {
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        apiData = data['items'];

        // List resData1 = apiData;
        // print(resData1);
        itemData = apiData[0]['items'];
        print(itemData);
      }
    } on FormatException catch (e) {
      print(e);
    }
//    return apiData.toString();
    return itemData.map((e) => MyOrdersData.fromJson(e)).toList();
  }

  static Future<List<MyOrdersData>> fetchBillingAddressData() async {
    String url =
        "$golobalURL/rest/default/V1/orders?searchCriteria[filter_groups][0][filters][0][field]=customer_email&searchCriteria[filter_groups][0][filters][0][value]=devdyna@gmail.com";
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
        Map data = jsonDecode(response.body);
        apiData = data['items'];

        String itemData = data['base_currency_code'].toString();

        print(itemData.toString());
      }
    } on FormatException catch (e) {
      print(e);
    }
//    return apiData.toString();
    return apiData.map((e) => MyOrdersData.fromJson(e)).toList();
  }
}
