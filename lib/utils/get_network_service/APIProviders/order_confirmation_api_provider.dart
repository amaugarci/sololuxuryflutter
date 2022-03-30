import 'package:get/get.dart';
import 'package:solo_luxury/data/model/orderConfirmation/order_confirmation_model.dart';
import 'package:solo_luxury/utils/app_constants.dart';

abstract class IMyOrdersConfirmationProvider {
  Future<Response> getOrderConfirmationProvider(
      {required String endPoint});
}

class OrdersConfirmationProvider extends GetConnect
    implements IMyOrdersConfirmationProvider {
  @override
  void onInit() {
    httpClient.defaultDecoder = (val) => val;
    httpClient.baseUrl = AppConstants.apiEndPointLogin;
  }

  @override
  Future<Response> getOrderConfirmationProvider(
      {required String endPoint}) {
    print("url -> " + httpClient.baseUrl.toString() + endPoint);
    return get(endPoint, headers: {
      "Content-type": "application/json",
      "Authorization": AppConstants.adminToken
    });
    // TODO: implement getOrderConfirmationProvider
    throw UnimplementedError();
  }
}
