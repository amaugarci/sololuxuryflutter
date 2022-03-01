import 'package:get/get.dart';

import 'add_address_controller.dart';

class AddAdressBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddAdressController());
  }
}
