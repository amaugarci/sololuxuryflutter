import 'package:get/get.dart';

import '../../../data/model/Product/product_model.dart';
import '../../../data/model/Wishlist/wishlist_model.dart';
import '../../../main.dart';
import '../../app_constants.dart';

abstract class IWishListProvider {
  Future<Response<WishListProductModel>> getWishListResponseProvider({required String endPoint});
}

class WishListAPIProvider extends GetConnect implements IWishListProvider {

  @override
  void onInit() {
    httpClient.defaultDecoder = (val) => WishListProductModel.fromJson(val);
    httpClient.baseUrl = AppConstants.apiEndPointLogin;
  }

  @override
  Future<Response<WishListProductModel>> getWishListResponseProvider({required String endPoint}) {
    print("url -> " + httpClient.baseUrl.toString() + endPoint);
    print("customer token -> " + localStore.customerToken);
    return get(endPoint,  headers: {"Content-type" : "application/json", "Authorization" : localStore.customerToken});
  }


}