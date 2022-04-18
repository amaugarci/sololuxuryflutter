// ignore_for_file: invalid_use_of_protected_member

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/refer_friend_api_repository.dart';

import '../../components/common_widget/common_text_poppins.dart';

class ReferFriendController extends GetxController {
  ReferFriendAPIRepository referFriendAPIRepository;
  TextEditingController refFirstNameController = TextEditingController();
  TextEditingController refEmailController = TextEditingController();
  TextEditingController refPhoneController = TextEditingController();
  TextEditingController yourFirstNameController = TextEditingController();
  TextEditingController yourEmailController = TextEditingController();
  TextEditingController yourPhoneController = TextEditingController();

  ReferFriendController({required this.referFriendAPIRepository});

  RxBool isSuccessfully = false.obs;
  RxString responseMsg = "".obs;

  @override
  void onInit() {
    super.onInit();
  }

  postData() async {
    var data = await referFriendAPIRepository.getReferFriendAPIResponse(
        refFirstName: refFirstNameController.text,
        refEmail: refEmailController.text,
        refPhone: refPhoneController.text,
        yourFirstName: yourFirstNameController.text,
        yourEmail: yourEmailController.text,
        yourPhone: yourPhoneController.text);
    if(data!=null){
      String dataString = jsonEncode(data);
      String message = jsonDecode(dataString)['message'];
      print("message---> $message");
      if(message.isNotEmpty){
        isSuccessfully.value = true;
        responseMsg.value = message;
      }
    }

    // ScaffoldMessenger.of(Get.context!).showSnackBar(
    //   SnackBar(content: CommonTextPoppins(message)),
    // );
  }
}
