import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../config/global_config.dart';


Future<Map<String, dynamic>> categoryProductsRequest(String categoryId) async {

  String url = "$GLOBAL_URL/rest/default/V1/products/?searchCriteria[filter_groups][0][filters][0][field]=category_id&searchCriteria[filter_groups][0][filters][0][value]=464&searchCriteria[filter_groups][0][filters][0][condition_type]=finset&fields=items[sku,name]";

  Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    'Authorization': 'Bearer $token',
  };

  final client = new http.Client();

  final response = await client.get(Uri.parse(url),
      headers: headers);

  Map<String, dynamic> responseJson = {};

  try {
    if (response.statusCode == 200)
      responseJson = json.decode(response.body) as Map<String, dynamic>;
  } on FormatException catch (e) {
    print(e);
  }

  return responseJson;
}
