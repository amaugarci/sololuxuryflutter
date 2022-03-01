import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../config/global_config.dart';
import '../model/Product/product_model.dart';


Future<List<ProductModel>> categoryProductsRequest(String categoryId) async {
  String url =
      "$GLOBAL_URL/rest/default/V1/products/?searchCriteria[filter_groups][0][filters][0][field]=category_id&searchCriteria[filter_groups][0][filters][0][value]=464";

  Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    'Authorization': 'Bearer $token',
  };

  final client = new http.Client();

  final response = await client.get(Uri.parse(url), headers: headers);
  Iterable apiData = [];
  try {
    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      apiData = data['items'];
    }
  } on FormatException catch (e) {
    print(e);
  }
  return apiData.map((e) => new ProductModel.fromJson(e)).toList();

}
