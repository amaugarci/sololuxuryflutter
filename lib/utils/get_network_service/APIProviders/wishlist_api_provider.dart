import 'package:get/get.dart';

import '../../../data/model/Product/product_model.dart';
import '../../app_constants.dart';

abstract class IWishListProvider {
  Future<Response<ProductModel>> getWishListResponseProvider({required String endPoint});
}

class WishListAPIProvider extends GetConnect implements IWishListProvider {

  @override
  void onInit() {
    httpClient.defaultDecoder = (val) => ProductModel.fromJson(val);
    httpClient.baseUrl = AppConstants.apiEndPointLogin;
  }

  @override
  Future<Response<ProductModel>> getWishListResponseProvider({required String endPoint}) {
    print("url -> " + httpClient.baseUrl.toString() + endPoint);
    return get(endPoint,  headers: {"Content-type" : "application/json", "Authorization" : AppConstants.adminToken});
  }


}