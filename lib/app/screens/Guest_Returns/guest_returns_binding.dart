import 'package:get/get.dart';

import 'guest_returns_controller.dart';

class GuestReturnsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GuestReturnsController());
  }
}
