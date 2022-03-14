import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/get_network_service/APIRepository/contact_us_api_repository.dart';

class ContactUsController extends GetxController {
  Rx<GlobalKey<ScaffoldState>> scaffoldKey = GlobalKey<ScaffoldState>().obs;
  RxInt index = 0.obs;
  final ContactUsAPIRepository contactUsAPIRepository;
  ContactUsController({required this.contactUsAPIRepository});



  
  @override
  void onInit() {
    super.onInit();
  }
}
