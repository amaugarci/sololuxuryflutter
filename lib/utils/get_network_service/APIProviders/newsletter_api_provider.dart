
import 'package:get/get.dart';

import '../../app_constants.dart';

abstract class INewsLetterProvider {
  Future<Response<SignUpResponseModel>> getSignupResponseProvider({required String urlPath, required String signupRequestJson});
}

class NewsLetterAPIProvider extends GetConnect implements INewsLetterProvider {

  @override
  void onInit() {
    httpClient.defaultDecoder = (val) => SignUpResponseModel.fromJson(val);
    httpClient.baseUrl = AppConstants.apiEndPointLogin;
  }

  @override
  Future<Response<SignUpResponseModel>> getNewsLetterResponseProvider({required String urlPath, required String newsLetterRequestJson}) {
    print("newsLetterRequestJson -> " + newsLetterRequestJson);
    print("urlPath -> "+urlPath);
    return post(urlPath, newsLetterRequestJson, headers: {"Content-type" : "application/json","Authorization" : AppConstants.adminToken});
  }

}