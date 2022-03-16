import 'package:get/get.dart';

import '../../app_constants.dart';

abstract class IFaqProvider {
  Future<Response<String>> getFaqResponseProvider({required String endPoint});
}

class FaqProvider extends GetConnect implements IFaqProvider {

  @override
  void onInit() {
    httpClient.defaultDecoder = (val) => val;
    httpClient.baseUrl = AppConstants.apiEndPointLogin;
  }

  @override
  Future<Response<String>> getFaqResponseProvider({required String endPoint}) {
    print("url -> " + httpClient.baseUrl.toString() + endPoint);
    return get(endPoint,  headers: {"Content-type" : "application/json", "Authorization" : AppConstants.adminToken});
  }

}