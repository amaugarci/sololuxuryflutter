import 'dart:convert';

import 'package:solo_luxury/data/model/RecommendedProducts/recommended_products_model.dart';
import 'package:solo_luxury/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:solo_luxury/utils/get_network_service/APIProviders/recommended_products_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/repository_adapter.dart';

/*class RecommendedProductsAPIRepository
    implements IRecommendedProductsRepository {
  final RecommendedProductsAPIProvider? recommendedProductsAPIProvider;

  RecommendedProductsAPIRepository({this.recommendedProductsAPIProvider});

  @override
  Future<RecommendedProductModel> getMyAccountApiResponse() async {
    final response = await recommendedProductsAPIProvider!
        .getRecommendedProductsProvider(endPoint: AppConstants.menuEndPoint);
    if (response != null) {
      print("response.statusCode -> =================");
      print(response.statusCode);
    }
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return response.body!;
    }
    // TODO: implement getMyAccountApiResponse
    throw UnimplementedError();
  }
}*/
class RecommendedProductsAPIRepository extends GetxController {
  List itemData = [];

  Future<RecommendedProductModel?> getRecommendedProductResponse() async {
    final response = await http.get(
      Uri.parse(AppConstants.recommendedProductsEndPoint),
    );
    try {
      if (response.statusCode == 200) {
        print("Categories=======================================");
/*        print(response.body.toString());
        itemData.add(recommendedProductResponseModelFromJson(response.body));*/
        List<dynamic> list = json.decode(response.body);

        print(itemData.toString());
        print(response.statusCode);
        return recommendedProductResponseModelFromJson(list[0]);
      } else {
        print("${response.body}");
        return null;
      }
    } catch (e) {
      print("ERROR+==============$e");
    }
  }
}
