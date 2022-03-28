import 'package:get/get.dart';
import 'package:solo_luxury/data/model/cart/cart_model.dart';
import 'package:solo_luxury/utils/app_constants.dart';

abstract class ICartProvider {
  Future<Response<CartModel>> getCartGetDataResponseProvider(
      {required String endPoint});
}

class CartGetDataProvider extends GetConnect implements ICartProvider {
  @override
  void onInit() {
    httpClient.defaultDecoder = (val) => CartModel.fromJson(val);
    httpClient.baseUrl = AppConstants.apiEndPointLogin;
  }

  @override
  Future<Response<CartModel>> getCartGetDataResponseProvider(
      {required String endPoint}) {
    print("url -> " + httpClient.baseUrl.toString() + endPoint);
    return get(endPoint, headers: {
      "Content-type": "application/json",
      "Authorization": "Bearer cn99fk8jhg6j7z2tuq7fyyo2ucqv602s"
    });
    // TODO: implement getCartGetDataResponseProvider
    throw UnimplementedError();
  }
}
