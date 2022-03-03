import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:solo_luxury/data/model/signup_request_model.dart';
import 'package:solo_luxury/data/model/signup_response_model.dart';
import 'package:solo_luxury/utils/common_methods.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/signup_api_repository.dart';
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

  Rx<SignUpResponseModel> signUpResponseModel = SignUpResponseModel().obs;

  final SignupAPIRepository signupAPIRepository;

  SignupController({required this.signupAPIRepository});

  registerUser(context, formKey) async {
    if (formKey.currentState!.validate()) {

      if(newsLetter.value) {

        SignUpRequestModel signUpRequestModel = SignUpRequestModel(
          customer: Customer(
            addresses: [
            ],
            firstname: firstNameController.value.text,
            lastname: lastNameController.value.text,
            email: emailController.value.text.trim(),
            websiteId: 1
          ),
          password: passwordController.value.text.trim(),
        );

        signUpResponseModel = (await signupAPIRepository.getSignupAPIResponse(jsonEncode(signUpRequestModel))).obs;
        
        log("signUpResponseModel : ${signUpResponseModelToJson(signUpResponseModel.value)}");


      } else {
        Get.snackbar("Alert", "Please agree for newsletter");
      }


    } else {}
  }
}
