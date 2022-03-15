import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solo_luxury/utils/get_network_service/APIProviders/contact_us_api_provider.dart';
import 'package:solo_luxury/utils/get_network_service/APIRepository/contact_us_api_repository.dart';

import 'contact_us_controller.dart';

class ContactUsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContactUsController(contactUsAPIRepository: Get.find()));
    Get.lazyPut<ContactUsAPIProvider>(() => ContactUsAPIProvider());
    Get.put(ContactUsAPIRepository(contactUsAPIProvider: Get.find()));
  }
}
