import 'package:get/get.dart';

import '../../app_constants.dart';

abstract class IPostWishListProvider {
  Future<Response<String>> postWishListResponseProvider(
      {required String endPoint, required String sku});
}

class PostWishListAPIProvider extends GetConnect
    implements IPostWishListProvider {
  @override
  void onInit() {
    httpClient.defaultDecoder = (val) => val;
    httpClient.baseUrl = AppConstants.apiEndPointLogin;
  }

  @override
  Future<Response<String>> postWishListResponseProvider(
      {required String endPoint, required String sku}) {
    print("url -> " + httpClient.baseUrl.toString() + endPoint);
    return post(endPoint + '/' + sku, '', headers: {
      "Content-type": "application/json",
      "Authorization": AppConstants.adminToken
    });
  }
}
