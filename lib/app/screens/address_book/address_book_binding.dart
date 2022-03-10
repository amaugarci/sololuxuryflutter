import 'package:get/get.dart';

import 'address_book_controller.dart';

class AddressBookBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddressBookController());
  }
}
