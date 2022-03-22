import 'package:get/get.dart';
import '../../../data/model/Home/menu_model.dart';
import '../../app_constants.dart';

abstract class ISearchProvider {
  Future<Response<MenuModel>> getMenuResponseProvider(
      {required String endPoint});
}

class SearchAPIProvider extends GetConnect implements ISearchProvider {
  @override
  void onInit() {
    httpClient.defaultDecoder = (val) => MenuModel.fromJson(val);
    httpClient.baseUrl = AppConstants.apiEndPointLogin;
  }

  @override
  Future<Response<MenuModel>> getMenuResponseProvider(
      {required String endPoint}) {
    print("url -> " + httpClient.baseUrl.toString() + endPoint);
    return get(endPoint, headers: {
      "Content-type": "application/json",
      "Authorization": AppConstants.defaultToken
    });
    // TODO: implement getMenuResponseProvider
    throw UnimplementedError();
  }

  Future<Response> getBannerListAPIResponseProvider(
      {required String endPoint}) {
    print("url -> " + httpClient.baseUrl.toString() + endPoint);
    return get(endPoint, headers: {
      "Content-type": "application/json",
      "Authorization": AppConstants.defaultToken
    });
  }
}
