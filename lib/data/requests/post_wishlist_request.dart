import 'package:http/http.dart' as http;
import '../../config/global_config.dart';

Future<bool> postWishlistRequest(String sku) async {
  String url = "$GLOBAL_URL_DEV5/rest/V1/wishlist/" + sku;

  Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    'Authorization': 'Bearer $token',
  };

  final client = new http.Client();

  final response = await client.post(Uri.parse(url), headers: headers);

  bool status = false;

  try {
    if (response.statusCode == 200) {
      status = true;
    }
  } on FormatException catch (e) {
    print(e);
  }
  return status;
}