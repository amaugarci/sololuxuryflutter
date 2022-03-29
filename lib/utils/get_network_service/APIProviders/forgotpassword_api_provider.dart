/*
import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/http/utils/body_decoder.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import '../../../config/global_config.dart';
import '../../app_constants.dart';

abstract class IForgotpasswordProvider{
  Future<Response<String>> getForgotpasswordResponseProvider({required String urlPath,required String emailaddress,});

}

class ForgotPasswordProvider extends GetConnect implements IForgotpasswordProvider{

  Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
    'Authorization': 'Bearer $forgotpasstoken',
  };

  @override
  void onInit() {

    httpClient.defaultDecoder = (val) => jsonEncode(val);
    httpClient.baseUrl = AppConstants.apiEndPointNew1;
  }

  @override
  Future<Response<String>> getForgotpasswordResponseProvider({required String urlPath, required String emailaddress}){
    // TODO: implement getForgotpasswordResponseProvider
    
    return put(urlPath,emailaddress,);
        
  }


}*/
