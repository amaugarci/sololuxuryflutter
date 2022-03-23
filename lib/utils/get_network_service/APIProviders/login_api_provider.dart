import 'dart:convert';

import 'package:get/get.dart';
import 'package:solo_luxury/utils/app_constants.dart';

import '../../../config/global_config.dart';

abstract class ILoginProvider {
  Future<Response<String>> getLoginResponseProvider({required String urlPath,required String userName,required String password, required String loginRequestJson});
}

class LoginProvider extends GetConnect implements ILoginProvider {




  @override
  void onInit() {

    httpClient.defaultDecoder = (val) => jsonEncode(val);
    httpClient.baseUrl = AppConstants.apiEndPointLogin;
    httpClient.timeout = Duration(seconds: 60);
  }


  @override
  Future<Response<String>> getLoginResponseProvider({required String urlPath,required String userName,required String password, required String loginRequestJson}) {
    // TODO: implement getLoginResponseProvider
    print("url -> " + httpClient.baseUrl.toString() + urlPath);
    return post(urlPath + "?" + "username=" + userName + "&" + "password=" + password, "", headers: {"Content-type" : "application/json","Authorization" : AppConstants.adminToken});
  }

}