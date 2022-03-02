import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:solo_luxury/utils/common_methods.dart';
import 'package:solo_luxury/utils/repository/network_repository.dart';

class LoginController extends GetxController {
  NetworkRepository networkRepository = NetworkRepository();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isRemember = true.obs;
  static final dataStorage = GetStorage();

  loginUser(context, formKey) async {
    if (formKey.currentState!.validate()) {
      final authUserData = {
        "username": emailController.text.trim(),
        "password": passwordController.text.trim(),
      };
      dynamic authResponse =
          await networkRepository.userLogin(context, authUserData);
      printLog(authResponse);

      // checkLoginData(authResponse, context);
    } else {}
  }
}
