import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:solo_luxury/data/model/signup_request_model.dart';
import 'package:solo_luxury/data/model/signup_response_model.dart';
import 'package:solo_luxury/utils/common_methods.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/forgot_password_api_repository.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/signup_api_repository.dart';
import 'package:solo_luxury/utils/repository/network_repository.dart';

class ForgotPasswordPageController extends GetxController {
  NetworkRepository networkRepository = NetworkRepository();

  Rx<TextEditingController> emailController = TextEditingController().obs;

  RxBool newsLetter = false.obs;

  static final dataStorage = GetStorage();

  Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;
  Rx<String> forgotpasswordResponseModel = "".obs;

  final ForgotPasswordAPIRepository forgotpasswordAPIRepository;

  ForgotPasswordPageController({required this.forgotpasswordAPIRepository});


  forgotpasswordUser( {required BuildContext context}) async {
    if (formKey.value.currentState!.validate()) {
      final authUserData = {
        "username": emailController.value.text.trim(),
      };

      log("authUserData : $authUserData");

      forgotpasswordResponseModel = (await forgotpasswordAPIRepository.getForgotpasswordAPIResponse(jsonEncode(authUserData), emailController.value.text.trim(),)).obs;

      log("forgotpasswordResponseModel : $forgotpasswordResponseModel");
    } else {}
  }

}
