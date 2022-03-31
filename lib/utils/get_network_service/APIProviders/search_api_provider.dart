import 'dart:convert';

import 'package:get/get.dart';
import 'package:solo_luxury/data/model/search/get_product_data_model.dart';
import 'package:solo_luxury/data/model/search/search_model.dart';
import '../../../data/model/Home/menu_model.dart';
import '../../app_constants.dart';

abstract class ISearchProvider {
  Future<Response<MenuModel>> getMenuResponseProvider(
      {required String endPoint});

/* Future<Response<SearchModel>> getSearchResponseProvider(
      {required String endPoint});*/
}

class SearchAPIProvider extends GetConnect implements ISearchProvider {
  @override
  void onInit() {}

  @override
  Future<Response<MenuModel>> getMenuResponseProvider(
      {required String endPoint}) {
    httpClient.baseUrl = AppConstants.apiEndPointLogin;
    httpClient.defaultDecoder = (val) => MenuModel.fromJson(val);
    print("url -> " + httpClient.baseUrl.toString() + endPoint);
    return get(endPoint, headers: {
      "Content-type": "application/json",
      "Authorization": AppConstants.defaultToken
    });
    // TODO: implement getMenuResponseProvider
    throw UnimplementedError();
  }

  /*Future<Response> getBannerListAPIResponseProvider(
      {required String endPoint}) {
    httpClient.baseUrl = AppConstants.apiEndPointLogin;
    print("url -> " + httpClient.baseUrl.toString() + endPoint);
    return get(endPoint, headers: {
      "Content-type": "application/json",
      "Authorization": AppConstants.defaultToken
    });
  }*/

  Future<Response<SearchModel>> getSearchResponseProvider(
      {required String endPoint}) {
    httpClient.baseUrl = AppConstants.apiEndPointBrand;
    httpClient.defaultDecoder = (val) => SearchModel.fromJson(val);
    print("url -> " + httpClient.baseUrl.toString() + endPoint);
    return get(endPoint, headers: {
      "Content-type": "application/json",
      "Authorization": "Bearer u75tnrg0z2ls8c4yubonwquupncvhqie"
    });
    // TODO: implement getSearchResponseProvider
    throw UnimplementedError();
  }

  Future<Response<ProductDetailsModel>> getSearchProductResponseProvider(
      {required String endPoint}) {
    httpClient.defaultDecoder = (val) => ProductDetailsModel.fromJson(val);
    httpClient.baseUrl = AppConstants.apiEndPointBrand;
    print("url -> " + httpClient.baseUrl.toString() + endPoint);
    return get(endPoint, headers: {
      "Content-type": "application/json",
      "Authorization": AppConstants.adminToken
    });
    // TODO: implement getSearchResponseProvider
    throw UnimplementedError();
  }
}
