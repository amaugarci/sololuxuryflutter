import 'dart:convert';

import 'package:solo_luxury/utils/app_constants.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/login_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/repository_adapter.dart';

import '../../validator.dart';

class LoginAPIRepository implements ILoginRepository {

  final ILoginProvider provider;

  LoginAPIRepository({required this.provider});

  @override
  Future<dynamic> getLoginAPIResponse(String loginRequestJson, String userName, String password) async {
    final loginResponseModel = await provider.getLoginResponseProvider(urlPath: AppConstants.login, userName: userName, password: password, loginRequestJson: loginRequestJson);

    if(loginResponseModel.status.hasError) {
      print("error -> ");
      print(loginResponseModel.statusText!);
      Validators.apiResponseMessage(body: jsonEncode(loginResponseModel.body!), message: loginResponseModel.statusText);
      return null;
    } else {
      print("success -> ");
      return loginResponseModel.body!;
    }
  }

  @override
  Future<dynamic> getUserDetailAPIResponse(String userToken) async {
    final loginResponseModel = await provider.getUserDetailResponseProvider(urlPath: AppConstants.addressList, userToken: userToken);

    if(loginResponseModel.status.hasError) {
      print("error -> ");
      print(loginResponseModel.statusText!);
      Validators.apiResponseMessage(body: jsonEncode(loginResponseModel.body!), message: loginResponseModel.statusText);
      return null;
    } else {
      print("success -> ");
      return loginResponseModel.body!;
    }
  }
}