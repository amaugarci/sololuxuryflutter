import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../config/global_config.dart';

Future<Map<String, dynamic>> getProductDetailRequest(String sku) async {

  String url = "$GLOBAL_URL/rest/all/V1/products/"+sku;

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