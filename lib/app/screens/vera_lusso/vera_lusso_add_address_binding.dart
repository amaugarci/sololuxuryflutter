import 'package:get/get.dart';

import 'vera_lusso_add_address_controller.dart';

class VeraLussoAddAddressBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VeraLussoAddAddressController());
  }
}
