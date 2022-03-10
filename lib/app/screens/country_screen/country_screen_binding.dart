import 'package:get/get.dart';

import 'country_screen_controller.dart';

class CountryScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CountryScreenController());
  }
}
