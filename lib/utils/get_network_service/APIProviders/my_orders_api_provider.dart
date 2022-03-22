import 'package:get/get.dart';
import 'package:solo_luxury/data/model/MyOrders/MyOrdersData.dart';

import '../../../data/model/Product/product_model.dart';
import '../../app_constants.dart';

abstract class IMyOrdersListProvider {
  Future<Response<MyOrdersData>> getMyOrdersListResponseProvider({required String endPoint});
}

class MyOrdersListAPIProvider extends GetConnect implements IMyOrdersListProvider {

  @override
  void onInit() {
    httpClient.defaultDecoder = (val) => MyOrdersData.fromJson(val);
    httpClient.baseUrl = AppConstants.apiEndPointLogin;
  }

  @override
  Future<Response<MyOrdersData>> getMyOrdersListResponseProvider({required String endPoint}) {
    print("url -> " + httpClient.baseUrl.toString() + endPoint);
    return get(endPoint,  headers: {"Content-type" : "application/json", "Authorization" : AppConstants.adminToken});
  }


}