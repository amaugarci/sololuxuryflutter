import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'contact_us_controller.dart';

class ContactUsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContactUsController());
  }
}
