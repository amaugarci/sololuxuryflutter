import 'package:get/get.dart';
import 'package:solo_luxury/data/model/RecommendedProducts/recommended_products_model.dart';
import 'package:solo_luxury/utils/app_constants.dart';

abstract class IRecommendedProductsProvider {
  Future<Response<RecommendedProductModel>> getRecommendedProductsProvider(
      {required String endPoint});
}

class RecommendedProductsAPIProvider extends GetConnect
    implements IRecommendedProductsProvider {
  @override
  void onInit() {
    httpClient.defaultDecoder = (val) => RecommendedProductModel.fromJson(val);
    httpClient.baseUrl = AppConstants.recommendedProductsEndPoint;
  }

  @override
  Future<Response<RecommendedProductModel>> getRecommendedProductsProvider(
      {required String endPoint}) {
    print("getRecommendedProductsProvider===============");
    return get(
      endPoint,
    );
    // TODO: implement getRecommendedProductsProvider
    throw UnimplementedError();
  }
}
