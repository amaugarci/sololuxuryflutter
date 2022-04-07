import 'dart:convert';
import 'package:get/get.dart';
import 'package:solo_luxury/app/screens/product_detail/option/option_model.dart';
import '../../../data/model/Product/product_model.dart';
import '../../app_constants.dart';

abstract class IProductListProvider {
  Future<Response<ProductModel>> getProductListResponseProvider({required String endPoint});
  Future<Response<ProductModel>> getSortedProductListResponseProvider({required String endPoint});
  Future<Response> getOptionsListResponseProvider({required String endPoint});
  Future<Response> getFilterListResponseProvider({required String endPoint});
}

class ProductListProvider extends GetConnect implements IProductListProvider {

  @override
  void onInit() {
    httpClient.baseUrl = AppConstants.apiEndPointLogin;
  }

  @override
  Future<Response<ProductModel>> getProductListResponseProvider({required String endPoint}) {
    print("url -> " + httpClient.baseUrl.toString() + endPoint);
    httpClient.defaultDecoder = (val) => ProductModel.fromJson(val);
    return get(endPoint,  headers: {"Content-type" : "application/json", "Authorization" : AppConstants.adminToken});
  }

  @override
  Future<Response<ProductModel>> getSortedProductListResponseProvider({required String endPoint}) {
    print("url -> " + httpClient.baseUrl.toString() + endPoint);
    httpClient.defaultDecoder = (val) => ProductModel.fromJson(val);
    return get(endPoint,  headers: {"Content-type" : "application/json", "Authorization" : AppConstants.adminToken});
  }

  @override
  Future<Response> getFilterListResponseProvider ({required String endPoint}) {
    print("url -> " + httpClient.baseUrl.toString() + endPoint);
    httpClient.defaultDecoder = (val) => jsonEncode(val);
    return get(endPoint,  headers: {"Content-type" : "application/json", "Authorization" : AppConstants.adminToken});
  }

  @override
  Future<Response> getOptionsListResponseProvider({required String endPoint}) {
    print("url -> " + httpClient.baseUrl.toString() + endPoint);
    httpClient.defaultDecoder = (val) => jsonEncode(val);
    return get(endPoint,  headers: {"Content-type" : "application/json", "Authorization" : AppConstants.adminToken});
  }

}