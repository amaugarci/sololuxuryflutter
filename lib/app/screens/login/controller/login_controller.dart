import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:solo_luxury/app/components/storage_constant.dart';
import 'package:solo_luxury/app/db/shared_pref.dart';
import 'package:solo_luxury/main.dart';
import 'package:solo_luxury/utils/common_methods.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/login_api_repository.dart';
import 'package:solo_luxury/utils/repository/network_repository.dart';

import '../../../../utils/app_routes.dart';

class LoginController extends GetxController {
  NetworkRepository networkRepository = NetworkRepository();
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  RxBool isRemember = true.obs;
  static final dataStorage = GetStorage();

  Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;
  Rx<String> loginResponseModel = "".obs;

  final LoginAPIRepository loginAPIRepository;

  LoginController({required this.loginAPIRepository});

  loginUser( {required BuildContext context}) async {
    if (formKey.value.currentState!.validate()) {
      final authUserData = {
        "username": emailController.value.text.trim(),
        "password": passwordController.value.text.trim(),
      };

      log("authUserData : $authUserData");
      var data = (await loginAPIRepository.getLoginAPIResponse(jsonEncode(authUserData), emailController.value.text.trim(), passwordController.value.text.trim()));
      if(data!= null){
        String dataString = jsonEncode(data);
        loginResponseModel.value = dataString;
        loginResponseModel.value = loginResponseModel.value.replaceAll('"', "");
        await setPrefStringValue(StorageConstant.authToken, loginResponseModel.value);
        await localStore.getToken();
        Get.offAllNamed(RoutesConstants.dashboardScreen);
      }
      log("loginResponseModel : $loginResponseModel");
    } else {}
  }
}
