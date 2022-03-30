import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/main.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/forget_password_menu_api_repository.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';

class ForgetPasswordMenuController extends GetxController {
  RxString screenTitle = LanguageConstant.forgotYourPasswordText.tr.obs;
  final ForgetPasswordMenuAPIRepository forgetPasswordAPIRepository;

  ForgetPasswordMenuController({required this.forgetPasswordAPIRepository});

  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<String> forgetPasswordResponseModel = "".obs;
  Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;

  @override
  void onInit() {
    print("INTSTATE");
    // TODO: implement onInit
    super.onInit();
  }



  getForgetPasswordResponse({required BuildContext context,var email}) async {
    final userData = {
      "email": email,
      "template": "email_reset",
      "websiteId": localStore.website_id
    };
    print("INTSTATE123455");
    forgetPasswordResponseModel =
        (await forgetPasswordAPIRepository.putForgetPasswordApiResponse(
                forgetPasswordRequestJson: jsonEncode(userData)))
            .obs;
    log("loginResponseModel : $forgetPasswordResponseModel");
  }
}
