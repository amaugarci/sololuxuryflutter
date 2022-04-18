import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:solo_luxury/utils/app_constants.dart';
import '../../config/global_config.dart';
import '../model/Product/product_model.dart';

Future<List<ProductModel>> getWishlistRequest () async {
  String url = AppConstants.apiEndPointLogin+"/rest/V1/wishlist";
  Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    'Authorization': 'Bearer $AppConstants.adminToken',
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