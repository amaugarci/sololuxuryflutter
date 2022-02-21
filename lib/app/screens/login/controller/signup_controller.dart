import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:solo_luxury/utils/common_methods.dart';
import 'package:solo_luxury/utils/repository/network_repository.dart';

class SignupController extends GetxController {
  NetworkRepository networkRepository = NetworkRepository();

  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> firstNameController = TextEditingController().obs;
  Rx<TextEditingController> lastNameController = TextEditingController().obs;
  Rx<TextEditingController> dateOfBirthController = TextEditingController().obs;
  Rx<TextEditingController> marriageAnniversaryController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> confirmPasswordController = TextEditingController().obs;

  RxBool newsLetter = false.obs;

  static final dataStorage = GetStorage();

  Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;

  registerUser(context, formKey) async {
    if (formKey.currentState!.validate()) {
      final authUserData = {
        "password": passwordController.value.text.trim(),
        "username": emailController.value.text.trim(),

      };
      dynamic authResponse =
          await networkRepository.userLogin(context, authUserData);
      printLog(authResponse);

      // checkLoginData(authResponse, context);
    } else {}
  }
}
