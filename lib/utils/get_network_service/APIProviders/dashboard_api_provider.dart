import 'package:get/get.dart';

import '../../../data/model/Home/menu_model.dart';
import '../../app_constants.dart';
import '../repository_adapter.dart';


abstract class IDashboardProvider {
  Future<Response<MenuModel>> getMenuResponseProvider({required String endPoint});
}


class DashboardAPIProvider extends GetConnect implements IDashboardProvider {

  @override
  void onInit() {
    httpClient.defaultDecoder = (val) => MenuModel.fromJson(val);
    httpClient.baseUrl = AppConstants.apiEndPointLogin;
  }

  @override
  Future<Response<MenuModel>> getMenuResponseProvider({required String endPoint}) {
    print("url -> " + httpClient.baseUrl.toString() + endPoint);
    return get(endPoint,  headers: {"Content-type" : "application/json", "Authorization" : AppConstants.defaultToken});
  }

}