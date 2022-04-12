import 'package:get/get.dart';

import 'country_screen_controller.dart';

class CountryPopUpScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CountryPopUpScreenController());
  }
}
