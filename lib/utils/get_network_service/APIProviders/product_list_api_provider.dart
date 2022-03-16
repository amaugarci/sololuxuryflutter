import 'package:get/get.dart';

import '../../../data/model/Product/product_model.dart';
import '../../app_constants.dart';

abstract class IProductListProvider {
  Future<Response<List<ProductModel>>> getProductListResponseProvider({required String endPoint});
}

class ProductListProvider extends GetConnect implements IProductListProvider {

  @override
  void onInit() {
    httpClient.defaultDecoder = (val) => ProductModel.fromJson(val);
    httpClient.baseUrl = AppConstants.apiEndPointLogin;
  }

  @override
  Future<Response<List<ProductModel>>> getProductListResponseProvider({required String endPoint}) {
    print("url -> " + httpClient.baseUrl.toString() + endPoint);
    return get(endPoint,  headers: {"Content-type" : "application/json", "Authorization" : AppConstants.adminToken});
  }

}