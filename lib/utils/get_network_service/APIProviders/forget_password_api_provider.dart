import 'dart:convert';

import 'package:get/get.dart';
import 'package:solo_luxury/main.dart';
import 'package:solo_luxury/utils/app_constants.dart';
import 'package:solo_luxury/utils/store_info/local_store.dart';

abstract class IForgetPasswordProvider {
  Future<Response<String>> getForgetPasswordProvider(
      {required String urlPath, required String forgetPasswordRequestJson});
}

class ForgetPasswordAPIProvider extends GetConnect implements IForgetPasswordProvider {
  @override
  void onInit() {
    httpClient.defaultDecoder = (val) => jsonEncode(val);
    httpClient.baseUrl = AppConstants.forgetPasswordEndPoint;
  }

  @override
  Future<Response<String>> getForgetPasswordProvider(
      {required String urlPath, required String forgetPasswordRequestJson}) {
    print("url -> " + httpClient.baseUrl.toString() + urlPath);
    return put(urlPath, forgetPasswordRequestJson,
        headers: {"Authorization": localStore.customerToken});
    // TODO: implement getForgetPasswordProvider
    throw UnimplementedError();
  }
}
