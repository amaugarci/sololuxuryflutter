import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:solo_luxury/utils/common_methods.dart';
import 'package:solo_luxury/utils/repository/network_repository.dart';

class SignupController extends GetxController {
  NetworkRepository networkRepository = NetworkRepository();
  TextEditingController emailController = TextEditingController();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController marriageAnniversaryController = TextEditingController();
  RxBool newsLetter = false.obs;
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  static final dataStorage = GetStorage();

  registerUser(context, formKey) async {
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
