import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:solo_luxury/utils/common_methods.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/login_api_repository.dart';
import 'package:solo_luxury/utils/repository/network_repository.dart';

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

      loginResponseModel = (await loginAPIRepository.getLoginAPIResponse(jsonEncode(authUserData), emailController.value.text.trim(), passwordController.value.text.trim())).obs;

      log("loginResponseModel : $loginResponseModel");
    } else {}
  }
}