import 'dart:convert';

import 'package:get/get.dart';
import 'package:solo_luxury/data/model/brand_list/BrandData.dart';

import '../../app_constants.dart';

abstract class IBrandListProvider {
  Future<Response<List<BrandData>>> getBrandListResponseProvider({required String endPoint});
}

class BrandListProvider extends GetConnect implements IBrandListProvider {

  @override
  void onInit() {
    httpClient.defaultDecoder = (val) => jsonEncode(val);
    httpClient.baseUrl = AppConstants.apiEndPointLogin;
  }

  @override
  Future<Response<List<BrandData>>> getBrandListResponseProvider({required String endPoint}) {
    print("url -> " + httpClient.baseUrl.toString() + endPoint);
    return get(endPoint,  headers: {"Content-type" : "application/json", "Authorization" : AppConstants.adminToken});
  }

}