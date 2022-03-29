import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/main.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/forget_password_menu_api_repository.dart';

class ForgetPasswordMenuController extends GetxController {
  final  ForgetPasswordMenuAPIRepository forgetPasswordAPIRepository;

  ForgetPasswordMenuController({required this.forgetPasswordAPIRepository});

  Rx<String> forgetPasswordResponseModel = "".obs;
  Rx<GlobalKey> formKey = GlobalKey<FormState>().obs;

  @override
  void onInit() {
    print("INTSTATE");
    getForgetPasswordResponse();
    // TODO: implement onInit
    super.onInit();
  }

  final userData = {
    "email": "anilpawar1410@gmail.com",
    "template": "email_reset",
    "websiteId": localStore.website_id
  };

  getForgetPasswordResponse() async {
    print("INTSTATE123455");
    forgetPasswordResponseModel = (await forgetPasswordAPIRepository
            .putForgetPasswordApiResponse(
                forgetPasswordRequestJson: jsonEncode(userData)))
        .obs;
    log("loginResponseModel : $forgetPasswordResponseModel");
  }
}
