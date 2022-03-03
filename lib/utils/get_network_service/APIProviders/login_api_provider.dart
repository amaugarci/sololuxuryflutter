import 'dart:convert';

import 'package:get/get.dart';
import 'package:solo_luxury/utils/app_constants.dart';

import '../../../config/global_config.dart';

abstract class ILoginProvider {
  Future<Response<String>> getLoginResponseProvider({required String urlPath,required String userName,required String password, required String loginRequestJson});
}

class LoginProvider extends GetConnect implements ILoginProvider {

  Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    'Authorization': 'Bearer $token',
  };


  @override
  void onInit() {

    httpClient.defaultDecoder = (val) => jsonEncode(val);
    httpClient.baseUrl = AppConstants.apiEndPoint;
  }


  @override
  Future<Response<String>> getLoginResponseProvider({required String urlPath,required String userName,required String password, required String loginRequestJson}) {
    // TODO: implement getLoginResponseProvider
    return post(urlPath + "?" + "username=" + userName + "&" + "password=" + password, "", headers: {"Content-type" : "application/json", "Authorization" : AppConstants.defaultToken});
  }

}