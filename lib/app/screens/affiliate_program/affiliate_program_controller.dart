import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/utils/lang_directory/language_constant.dart';

class AffiliateProgramController extends GetxController {

  RxString screenTitle = "".obs;

  Rx<Color> backColor = const Color(0XFFF9EAE3).obs;

  Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;

  RxString selectedValue = "Mr.".obs;

  Rx<TextEditingController> firstNameController = TextEditingController().obs;
  Rx<FocusNode> focusNode = FocusNode().obs;

  Rx<TextEditingController> lastNameController = TextEditingController().obs;
  Rx<FocusNode> lastNameFocusNode = FocusNode().obs;

  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<FocusNode> emailFocusNode = FocusNode().obs;

  Rx<TextEditingController> contactNoController = TextEditingController().obs;
  Rx<FocusNode> contactNoFocusNode = FocusNode().obs;

  Rx<TextEditingController> websiteController = TextEditingController().obs;
  Rx<FocusNode> websiteNoFocusNode = FocusNode().obs;

  Rx<TextEditingController> addressOneController = TextEditingController().obs;
  Rx<FocusNode> addressOneFocusNode = FocusNode().obs;

  Rx<TextEditingController> addressTwoController = TextEditingController().obs;
  Rx<FocusNode> addressTwoFocusNode = FocusNode().obs;

  Rx<TextEditingController> postCodeController = TextEditingController().obs;
  Rx<FocusNode> postCodeFocusNode = FocusNode().obs;

  RxString selectedVisitorValue = LanguageConstant.visitorMonthHintText.tr.obs;
  RxString selectedViewsValue = LanguageConstant.viewsMonthHintText.tr.obs;
  RxString cityValue = LanguageConstant.cityHintText.tr.obs;
  RxString countryValue = LanguageConstant.countryHintText.tr.obs;

  @override
  void onInit() {
    screenTitle.value = LanguageConstant.affiliateProgramTitleText.tr;
    super.onInit();
  }

}