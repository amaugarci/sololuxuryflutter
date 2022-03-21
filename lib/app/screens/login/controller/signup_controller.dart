import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:solo_luxury/app/components/storage_constant.dart';
import 'package:solo_luxury/app/db/shared_pref.dart';
import 'package:solo_luxury/data/model/signup_request_model.dart';
import 'package:solo_luxury/data/model/signup_response_model.dart';
import 'package:solo_luxury/utils/app_constants.dart';
import 'package:solo_luxury/utils/common_methods.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/signup_api_repository.dart';
import 'package:solo_luxury/utils/repository/network_repository.dart';

class SignupController extends GetxController {
  NetworkRepository networkRepository = NetworkRepository();

  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> firstNameController = TextEditingController().obs;
  Rx<TextEditingController> lastNameController = TextEditingController().obs;
  Rx<TextEditingController> dateOfBirthController = TextEditingController().obs;
  Rx<TextEditingController> marriageAnniversaryController =
      TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> confirmPasswordController =
      TextEditingController().obs;
  RxBool newsLetter = false.obs;

  static final dataStorage = GetStorage();

  Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;

  Rx<SignUpResponseModel> signUpResponseModel = SignUpResponseModel().obs;

  final SignupAPIRepository signupAPIRepository;

  SignupController({required this.signupAPIRepository});

  registerUser(context, formKey) async {
    if (formKey.currentState!.validate()) {
      if (newsLetter.value) {
        /*{"customer":{"email":"custom799@gmail.com","firstname":"bb","lastname":"bb","website_id":151,"addresses":[], "dob":"05/05/1990","extension_attributes": {
    "dom":"05/05/1990"
    }},"password":"123456789a@A"}*/

        /*{
          "customer"
    :{"email":"custom799@gmail.com","firstname":"bb","lastname":"bb","website_id":151,"addresses":[], "dob":"05/05/1990","extension_attributes": {
    "dom":"05/05/1990"
    }},"password":"123456789a@A"}*/

        SignUpRequestModel signUpRequestModel = SignUpRequestModel(
          customer: Customer(
            addresses: [],
            firstname: firstNameController.value.text,
            lastname: lastNameController.value.text,
            email: emailController.value.text.trim(),
            websiteId: AppConstants.websiteId,
            dob: dateOfBirthController.value.text,
            extensionAttributes: RequestExtensionAttributes(
              dom: marriageAnniversaryController.value.text,
            ),
          ),
          password: passwordController.value.text.trim(),
        );

        signUpResponseModel = (await signupAPIRepository
                .getSignupAPIResponse(jsonEncode(signUpRequestModel)))
            .obs;

        setPrefStringValue(StorageConstant.userDatModel,
            signUpResponseModelToJson(signUpResponseModel.value));

        log("signUpResponseModel : ${signUpResponseModelToJson(signUpResponseModel.value)}");
      } else {
        Get.snackbar("Alert", "Please agree for newsletter");
      }
    } else {}
  }
}
