import 'package:get/get.dart';

import 'my_tickets_controller.dart';

class MyTicketsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyTicketsController());
  }
}
