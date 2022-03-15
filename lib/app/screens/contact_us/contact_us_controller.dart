import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/data/model/contact_us_response_model.dart';

import '../../../utils/get_network_service/APIRepository/contact_us_api_repository.dart';
import '../../../utils/lang_directory/language_constant.dart';

class ContactUsController extends GetxController {
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;
  RxInt index = 0.obs;
  final ContactUsAPIRepository contactUsAPIRepository;

  ContactUsController({required this.contactUsAPIRepository});

  RxString chosenValue = LanguageConstant.typeOfEnquiryText.tr.obs;

  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> surnameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> confirmEmailController =
      TextEditingController().obs;
  Rx<TextEditingController> subjectController = TextEditingController().obs;
  Rx<TextEditingController> onyourmindController = TextEditingController().obs;

  RxString chosenCountry = 'Admin'.obs;

  List<String> data = [
    LanguageConstant.typeOfEnquiryText.tr,
    LanguageConstant.deliveryText.tr,
    LanguageConstant.ordersText.tr,
    LanguageConstant.paymentText.tr,
    LanguageConstant.productText.tr,
    LanguageConstant.promotionText.tr,
    LanguageConstant.returnsContactText.tr,
    LanguageConstant.shippingText.tr,
    LanguageConstant.technicalText.tr,
  ];
  Rx<ContactUsResponseModel> contactUsResponseModel =
      ContactUsResponseModel().obs;

  @override
  void onInit() {
    super.onInit();
  }

  contactUsPost() async {
    contactUsResponseModel =
        (await contactUsAPIRepository.getContactUsApiResponse(
                jsonEncode(''),
                '10000',
                chosenCountry.value,
                subjectController.value.text,
                onyourmindController.value.text,
                'mobile',
                '1234567890',
                chosenValue.value,
                emailController.value.text,
                nameController.value.text,
                surnameController.value.text))
            .obs;
    print("contactUsResponseModel -> "+contactUsResponseModel.toString());
  }
}
