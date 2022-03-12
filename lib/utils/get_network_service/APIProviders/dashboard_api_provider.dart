import 'package:get/get.dart';

import '../../../data/model/Home/menu_model.dart';
import '../../app_constants.dart';
import '../repository_adapter.dart';


abstract class IHomeProvider {
  Future<Response<MenuModel>> getMenuResponseProvider({required String endPoint});
}


class DashboardAPIProvider extends GetConnect implements IDashboardRepository {

  @override
  void onInit() {
    httpClient.defaultDecoder = (val) => MenuModel.fromJson(val);
    httpClient.baseUrl = AppConstants.apiEndPointNew;
  }

  @override
  Future<Response<MenuModel>> getMenuResponseProvider({required String endPoint}) {
    print("url -> " + httpClient.baseUrl.toString() + endPoint);
    return get(endPoint,  headers: {"Content-type" : "application/json", "Authorization" : AppConstants.defaultToken});
  }

  @override
  Future<MenuModel> getMenuAPIResponse() {
    // TODO: implement getMenuAPIResponse
    throw UnimplementedError();
  }

}